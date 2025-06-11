using System;
using System.Net;
using System.Net.Mail;
using System.Data.SqlClient;

namespace Faunaa
{
    public partial class registration : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\bhvvh\onedrive\documents\visual studio 2010\Projects\Faunaa\Faunaa\App_Data\db.mdf;Integrated Security=True;User Instance=True");
        private static string generatedOtp; // Store the generated OTP

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initialize or reset any necessary variables or controls
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Generate a random OTP
            Random random = new Random();
            generatedOtp = random.Next(100000, 999999).ToString(); // Generate a 6-digit OTP

            // Send OTP to the user's email
            SendOtpEmail(txtemail.Text, generatedOtp);

            // Inform the user to check their email for the OTP
            lblCaptchaMessage.Text = "An OTP has been sent to your email. Please verify.";
            lblCaptchaMessage.ForeColor = System.Drawing.Color.Green;
        }

        private void SendOtpEmail(string toEmail, string otp)
        {
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("faunaa005@gmail.com"); // Your Gmail address
            mail.To.Add(toEmail);
            mail.Subject = "Your OTP Code";
            mail.Body = "Your OTP code is: " + otp; // Correctly formatted OTP using string concatenation
            mail.IsBodyHtml = true;

            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            smtp.Credentials = new NetworkCredential("faunaa005@gmail.com", "ovdb goeh qxut ertd"); // Your Gmail credentials
            smtp.EnableSsl = true;

            smtp.Send(mail);
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // Check if the entered OTP matches the generated OTP
            if (txtOtp.Text != generatedOtp)
            {
                lblCaptchaMessage.Text = "Incorrect OTP OR Captcha. Please try again.";
                lblCaptchaMessage.ForeColor = System.Drawing.Color.Red;
                return; // Stop further execution
            }

            // Check if the captcha is correct
            if (txtVerificationCode.Text.ToLower() != Session["CaptchaVerify"].ToString())
            {
                lblCaptchaMessage.Text = "Please enter correct captcha!";
                lblCaptchaMessage.ForeColor = System.Drawing.Color.Red;
                return; // Stop further execution
            }

            // Proceed with registration if OTP and captcha are correct
            String ins = "INSERT INTO [user](name,emailid,phoneno,address,password,cpassword) VALUES(@name,@emailid,@phoneno,@address,@password,@cpassword)";
            using (SqlCommand com = new SqlCommand(ins, con))
            {
                com.Parameters.AddWithValue("@name", txtusername.Text);
                com.Parameters.AddWithValue("@emailid", txtemail.Text);
                com.Parameters.AddWithValue("@phoneno", txtphone.Text);
                com.Parameters.AddWithValue("@address", txtadd.Text);
                com.Parameters.AddWithValue("@password", txtpwd.Text);
                com.Parameters.AddWithValue("@cpassword", txtcpwd.Text);

                con.Open();
                com.ExecuteNonQuery();
                con.Close();

                // Redirect to a success page or show a success message
                lblCaptchaMessage.Text = "Registration successful!";
                lblCaptchaMessage.ForeColor = System.Drawing.Color.Green;

                // Optionally, redirect to a success page
                // Response.Redirect("success.aspx");
            }
        }
    }
}