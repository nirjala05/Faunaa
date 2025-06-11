using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Faunaa
{
    public partial class Donation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadNgoDetails();
                IncrementDonationCount();
            }
        }

        private void LoadNgoDetails()
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\bhvvh\onedrive\documents\visual studio 2010\Projects\Faunaa\Faunaa\App_Data\db.mdf;Integrated Security=True;User Instance=True"))
                {
                    conn.Open();
                    string query = "SELECT TOP 1 NgoDetails FROM NGOInfo"; // Removed TermsAndConditions
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                litNgoDetails.Text = reader["NgoDetails"].ToString();
                            }
                            else
                            {
                                litNgoDetails.Text = "NGO details not available.";
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                litNgoDetails.Text = "Error loading NGO details.";
                System.Diagnostics.Debug.WriteLine("Error: " + ex.Message);
            }
        }

        protected void btnDonate_Click(object sender, EventArgs e)
        {
            // Check if the user is logged in
            if (Session["UserAuthenticated"] == null || Session["UserAuthenticated"].ToString() != "Yes")
            {
                // Redirect to login page if user is not logged in
                Response.Redirect("Login.aspx");
                return;
            }

            if (Page.IsValid)
            {
                try
                {
                    using (SqlConnection conn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\bhvvh\onedrive\documents\visual studio 2010\Projects\Faunaa\Faunaa\App_Data\db.mdf;Integrated Security=True;User Instance=True"))
                    {
                        conn.Open();
                        string query = @"INSERT INTO Donations (Name, Email, Phone, Amount, DonationDate) 
                                       VALUES (@Name, @Email, @Phone, @Amount, @DonationDate)";

                        using (SqlCommand cmd = new SqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                            cmd.Parameters.AddWithValue("@Phone", txtPhone.Text.Trim());
                            cmd.Parameters.AddWithValue("@Amount", decimal.Parse(txtAmount.Text));
                            cmd.Parameters.AddWithValue("@DonationDate", DateTime.Now);

                            cmd.ExecuteNonQuery();
                        }
                    }

                    // Show success message
                    lblMessage.Text = "Thank you for your donation!";
                    lblMessage.Visible = true;
                    ClearForm();
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "An error occurred while processing your donation. Please try again.";
                    lblMessage.Visible = true;
                    System.Diagnostics.Debug.WriteLine("Error: " + ex.Message);
                }
            }
        }

        private void ClearForm()
        {
            txtName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            txtAmount.Text = "";
        }

        private void IncrementDonationCount()
        {
            string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\bhvvh\onedrive\documents\visual studio 2010\Projects\Faunaa\Faunaa\App_Data\db.mdf;Integrated Security=True;User Instance=True";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                string updateDonationQuery = "UPDATE DashboardMetrics SET MetricValue = MetricValue + 1 WHERE MetricName = 'Donation'";
                using (SqlCommand updateDonationCmd = new SqlCommand(updateDonationQuery, conn))
                {
                    updateDonationCmd.ExecuteNonQuery();
                }
            }
        }
    }
}