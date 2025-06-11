using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI.WebControls;

namespace Faunaa
{
    public partial class Cart : System.Web.UI.Page
    {
        private string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\bhvvh\onedrive\documents\visual studio 2010\Projects\Faunaa\Faunaa\App_Data\db.mdf;Integrated Security=True;User Instance=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCartItems();
                CalculateGSTAndTotal();
            }
        }

        private void BindCartItems()
        {
            Dictionary<string, List<int>> cart = Session["Cart"] as Dictionary<string, List<int>>;

            if (cart != null && cart.Count > 0)
            {
                DataTable dtCart = new DataTable();
                dtCart.Columns.Add("Id", typeof(int));
                dtCart.Columns.Add("Name", typeof(string));
                dtCart.Columns.Add("Category", typeof(string));
                dtCart.Columns.Add("Price", typeof(decimal));
                dtCart.Columns.Add("GST", typeof(decimal));  // Ensure GST column exists
                dtCart.Columns.Add("TotalPrice", typeof(decimal)); // Total Price column
                dtCart.Columns.Add("Image", typeof(string)); // This will store the full image path

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();

                    if (cart.ContainsKey("BuyPets") && cart["BuyPets"].Count > 0)
                    {
                        string query = "SELECT Id, Name, 'Pet' AS Category, Price, Image FROM BuyPets WHERE Id IN (" + string.Join(",", cart["BuyPets"]) + ")";
                        using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                        {
                            DataTable dtBuyPets = new DataTable();
                            sda.Fill(dtBuyPets);

                            // Update image paths for BuyPets and calculate GST and Total Price
                            foreach (DataRow row in dtBuyPets.Rows)
                            {
                                string imagePath = ResolveUrl("~/uploads/" + row["Image"].ToString());
                                decimal price = Convert.ToDecimal(row["Price"]);
                                decimal gst = price * 0.18m; // Calculate GST
                                decimal totalPrice = price + gst; // Calculate Total Price

                                // Add the row to the dtCart DataTable
                                dtCart.Rows.Add(row["Id"], row["Name"], "Pet", price, gst, totalPrice, imagePath);
                            }
                        }
                    }

                    if (cart.ContainsKey("AnimalItems") && cart["AnimalItems"].Count > 0)
                    {
                        string query = "SELECT Id, Name, Category, Price, Image FROM AnimalItems WHERE Id IN (" + string.Join(",", cart["AnimalItems"]) + ")";
                        using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                        {
                            DataTable dtAnimalItems = new DataTable();
                            sda.Fill(dtAnimalItems);

                            // Update image paths for AnimalItems and calculate GST and Total Price
                            foreach (DataRow row in dtAnimalItems.Rows)
                            {
                                string imagePath = ResolveUrl("~/uploads/" + row["Image"].ToString());
                                decimal price = Convert.ToDecimal(row["Price"]);
                                decimal gst = price * 0.18m; // Calculate GST
                                decimal totalPrice = price + gst; // Calculate Total Price

                                // Add the row to the dtCart DataTable
                                dtCart.Rows.Add(row["Id"], row["Name"], row["Category"], price, gst, totalPrice, imagePath);
                            }
                        }
                    }
                }

                // Bind data to GridView
                gvCart.DataSource = dtCart;
                gvCart.DataBind();
            }
            else
            {
                gvCart.DataSource = null;
                gvCart.DataBind();
            }
        }

        private void CalculateGSTAndTotal()
        {
            var cartItems = GetCartItems();
            decimal totalPrice = cartItems.Sum(item => item.Price);
            decimal totalGST = totalPrice * 0.18m;
            decimal totalAmount = totalPrice + totalGST;

            litTotalGST.Text = totalGST.ToString("0.00");
            litTotalAmount.Text = totalAmount.ToString("0.00");
        }

        private List<CartItem> GetCartItems()
        {
            Dictionary<string, List<int>> cart = Session["Cart"] as Dictionary<string, List<int>>;
            List<CartItem> items = new List<CartItem>();

            if (cart != null)
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();

                    if (cart.ContainsKey("BuyPets") && cart["BuyPets"].Count > 0)
                    {
                        string query = "SELECT Id, Name, 'Pet' AS Category, Price, Image FROM BuyPets WHERE Id IN (" + string.Join(",", cart["BuyPets"]) + ")";
                        using (SqlCommand cmd = new SqlCommand(query, con))
                        {
                            using (SqlDataReader reader = cmd.ExecuteReader())
                            {
                                while (reader.Read())
                                {
                                    items.Add(new CartItem
                                    {
                                        ID = Convert.ToInt32(reader["Id"]),
                                        Name = reader["Name"].ToString(),
                                        Category = "Pet",
                                        Price = Convert.ToDecimal(reader["Price"]),
                                        Image = reader["Image"].ToString()
                                    });
                                }
                            }
                        }
                    }

                    if (cart.ContainsKey("AnimalItems") && cart["AnimalItems"].Count > 0)
                    {
                        string query = "SELECT Id, Name, Category, Price, Image FROM AnimalItems WHERE Id IN (" + string.Join(",", cart["AnimalItems"]) + ")";
                        using (SqlCommand cmd = new SqlCommand(query, con))
                        {
                            using (SqlDataReader reader = cmd.ExecuteReader())
                            {
                                while (reader.Read())
                                {
                                    items.Add(new CartItem
                                    {
                                        ID = Convert.ToInt32(reader["Id"]),
                                        Name = reader["Name"].ToString(),
                                        Category = reader["Category"].ToString(),
                                        Price = Convert.ToDecimal(reader["Price"]),
                                        Image = reader["Image"].ToString()
                                    });
                                }
                            }
                        }
                    }
                }
            }

            return items;
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            // Calculate total price including GST
            decimal totalPrice = 0;
            var cartItems = GetCartItems();

            foreach (var item in cartItems)
            {
                totalPrice += item.Price + (item.Price * 0.18m); // Price + GST
            }

            // Store the total price in the session
            Session["TotalPrice"] = totalPrice;

            // Redirect to the Checkout page
            Response.Redirect("Checkout.aspx");
        }
    }

    public class CartItem
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Category { get; set; }
        public decimal Price { get; set; }
        public string Image { get; set; }
    }
}