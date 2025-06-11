using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Web.UI.WebControls;

namespace Faunaa
{
    public partial class Checkout : System.Web.UI.Page
    {
        private string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\bhvvh\onedrive\documents\visual studio 2010\Projects\Faunaa\Faunaa\App_Data\db.mdf;Integrated Security=True;User Instance=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initialize the cart if it doesn't exist
                if (Session["Cart"] == null)
                {
                    Session["Cart"] = new Dictionary<string, List<int>>();
                }

                // Retrieve the cart from the session
                Dictionary<string, List<int>> cart = Session["Cart"] as Dictionary<string, List<int>>;

                if (cart != null && cart.Count > 0)
                {
                    LoadCartItems();
                }
                else
                {
                    lblMessage.Text = "Your cart is empty. Please add items to your cart before proceeding to checkout.";
                    lblMessage.Visible = true;
                    btnPlaceOrder.Enabled = false;
                }
            }
        }

        private void LoadCartItems()
        {
            Dictionary<string, List<int>> cart = Session["Cart"] as Dictionary<string, List<int>>;
            DataTable dt = new DataTable();
            dt.Columns.Add("Id");
            dt.Columns.Add("Name");
            dt.Columns.Add("Category");
            dt.Columns.Add("Price", typeof(decimal));
            dt.Columns.Add("GST", typeof(decimal));
            dt.Columns.Add("TotalPrice", typeof(decimal));
           

            decimal subtotal = 0;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                // Load Pets
                if (cart.ContainsKey("BuyPets"))
                {
                    foreach (int petId in cart["BuyPets"])
                    {
                        string query = "SELECT Id, Name, Breed AS Category, Price FROM BuyPets WHERE Id = @Id";
                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@Id", petId);
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                decimal price = Convert.ToDecimal(reader["Price"]);
                                decimal gst = price * 0.18m;
                                decimal totalPrice = price + gst;

                                // Ensure the image path is correct
                                //string imagePath = "~/Images/" + reader["Image"].ToString(); // Adjust the path as necessary

                                dt.Rows.Add(
                                    reader["Id"],
                                    reader["Name"],
                                    reader["Category"],
                                    price,
                                    gst,
                                    totalPrice
                                    //imagePath // Use the correct image path
                                );
                                subtotal += price;
                            }
                        }
                    }
                }

                // Load Items
                if (cart.ContainsKey("AnimalItems"))
                {
                    foreach (int itemId in cart["AnimalItems"])
                    {
                        string query = "SELECT Id, Name, Category, Price FROM AnimalItems WHERE Id = @Id";
                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@Id", itemId);
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                decimal price = Convert.ToDecimal(reader["Price"]);
                                decimal gst = price * 0.18m;
                                decimal totalPrice = price + gst;

                                // Ensure the image path is correct
                                //string imagePath = "~/uploads/" + reader["Image"].ToString(); // Adjust the path as necessary

                                dt.Rows.Add(
                                    reader["Id"],
                                    reader["Name"],
                                    reader["Category"],
                                    price,
                                    gst,
                                    totalPrice
                                    //imagePath // Use the correct image path
                                );
                                subtotal += price;
                            }
                        }
                    }
                }
            }

            // Bind data to GridView
            gvCheckout.DataSource = dt;
            gvCheckout.DataBind();

            // Calculate and display totals
            decimal gstTotal = subtotal * 0.18m; // 18% GST
            decimal total = subtotal + gstTotal;

            litTotalPrice.Text = total.ToString("C");

            // Store values in session for email and bill
            Session["Subtotal"] = subtotal;
            Session["GST"] = gstTotal;
            Session["Total"] = total;
        }

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;

            string name = txtName.Text.Trim();
            string emailid = txtEmail.Text.Trim();
            string address = txtAddress.Text.Trim();
            string paymentMethod = ddlPayment.SelectedValue;
            Dictionary<string, List<int>> cart = Session["Cart"] as Dictionary<string, List<int>>;

            if (cart != null && cart.Count > 0)
            {
                int orderId = 0; // Declare OrderId here
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    SqlTransaction transaction = con.BeginTransaction();

                    try
                    {
                        // Insert orders
                        foreach (var item in cart)
                        {
                            string type = item.Key;
                            foreach (int id in item.Value)
                            {
                                string query = @"INSERT INTO Orders 
                                                (PetId, ItemId, CustomerName, C_EmailId, Address, PaymentMethod, OrderDate) 
                                                VALUES (@PetId, @ItemId, @CustomerName, @C_EmailId, @Address, @PaymentMethod, @OrderDate);
                                                SELECT @OrderId = SCOPE_IDENTITY();"; // Capture OrderId

                                SqlCommand cmd = new SqlCommand(query, con, transaction);

                                if (type == "BuyPets")
                                {
                                    cmd.Parameters.AddWithValue("@PetId", id);
                                    cmd.Parameters.AddWithValue("@ItemId", DBNull.Value);
                                }
                                else
                                {
                                    cmd.Parameters.AddWithValue("@PetId", DBNull.Value);
                                    cmd.Parameters.AddWithValue("@ItemId", id);
                                }

                                cmd.Parameters.AddWithValue("@CustomerName", name);
                                cmd.Parameters.AddWithValue("@C_EmailId", emailid);
                                cmd.Parameters.AddWithValue("@Address", address);
                                cmd.Parameters.AddWithValue("@PaymentMethod", paymentMethod);
                                cmd.Parameters.AddWithValue("@OrderDate", DateTime.Now);
                                cmd.Parameters.Add("@OrderId", SqlDbType.Int).Direction = ParameterDirection.Output; // Output parameter for OrderId

                                cmd.ExecuteNonQuery(); // Execute the command to insert the order

                                // Get the OrderId for the first inserted record
                                if (orderId == 0)
                                {
                                    orderId = Convert.ToInt32(cmd.Parameters["@OrderId"].Value); // Retrieve the OrderId
                                }
                            }
                        }

                        transaction.Commit();

                        // Send confirmation email
                        SendThankYouEmail(name, emailid);

                        // Clear the cart
                        Session["Cart"] = null;

                        // Store customer info in session for bill page
                        Session["OrderId"] = orderId;
                        Session["CustomerName"] = name;
                        Session["CustomerEmail"] = emailid;
                        Session["CustomerAddress"] = address;
                        Session["PaymentMethod"] = paymentMethod;

                        // Redirect to bill page with OrderId
                        Response.Redirect("Bill.aspx?OrderId={orderId}"); // Correctly pass the OrderId
                    }
                    catch (Exception ex)
                    {
                        transaction.Rollback();
                        lblMessage.Text = "An error occurred while processing your order: " + ex.Message;
                        lblMessage.Visible = true;
                    }
                }
            }
            else
            {
                lblMessage.Text = "Your cart is empty. Please add items to your cart before placing an order.";
                lblMessage.Visible = true;
            }
        }

        private void SendThankYouEmail(string name, string emailid)
        {
            try
            {
                // Ensure session variables are not null
                decimal subtotal = Session["Subtotal"] != null ? Convert.ToDecimal(Session["Subtotal"]) : 0;
                decimal gst = Session["GST"] != null ? Convert.ToDecimal(Session["GST"]) : 0;
                decimal total = Session["Total"] != null ? Convert.ToDecimal(Session["Total"]) : 0;

                // Ensure controls are not null
                string address = txtAddress != null ? txtAddress.Text : "N/A";
                string paymentMethod = ddlPayment != null && ddlPayment.SelectedItem != null ? ddlPayment.SelectedItem.Text : "N/A";

                // Format the email body
                string subject = "Thank You for Your Order at Faunaa!";
                string body = string.Format(@"Dear {0},

Thank you for shopping at Faunaa!

Order Details:
------------------
Subtotal: {1}
GST (18%): {2}
Total Amount: {3}

Your order has been successfully placed and will be processed shortly.

Delivery Address:
{4}

Payment Method: {5}

If you have any questions about your order, please contact us.

Best regards,
Faunaa Team",
                    name, // {0}
                    subtotal.ToString("C"), // {1}
                    gst.ToString("C"), // {2}
                    total.ToString("C"), // {3}
                    address, // {4}
                    paymentMethod // {5}
                );

                // Send the email
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress("faunaa005@gmail.com");
                mail.To.Add(emailid);
                mail.Subject = subject;
                mail.Body = body;
                mail.IsBodyHtml = false;

                SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                smtp.Credentials = new NetworkCredential("faunaa005@gmail.com", "ovdb goeh qxut ertd"); // Replace with your email credentials
                smtp.EnableSsl = true;

                smtp.Send(mail);
            }
            catch (Exception ex)
            {
                // Log the error but don't stop the order process
                lblMessage.Text = "Order placed successfully but there was an error sending the confirmation email: " + ex.Message;
                lblMessage.Visible = true;
            }
        }
    }
}