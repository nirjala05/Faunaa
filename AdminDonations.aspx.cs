using System;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;

namespace Faunaa
{
    public partial class AdminDonations : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDonations();
            }
        }

        private void LoadDonations()
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\bhvvh\onedrive\documents\visual studio 2010\Projects\Faunaa\Faunaa\App_Data\db.mdf;Integrated Security=True;User Instance=True"))
                {
                    conn.Open();
                    string query = "SELECT Name, Email, Phone, Amount, DonationDate FROM Donations ORDER BY DonationDate DESC";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);
                            gvDonations.DataSource = dt;
                            gvDonations.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblUpdateMessage.Text = "Error loading donations: " + ex.Message;
                lblUpdateMessage.CssClass = "text-danger";
            }
        }

        protected void gvDonations_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvDonations.PageIndex = e.NewPageIndex;
            LoadDonations();
        }

        protected void btnSendEmail_Command(object sender, CommandEventArgs e)
        {
            // Get the email and donation details from the GridView row
            GridViewRow row = (GridViewRow)((Button)sender).NamingContainer;
            string email = e.CommandArgument.ToString();
            string donorName = ((Label)row.FindControl("lblDonorName")).Text; // Assuming you have a label for donor name
            string amount = ((Label)row.FindControl("lblAmount")).Text; // Assuming you have a label for amount
            string donationDate = ((Label)row.FindControl("lblDonationDate")).Text; // Assuming you have a label for donation date

            SendDonationEmail(email, donorName, amount, donationDate);
        }

        private void SendDonationEmail(string email, string donorName, string amount, string donationDate)
        {
            try
            {
                // Create the email message
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress("faunaa005@gmail.com"); // Your Gmail address
                mail.To.Add(email);
                mail.Subject = "Thank You for Your Donation!";
               string receipt = "-----------------------------------------------------------\n";
        receipt += "               Donation Receipt          \n";
        receipt += "---------------------------------------------\n";
        receipt += "Donor Name: "+donorName+"\n";
        receipt += "Donation Amount: ₹"+amount+"\n";
        receipt += "Donation Date: "+donationDate+"\n";
        receipt += "----------------------------------------------\n";
        receipt += "Thank you for your generous support!\n";
        receipt += "Best Regards,\n";
        receipt += "Faunaa Team\n";
        receipt += "----------------------------------------------------------------\n";

        mail.Body = receipt;
        mail.IsBodyHtml = false; // Set to false for plain text

                SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                smtp.Credentials = new NetworkCredential("faunaa005@gmail.com", "ovdb goeh qxut ertd"); // Your Gmail credentials
                smtp.EnableSsl = true;

                smtp.Send(mail);

                lblUpdateMessage.Text = "Email sent successfully to " + email;
                lblUpdateMessage.CssClass = "text-success";
            }
            catch (Exception ex)
            {
                lblUpdateMessage.Text = "Error sending email: " + ex.Message;
                lblUpdateMessage.CssClass = "text-danger";
            }
        }
    }
}