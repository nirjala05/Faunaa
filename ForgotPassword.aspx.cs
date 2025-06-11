using System;
using System.Net;
using System.Net.Mail;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;

namespace Faunaa
{
    public partial class ForgotPassword : Page
    {
        private static string generatedCode;

        protected void Page_Load(object sender, EventArgs e)
        {
            lblMessage.Text = "";
        }

        protected void btnemail_Click1(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtEmail.Text))
            {
                lblMessage.Text = "Please enter your email.";
                return;
            }

            // Generate a 6-digit verification code
            Random random = new Random();
            generatedCode = random.Next(100000, 999999).ToString();

            string fromEmail = "faunaa005@gmail.com"; // Replace with your email
            string appPassword = "ovdb goeh qxut ertd"; // Replace with your generated app password

            try
            {
                MailMessage message = new MailMessage();
                message.From = new MailAddress(fromEmail);
                message.To.Add(txtEmail.Text);
                message.Subject = "Password Reset Code";
                message.Body = "Your Reset Password Code is: " + generatedCode;
                message.IsBodyHtml = false;

                SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                smtp.Credentials = new NetworkCredential(fromEmail, appPassword);
                smtp.EnableSsl = true;
                smtp.Send(message);

                lblMessage.Text = "A verification code has been sent to your email.";
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Failed to send email. Error: " + ex.Message;
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            if (txtcode.Text == generatedCode)
            {
                Session["ResetEmail"] = txtEmail.Text;
                Response.Redirect("ResetPassword.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid verification code.";
            }
        }
    }
}
