using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Web.UI;

namespace Faunaa
{
    public partial class Adoption : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\bhvvh\onedrive\documents\visual studio 2010\Projects\Faunaa\Faunaa\App_Data\db.mdf;Integrated Security=True;User Instance=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPets();

                // Prevent back button access after logout
                Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache);
                Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
                Response.Cache.SetNoStore();
            }
        }

        private void LoadPets(string petType = "")
        {
            try
            {
                conn.Open();
                string query = "SELECT * FROM Pets WHERE Status = 'Available'";
                if (!string.IsNullOrEmpty(petType))
                {
                    query += " AND Type = @PetType";
                }

                SqlCommand cmd = new SqlCommand(query, conn);
                if (!string.IsNullOrEmpty(petType))
                {
                    cmd.Parameters.AddWithValue("@PetType", petType);
                }

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rptPets.DataSource = dt;
                rptPets.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }

        protected void ddlFilterType_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedType = ddlFilterType.SelectedValue;
            LoadPets(selectedType);
        }

        protected void rptPets_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Adopt")
            {
                // Check if the user is logged in
                if (Session["UserAuthenticated"] == null || Session["UserAuthenticated"].ToString() != "Yes")
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    string petId = e.CommandArgument.ToString();
                    // Store PetId in Session and redirect to Terms
                    Session["SelectedPetId"] = petId;
                    Response.Redirect("TermsAndConditions.aspx?PetId=" + petId);
                }
            }
        }
    }
}
