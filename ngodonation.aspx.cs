using System;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;

namespace Faunaa
{
    public partial class ngodonation : System.Web.UI.Page
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
                string email = e.CommandArgument.ToString();
                SendDonationEmail(email);
            }

            private void SendDonationEmail(string email)
            {
                try
                {
                    // Create the email message
                    MailMessage mail = new MailMessage();
                    mail.From = new MailAddress("faunaa005@gmail.com"); // Your Gmail address
                    mail.To.Add(email);
                    mail.Subject = "Thank You for Your Donation!";
                    mail.Body = "Dear Donor,\n\nThank you for your generous donation! We appreciate your support.\n\nBest Regards,\nFaunaa Team";
                    mail.IsBodyHtml = false; // Set to true if you want to send HTML email

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