using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.Net;
using System.Net.Mail;

namespace Faunaa
{
    public partial class AdminReview : System.Web.UI.Page
    {
        private readonly string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\bhvvh\onedrive\documents\visual studio 2010\Projects\Faunaa\Faunaa\App_Data\db.mdf;Integrated Security=True;User Instance=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadApplications();
            }
        }

        private void LoadApplications()
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = @"SELECT a.*, p.PetName, p.Type, p.Breed 
                                   FROM AdoptionApplications a 
                                   LEFT JOIN Pets p ON a.PetId = p.PetId 
                                   ORDER BY a.ApplicationDate DESC";
                    SqlCommand cmd = new SqlCommand(query, conn);

                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    rptApplications.DataSource = reader;
                    rptApplications.DataBind();
                }
            }
            catch (Exception ex)
            {
                ShowAlert("Error loading applications: " + ex.Message);
            }
        }

        private void ShowAlert(string message)
        {
            message = message.Replace("'", "\\'").Replace("\n", "\\n");
            ScriptManager.RegisterStartupScript(this, this.GetType(),
                "alert",
                "alert('" + message + "');",
                true);
        }

        protected void btnCheck_Command(object sender, CommandEventArgs e)
        {
            string applicationId = e.CommandArgument.ToString();
            CheckApplication(applicationId);
        }

        private void CheckApplication(string applicationId)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = @"SELECT a.*, p.PetName, p.Type, p.Breed 
                           FROM AdoptionApplications a 
                           LEFT JOIN Pets p ON a.PetId = p.PetId 
                           WHERE a.ApplicationId = @ApplicationId";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@ApplicationId", applicationId);

                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        decimal annualIncome = Convert.ToDecimal(reader["TotalAnualIncome"]);
                        bool hasCurrentPets = reader["HasCurrentPets"].ToString() == "Yes";
                        int totalAdults = Convert.ToInt32(reader["TotalAdults"]);
                        bool frequentTravel = reader["FrequentTravel"].ToString() == "Yes";

                        List<string> rejectionReasons = new List<string>();

                        if (annualIncome < 30000)
                        {
                            rejectionReasons.Add("Annual income must be at least $30,000");
                        }
                        if (totalAdults < 1)
                        {
                            rejectionReasons.Add("Must have at least one adult in the household");
                        }
                        if (frequentTravel)
                        {
                            rejectionReasons.Add("Frequent travel may not be suitable for pet adoption");
                        }

                        string petInfo = String.Format("\nPet Details:\nName: {0}\nType: {1}\nBreed: {2}",
                            reader["PetName"], reader["Type"], reader["Breed"]);

                        if (rejectionReasons.Count > 0)
                        {
                            string allReasons = string.Join("\n- ", rejectionReasons);
                            ShowAlert("Application cannot be approved for the following reasons:\n- " + allReasons + petInfo);
                        }
                        else
                        {
                            ShowAlert("Application meets the conditions for adoption." + petInfo);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ShowAlert("Error checking application: " + ex.Message);
            }
        }

        protected void btnApprove_Command(object sender, CommandEventArgs e)
        {
            string applicationId = e.CommandArgument.ToString();
            UpdateApplicationStatus(applicationId, "Approved", null);
            SendApprovalEmail(applicationId); // Send email after approval
        }

      private void SendApprovalEmail(string applicationId)
       {
    try
    {
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string query = "SELECT Email FROM AdoptionApplications WHERE ApplicationId = @ApplicationId";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@ApplicationId", applicationId);

            conn.Open();
            string userEmail = cmd.ExecuteScalar().ToString();

            if (!string.IsNullOrEmpty(userEmail))
            {
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress("faunaa005@gmail.com"); // Your Gmail address
                mail.To.Add(userEmail);
                mail.Subject = "Adoption Application Approved";
                mail.Body = "Congratulations! Your adoption application has been approved. Thank you for choosing to adopt!";
                mail.IsBodyHtml = true;

                SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                smtp.Credentials = new NetworkCredential("faunaa005@gmail.com", "ovdb goeh qxut ertd"); // Your Gmail credentials
                smtp.EnableSsl = true;

                smtp.Send(mail);
            }
        }
    }
    catch (Exception ex)
    {
        ShowAlert("Error sending approval email: " + ex.Message);
    }
}

        protected void btnReject_Command(object sender, CommandEventArgs e)
        {
            string applicationId = e.CommandArgument.ToString();
            string rejectionReason = "Reason for rejection"; // This should be replaced with actual input from the admin
            UpdateApplicationStatus(applicationId, "Rejected", rejectionReason);
        }

        protected void btnDelete_Command(object sender, CommandEventArgs e)
        {
            string applicationId = e.CommandArgument.ToString();
            DeleteApplication(applicationId);
        }

        private void DeleteApplication(string applicationId)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlTransaction transaction = conn.BeginTransaction())
                    {
                        try
                        {
                            // First, get the PetId for this application
                            string getPetQuery = "SELECT PetId FROM AdoptionApplications WHERE ApplicationId = @ApplicationId";
                            SqlCommand getPetCmd = new SqlCommand(getPetQuery, conn, transaction);
                            getPetCmd.Parameters.AddWithValue("@ApplicationId", applicationId);

                            object petId = getPetCmd.ExecuteScalar();

                            // Delete the application
                            string deleteAppQuery = "DELETE FROM AdoptionApplications WHERE ApplicationId = @ApplicationId";
                            SqlCommand deleteAppCmd = new SqlCommand(deleteAppQuery, conn, transaction);
                            deleteAppCmd.Parameters.AddWithValue("@ApplicationId", applicationId);
                            deleteAppCmd.ExecuteNonQuery();

                            // If the application is deleted, update the pet status to "Available"
                            if (petId != null && petId != DBNull.Value)
                            {
                                string updatePetQuery = "UPDATE Pets SET Status = 'Available' WHERE PetId = @PetId";
                                SqlCommand updatePetCmd = new SqlCommand(updatePetQuery, conn, transaction);
                                updatePetCmd.Parameters.AddWithValue("@PetId", petId);
                                updatePetCmd.ExecuteNonQuery();
                            }

                            transaction.Commit();
                            ShowAlert("Application deleted successfully.");
                            LoadApplications(); // Refresh the list of applications
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
                ShowAlert("Error deleting application: " + ex.Message);
            }
        }

        private void UpdateApplicationStatus(string applicationId, string status, string rejectionReason)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlTransaction transaction = conn.BeginTransaction())
                    {
                        try
                        {
                            // First update the application status
                            string appQuery = "UPDATE AdoptionApplications SET Status = @Status, RejectionReason = @RejectionReason WHERE ApplicationId = @ApplicationId";
                            SqlCommand appCmd = new SqlCommand(appQuery, conn, transaction);
                            appCmd.Parameters.AddWithValue("@Status", status);
                            appCmd.Parameters.AddWithValue("@RejectionReason",
                                status == "Rejected" ? rejectionReason : (object)DBNull.Value);
                            appCmd.Parameters.AddWithValue("@ApplicationId", applicationId);
                            appCmd.ExecuteNonQuery();

                            // Get the PetId for this application
                            string getPetQuery = "SELECT PetId FROM AdoptionApplications WHERE ApplicationId = @ApplicationId";
                            SqlCommand getPetCmd = new SqlCommand(getPetQuery, conn, transaction);
                            getPetCmd.Parameters.AddWithValue("@ApplicationId", applicationId);

                            object petId = getPetCmd.ExecuteScalar();
                            if (petId != null && petId != DBNull.Value)
                            {
                                string petStatus = status == "Approved" ? "Adopted" : "Available";

                                // Update pet status
                                string updatePetQuery = "UPDATE Pets SET Status = @PetStatus WHERE PetId = @PetId";
                                SqlCommand updatePetCmd = new SqlCommand(updatePetQuery, conn, transaction);
                                updatePetCmd.Parameters.AddWithValue("@PetStatus", petStatus);
                                updatePetCmd.Parameters.AddWithValue("@PetId", petId);
                                updatePetCmd.ExecuteNonQuery();
                            }

                            transaction.Commit();
                            ShowAlert(string.Format("Application {0} successfully.",
                                status == "Rejected" ? "rejected" : "approved"));
                            LoadApplications(); // Refresh the list of applications
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
                ShowAlert("Error updating application status: " + ex.Message);
            }
        }
        private void UpdateMetrics(string metricName)
        {
            using (SqlConnection conn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\bhvvh\onedrive\documents\visual studio 2010\Projects\Faunaa\Faunaa\App_Data\db.mdf;Integrated Security=True;User Instance=True"))
            {
                string adoption="SELECT COUNT(*) FROM AdoptionApplications WHERE Status = 'Approved'";
                using (SqlCommand approvedAdoptionCmd = new SqlCommand(adoption, conn))
                {
                    conn.Open();

                    string query = "UPDATE DashboardMetrics SET MetricValue = MetricValue + 1 WHERE MetricName = 'adoption'";
                    using (SqlCommand command = new SqlCommand(query, conn))
                    {
                       // command.Parameters.AddWithValue("@MetricName", metricName);
                        conn.Open();
                        command.ExecuteNonQuery();
                        conn.Close();
                    }
                    conn.Close();
                }
            }
        }
    }
}