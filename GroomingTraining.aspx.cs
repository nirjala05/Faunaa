using System;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;

namespace Faunaa
{
    public partial class GroomingTraining : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCenters();

                Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache);
                Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
                Response.Cache.SetNoStore();
            }
        }

        private void LoadCenters()
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\bhvvh\onedrive\documents\visual studio 2010\Projects\Faunaa\Faunaa\App_Data\db.mdf;Integrated Security=True;User Instance=True"))
                {
                    conn.Open();
                    string query = "SELECT CenterName, ImagePath, Address, Contact, Services, Description FROM GroomingTrainingCenters";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);

                            foreach (DataRow row in dt.Rows)
                            {
                                string imagePath = row["ImagePath"].ToString();
                                if (string.IsNullOrEmpty(imagePath))
                                {
                                    row["ImagePath"] = "default.jpg";
                                }
                                else
                                {
                                    row["ImagePath"] = imagePath.Replace("~/Images/Centers/", "");
                                }

                                // Ensure Services is not null
                                if (row["Services"] == DBNull.Value)
                                {
                                    row["Services"] = "";
                                }
                            }

                            rptCenters.DataSource = dt;
                            rptCenters.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("Error loading centers: " + ex.Message);
            }
        }
    }
}