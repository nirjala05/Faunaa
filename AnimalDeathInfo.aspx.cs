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
    public partial class AnimalDeathInfo : System.Web.UI.Page
    {
         private string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\bhvvh\onedrive\documents\visual studio 2010\Projects\Faunaa\Faunaa\App_Data\db.mdf;Integrated Security=True;User Instance=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAnimalDeathInfo();
            }
        }

        private void LoadAnimalDeathInfo()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM AnimalDeaths ORDER BY DateAdded DESC", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptAnimalDeaths.DataSource = dt;
                        rptAnimalDeaths.DataBind();
                    }
                }
            }
        }
    }
}
  