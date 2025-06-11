using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Faunaa
{
    public partial class VeterinaryServices : System.Web.UI.Page
    {
        private string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\bhvvh\onedrive\documents\visual studio 2010\Projects\Faunaa\Faunaa\App_Data\db.mdf;Integrated Security=True;User Instance=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindVetGrid();
            }
        }

        protected void btnVetTab_Click(object sender, EventArgs e)
        {
            pnlVetServices.Visible = true;
            pnlNGOServices.Visible = false;
            btnVetTab.CssClass = "tab-btn active";
            btnNGOTab.CssClass = "tab-btn";
            BindVetGrid();
        }

        protected void btnNGOTab_Click(object sender, EventArgs e)
        {
            pnlVetServices.Visible = false;
            pnlNGOServices.Visible = true;
            btnVetTab.CssClass = "tab-btn";
            btnNGOTab.CssClass = "tab-btn active";
            BindNGOGrid();
        }

        private void BindVetGrid()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("SELECT Name, Address, ContactTiming, Contact, Location, Photo FROM VeterinaryServices", con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("Error loading veterinary data: " + ex.Message);
            }
        }

        private void BindNGOGrid()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("SELECT Name, Address, WorkingHours, Contact, Location, Photo FROM AddNGO", con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    GridViewNGO.DataSource = dt;
                    GridViewNGO.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("Error loading NGO data: " + ex.Message);
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "GetDirections")
            {
                // Check if user is logged in
                if (Session["UserAuthenticated"] == null || Session["UserAuthenticated"].ToString() != "Yes")
                {
                    Response.Redirect("Login.aspx"); // Redirect to login page if not logged in
                    return;
                }

                // Get location from CommandArgument
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                string location = GridView1.DataKeys[rowIndex]["Location"].ToString();

                // Redirect to Google Maps
                string googleMapsUrl = "https://www.google.com/maps/search/?api=1&query=" + Server.UrlEncode(location);
                Response.Redirect(googleMapsUrl);
            }
        }
    }
}
