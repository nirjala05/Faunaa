using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Faunaa
{
    public partial class BuyPets : System.Web.UI.Page
    {
        private string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\bhvvh\onedrive\documents\visual studio 2010\Projects\Faunaa\Faunaa\App_Data\db.mdf;Integrated Security=True;User Instance=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindPets();
            }
        }

        private void BindPets()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT Id, Name, Breed, Age, Description, Price, Image FROM BuyPets", con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

                    foreach (DataRow row in dt.Rows)
                    {
                        string imagePath = row["Image"].ToString();
                        imagePath = imagePath.Replace("~/", "");

                        if (string.IsNullOrEmpty(imagePath))
                        {
                            row["Image"] = "uploads/2.jpg";
                        }
                        else
                        {
                            if (!imagePath.StartsWith("uploads/"))
                            {
                                row["Image"] = "uploads/" + imagePath;
                            }
                            else
                            {
                                row["Image"] = imagePath;
                            }
                        }

                        string physicalPath = Server.MapPath("~/" + row["Image"].ToString());
                        if (!File.Exists(physicalPath))
                        {
                            row["Image"] = "uploads/default-pet.jpg";
                        }
                    }

                    RepeaterAvailablePets.DataSource = dt;
                    RepeaterAvailablePets.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("Error: " + ex.Message);
                }
            }
        }

        protected void btnAddToCart_Command(object sender, CommandEventArgs e)
        {
            // Check if the user is logged in
            if (Session["UserAuthenticated"] == null || Session["UserAuthenticated"].ToString() != "Yes")
            {
                // Redirect to login page if user is not logged in
                Response.Redirect("Login.aspx");
            }
            else
            {
                // Initialize the cart if it doesn't exist
                Dictionary<string, List<int>> cart = Session["Cart"] as Dictionary<string, List<int>>;
                if (cart == null)
                {
                    cart = new Dictionary<string, List<int>>();
                }

                // Ensure the BuyPets list exists in the cart
                if (!cart.ContainsKey("BuyPets"))
                {
                    cart["BuyPets"] = new List<int>();
                }

                // Get the pet ID from the CommandArgument
                int petId = Convert.ToInt32(e.CommandArgument);

                // Add the pet ID to the BuyPets list if it's not already there
                if (!cart["BuyPets"].Contains(petId))
                {
                    cart["BuyPets"].Add(petId);
                    Session["Cart"] = cart;
                }

                // Redirect to the Cart page
                Response.Redirect("Cart.aspx");
            }
        }
    }
}
