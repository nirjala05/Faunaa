using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace Faunaa
{
    public partial class adminpanel : System.Web.UI.Page
    {
        public int VisitorsCount { get; private set; }
        public int AdoptionApplicationsCount { get; private set; }
        public int DonationCount { get; private set; }  // ✅ Ensure it's accessible in the front-end

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadMetrics(); // Fetch values but do not update visitors count
            }
        }

        private void LoadMetrics()
        {
            string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\bhvvh\onedrive\documents\visual studio 2010\Projects\Faunaa\Faunaa\App_Data\db.mdf;Integrated Security=True;User Instance=True";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                // Retrieve counts but do not increment visitors
                string selectQuery = "SELECT MetricName, MetricValue FROM DashboardMetrics";
                using (SqlCommand selectCmd = new SqlCommand(selectQuery, conn))
                {
                    SqlDataReader reader = selectCmd.ExecuteReader();
                    while (reader.Read())
                    {
                        string metricName = reader["MetricName"].ToString();
                        int metricValue = Convert.ToInt32(reader["MetricValue"]);

                        if (metricName == "Visitors")
                        {
                            VisitorsCount = metricValue;  // Just read the count, do not update
                        }
                        else if (metricName == "adoption")
                        {
                            AdoptionApplicationsCount = metricValue;
                        }
                        else if (metricName == "Donation")
                        {
                            DonationCount = metricValue;
                        }
                    }
                    reader.Close();
                }
            }
        }

        // ✅ Expose values as public methods for front-end
        public string GetDonationCount()
        {
            return DonationCount.ToString();
        }

        public string GetVisitorsCount()
        {
            return VisitorsCount.ToString();
        }

        public string GetAdoptionApplicationsCount()
        {
            return AdoptionApplicationsCount.ToString();
        }
    }
}
