using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Faunaa
{
    public partial class Food : System.Web.UI.Page
    {
        private string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\bhvvh\onedrive\documents\visual studio 2010\Projects\Faunaa\Faunaa\App_Data\db.mdf;Integrated Security=True;User Instance=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindFoodGrid();
                BindMedicineGrid();
                BindClothesGrid();
                BindToysGrid();
            }
        }

        private void BindFoodGrid()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "SELECT * FROM AnimalItems WHERE Category = 'Food'";
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                gvFood.DataSource = dt;
                gvFood.DataBind();
            }
        }

        private void BindMedicineGrid()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "SELECT * FROM AnimalItems WHERE Category = 'Medicine'";
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                gvMedicine.DataSource = dt;
                gvMedicine.DataBind();
            }
        }

        private void BindClothesGrid()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "SELECT * FROM AnimalItems WHERE Category = 'Clothes'";
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                gvClothes.DataSource = dt;
                gvClothes.DataBind();
            }
        }

        private void BindToysGrid()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "SELECT * FROM AnimalItems WHERE Category = 'Toys'";
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                gvToys.DataSource = dt;
                gvToys.DataBind();
            }
        }

        protected void gvFood_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Buy")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                ProcessPurchase(id);
            }
        }

        protected void gvMedicine_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Buy")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                ProcessPurchase(id);
            }
        }

        protected void gvClothes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Buy")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                ProcessPurchase(id);
            }
        }

        protected void gvToys_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Buy")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                ProcessPurchase(id);
            }
        }

        private void ProcessPurchase(int id)
        {
            // Check if the user is logged in
            if (Session["UserAuthenticated"] == null || Session["UserAuthenticated"].ToString() != "Yes")
            {
                // Redirect to login page if user is not logged in
                Response.Redirect("Login.aspx");
                return;
            }

            // Initialize the cart if it doesn't exist
            Dictionary<string, List<int>> cart = Session["Cart"] as Dictionary<string, List<int>>;
            if (cart == null)
            {
                cart = new Dictionary<string, List<int>>();
            }

            // Ensure the AnimalItems list exists in the cart
            if (!cart.ContainsKey("AnimalItems"))
            {
                cart["AnimalItems"] = new List<int>();
            }

            // Add the item ID to the AnimalItems list if it's not already there
            if (!cart["AnimalItems"].Contains(id))
            {
                cart["AnimalItems"].Add(id);
                Session["Cart"] = cart;
            }

            // Redirect to the Cart page
            Response.Redirect("Cart.aspx");
        }
    }
}
