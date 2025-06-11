using System;
using System.Data.SqlClient;
using System.Web.Services;

namespace Faunaa
{
    public partial class SetAlerts : System.Web.UI.Page
    {
        [WebMethod]
        public static void SaveEvent(string date, string title, string description)
        {
            string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\bhvvh\onedrive\documents\visual studio 2010\Projects\Faunaa\Faunaa\App_Data\db.mdf;Integrated Security=True;User Instance=True";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "INSERT INTO Alerts (EventDate, Title, Description) VALUES (@EventDate, @Title, @Description)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@EventDate", date);
                    cmd.Parameters.AddWithValue("@Title", title);
                    cmd.Parameters.AddWithValue("@Description", description);
                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}