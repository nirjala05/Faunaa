using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace Faunaa
{
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                setimage();
                IncrementVisitorsCount(); // Ensure Visitors count updates only when Home.aspx loads
            }
        }

        protected void btnRedirectLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void ImageButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Donation.aspx");
        }

        protected void ImageButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("adoption.aspx");
        }

        protected void ImageButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("GroomingTraining.aspx");
        }


        protected void Timer1_Tick(object sender, EventArgs e)
        {
            setimage();
        }

        private void setimage()
        {
            Random ran = new Random();
            int i = ran.Next(2, 8);
            Image1.ImageUrl = "~/images/" + i.ToString() + ".jpg";
        }

        private void IncrementVisitorsCount()
        {
            string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\bhvvh\onedrive\documents\visual studio 2010\Projects\Faunaa\Faunaa\App_Data\db.mdf;Integrated Security=True;User Instance=True";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                // Increment Visitors count only when Home.aspx loads
                string updateVisitorsQuery = "UPDATE DashboardMetrics SET MetricValue = MetricValue + 1 WHERE MetricName = 'Visitors'";
                using (SqlCommand updateVisitorsCmd = new SqlCommand(updateVisitorsQuery, conn))
                {
                    updateVisitorsCmd.ExecuteNonQuery();
                }
            }
        }


    }
}
