using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Faunaa
{
    public partial class ApplicationStatus : System.Web.UI.Page
    {
        private readonly string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\bhvvh\onedrive\documents\visual studio 2010\Projects\Faunaa\Faunaa\App_Data\db.mdf;Integrated Security=True;User Instance=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadApplicationStatus();
            }
        }

        private void LoadApplicationStatus()
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            int userId = Convert.ToInt32(Session["UserId"]);
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "SELECT Status, RejectionReason FROM AdoptionApplications WHERE UserId = @UserId ORDER BY ApplicationDate DESC";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@UserId", userId);

                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            lblStatus.Text = "Application Status: " + reader["Status"].ToString();
                            if (reader["Status"].ToString() == "Rejected")
                            {
                                lblReason.Text = "Reason for Rejection: " + reader["RejectionReason"].ToString();
                            }
                        }
                        else
                        {
                            lblStatus.Text = "No application found.";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblStatus.Text = "Error: " + ex.Message;
            }
        }
    }
}