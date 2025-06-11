using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace Faunaa
{
    public partial class AdoptionForm : System.Web.UI.Page
    {
        private readonly string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\bhvvh\onedrive\documents\visual studio 2010\Projects\Faunaa\Faunaa\App_Data\db.mdf;Integrated Security=True;User Instance=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPetDetails();
            }
        }

        private void LoadPetDetails()
        {
            try
            {
                string petId = Request.QueryString["PetId"];
                System.Diagnostics.Debug.WriteLine(string.Format("Loading pet with ID: {0}", petId));

                if (string.IsNullOrEmpty(petId))
                {
                    ShowError("No Pet selected for adoption.");
                    return;
                }

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = @"SELECT PetName, Type, Breed, Age, Gender, Description, Status 
                                   FROM Pets 
                                   WHERE PetId = @PetId";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@PetId", petId);

                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            string petStatus = reader["Status"].ToString();

                            if (petStatus != "Available")
                            {
                                ShowError("This pet is not available for adoption at the moment.");
                                return;
                            }

                            string petName = reader["PetName"] == DBNull.Value ? "Unknown" : reader["PetName"].ToString();
                            string petType = reader["Type"] == DBNull.Value ? "Unknown" : reader["Type"].ToString();
                            string breed = reader["Breed"] == DBNull.Value ? "Unknown" : reader["Breed"].ToString();
                            string age = reader["Age"] == DBNull.Value ? "Unknown" : reader["Age"].ToString();
                            string gender = reader["Gender"] == DBNull.Value ? "Unknown" : reader["Gender"].ToString();
                            string description = reader["Description"] == DBNull.Value ? "No description available" : reader["Description"].ToString();

                            lblPetDetails.Text = string.Format(
                                "<div class='pet-details'>" +
                                "<h3>{0}</h3>" +
                                "<p class='pet-type'><strong>Type:</strong> {1}</p>" +
                                "<p class='pet-breed'><strong>Breed:</strong> {2}</p>" +
                                "<p class='pet-age'><strong>Age:</strong> {3} years</p>" +
                                "<p class='pet-gender'><strong>Gender:</strong> {4}</p>" +
                                "<p class='pet-description'>{5}</p>" +
                                "</div>",
                                petName, petType, breed, age, gender, description);

                            btnSubmit.Enabled = true;
                            lblMessage.Text = string.Empty;
                        }
                        else
                        {
                            ShowError("Invalid Pet ID or Pet not found.");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                LogError(ex);
                ShowError("An error occurred while loading pet details. Please try again later.");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowError("Please fill all required fields correctly.");
                return;
            }

            string petId = Request.QueryString["PetId"];
            if (string.IsNullOrEmpty(petId))
            {
                ShowError("Invalid pet selection.");
                return;
            }

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlTransaction transaction = conn.BeginTransaction())
                    {
                        try
                        {
                            // Verify pet availability
                            string checkQuery = "SELECT Status FROM Pets WHERE PetId = @PetId";
                            SqlCommand checkCmd = new SqlCommand(checkQuery, conn, transaction);
                            checkCmd.Parameters.AddWithValue("@PetId", petId);
                            string status = (string)checkCmd.ExecuteScalar();

                            if (status != "Available")
                            {
                                ShowError("This pet is no longer available for adoption.");
                                return;
                            }

                            string insertQuery = @"INSERT INTO AdoptionApplications 
                                (UserId, PetId, AdopterName, Email, Address, City, State, ZipCode, 
                                PrimaryContact, SecondaryContact, HomeResidents, TotalAdults, 
                                TotalChildren, TotalAnualIncome, HasCurrentPets, CurrentPetsList, 
                                PreviousPetExperience, ResidenceType, ResidenceOwnership, 
                                ResidenceYears, HasVeterinarian, FrequentTravel, 
                                ApplicationDate, Status) 
                                VALUES 
                                (@UserId, @PetId, @AdopterName, @Email, @Address, @City, @State, 
                                @ZipCode, @PrimaryContact, @SecondaryContact, @HomeResidents, 
                                @TotalAdults, @TotalChildren, @TotalAnualIncome, @HasCurrentPets, 
                                @CurrentPetsList, @PreviousPetExperience, @ResidenceType, 
                                @ResidenceOwnership, @ResidenceYears, @HasVeterinarian, 
                                @FrequentTravel, @ApplicationDate, @Status)";

                            SqlCommand insertCmd = new SqlCommand(insertQuery, conn, transaction);
                            AddApplicationParameters(insertCmd, petId);
                            insertCmd.ExecuteNonQuery();

                            string updateQuery = "UPDATE Pets SET Status = 'Pending' WHERE PetId = @PetId";
                            SqlCommand updateCmd = new SqlCommand(updateQuery, conn, transaction);
                            updateCmd.Parameters.AddWithValue("@PetId", petId);
                            updateCmd.ExecuteNonQuery();

                            // 🔹 Update the "adoption" count in DashboardMetrics
                            string updateMetricsQuery = "UPDATE DashboardMetrics SET MetricValue = MetricValue + 1 WHERE MetricName = 'adoption'";
                            SqlCommand updateMetricsCmd = new SqlCommand(updateMetricsQuery, conn, transaction);
                            updateMetricsCmd.ExecuteNonQuery();

                            transaction.Commit();
                            ShowSuccess("Your adoption application has been submitted successfully!");

                            Response.Redirect("ApplicationStatus.aspx");
                        }
                        catch (Exception)
                        {
                            transaction.Rollback();
                            throw;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                LogError(ex);
                ShowError("An error occurred while submitting your application. Please try again later.");
            }
        }

        private void AddApplicationParameters(SqlCommand cmd, string petId)
        {
            cmd.Parameters.AddWithValue("@UserId", Session["UserId"]);
            cmd.Parameters.AddWithValue("@PetId", petId);
            cmd.Parameters.AddWithValue("@AdopterName", txtAdopterName.Text.Trim());
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
            cmd.Parameters.AddWithValue("@City", txtCity.Text.Trim());
            cmd.Parameters.AddWithValue("@State", txtState.Text.Trim());
            cmd.Parameters.AddWithValue("@ZipCode", Convert.ToInt32(txtZipCode.Text.Trim()));
            cmd.Parameters.AddWithValue("@PrimaryContact", txtPrimaryContact.Text.Trim());
            cmd.Parameters.AddWithValue("@SecondaryContact", txtSecondaryContact.Text.Trim());
            cmd.Parameters.AddWithValue("@HomeResidents", txtHomeResidents.Text.Trim());
            cmd.Parameters.AddWithValue("@TotalAdults", Convert.ToInt32(txtTotalAdults.Text));
            cmd.Parameters.AddWithValue("@TotalChildren", Convert.ToInt32(txtTotalChildren.Text));
            cmd.Parameters.AddWithValue("@TotalAnualIncome", txtAnnualIncome.Text.Trim());
            cmd.Parameters.AddWithValue("@HasCurrentPets", rbHasPetsYes.Checked ? "Yes" : "No");
            cmd.Parameters.AddWithValue("@CurrentPetsList", txtCurrentPets.Text.Trim());
            cmd.Parameters.AddWithValue("@PreviousPetExperience", txtPreviousPets.Text.Trim());
            cmd.Parameters.AddWithValue("@ResidenceType", ddlResidenceType.SelectedValue);
            cmd.Parameters.AddWithValue("@ResidenceOwnership", rbOwn.Checked ? "Own" : "Rent");
            cmd.Parameters.AddWithValue("@ResidenceYears", Convert.ToInt32(txtResidenceYears.Text));
            cmd.Parameters.AddWithValue("@HasVeterinarian", rbVetYes.Checked ? "Yes" : "No");
            cmd.Parameters.AddWithValue("@FrequentTravel", rbTravelYes.Checked ? "Yes" : "No");
            cmd.Parameters.AddWithValue("@ApplicationDate", DateTime.Now);
            cmd.Parameters.AddWithValue("@Status", "Pending");
        }

        private void ShowError(string message)
        {
            lblMessage.Text = message;
            lblMessage.CssClass = "error-message";
        }

        private void ShowSuccess(string message)
        {
            lblMessage.Text = message;
            lblMessage.CssClass = "success-message";
        }

        private void LogError(Exception ex)
        {
            System.Diagnostics.Debug.WriteLine("Error in AdoptionForm: {ex.Message}");
            System.Diagnostics.Debug.WriteLine("Stack Trace: {ex.StackTrace}");
        }
    }
}
