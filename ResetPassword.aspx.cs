using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace Faunaa
{
    public partial class ResetPassword : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMessage.Text = "";
        }

        protected void btnpwd_Click1(object sender, EventArgs e)
        {
            string email = Session["ResetEmail"] as string;
            if (string.IsNullOrEmpty(email))
            {
                lblMessage.Text = "Session expired. Try again.";
                return;
            }

            if (txtcpassword.Text != txtpassword.Text)
            {
                lblMessage.Text = "Passwords do not match.";
                return;
            }

            using (SqlConnection conn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\bhvvh\onedrive\documents\visual studio 2010\Projects\Faunaa\Faunaa\App_Data\db.mdf;Integrated Security=True;User Instance=True"))
            {
                string query = "UPDATE [dbo].[user] SET password = @Password, cpassword = @CPassword WHERE emailid = @Email";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Password", txtpassword.Text);
                cmd.Parameters.AddWithValue("@CPassword", txtcpassword.Text);  
                cmd.Parameters.AddWithValue("@Email", email);

                conn.Open();
                int rowsAffected = cmd.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    lblMessage.Text = "Password reset successfully.";
                }
                else
                {
                    lblMessage.Text = "Error updating password.";
                }
            }
        }
    }
}
