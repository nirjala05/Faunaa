using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Faunaa
{
    public partial class NGOPanel : System.Web.UI.Page
    {
        public int AdoptionApplicationsCount { get; private set; }
        public int DonationCount { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadMetrics(); // Fetch adoption and donation counts
                LoadFestiveAlerts(); // Load festive alerts from the Alerts table
            }
        }

        private void LoadMetrics()
        {
            string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\bhvvh\onedrive\documents\visual studio 2010\Projects\Faunaa\Faunaa\App_Data\db.mdf;Integrated Security=True;User Instance=True";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                // Retrieve counts for adoption and donation
                string selectQuery = "SELECT MetricName, MetricValue FROM DashboardMetrics WHERE MetricName IN ('adoption', 'Donation')";
                using (SqlCommand selectCmd = new SqlCommand(selectQuery, conn))
                {
                    SqlDataReader reader = selectCmd.ExecuteReader();
                    while (reader.Read())
                    {
                        string metricName = reader["MetricName"].ToString();
                        int metricValue = Convert.ToInt32(reader["MetricValue"]);

                        if (metricName == "adoption")
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

        private void LoadFestiveAlerts()
        {
            string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\bhvvh\onedrive\documents\visual studio 2010\Projects\Faunaa\Faunaa\App_Data\db.mdf;Integrated Security=True;User Instance=True";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT EventDate, Title, Description FROM Alerts ORDER BY EventDate"; // Fetch alerts from the Alerts table
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    GridViewAlerts.DataSource = dt;
                    GridViewAlerts.DataBind();
                }
            }
        }

        public string GetDonationCount()
        {
            return DonationCount.ToString();
        }

        public string GetAdoptionApplicationsCount()
        {
            return AdoptionApplicationsCount.ToString();
        }
    }
}