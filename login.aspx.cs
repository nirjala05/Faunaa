using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace Faunaa
{
    public partial class login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\bhvvh\onedrive\documents\visual studio 2010\Projects\Faunaa\Faunaa\App_Data\db.mdf;Integrated Security=True;User Instance=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserAuthenticated"] != null && Session["UserAuthenticated"].ToString() == "Yes")
                {
                    Response.Redirect("Home.aspx");
                }
            }
        }
        
        protected void Button1_Click(object sender, EventArgs e)
        {
           if (rbAdmin.Checked)
{
    String check = "SELECT * FROM [admin] WHERE emailid = @emailid AND password = @password";
    SqlCommand com = new SqlCommand(check, con);

    com.Parameters.AddWithValue("@emailid", txtemail.Text);
    com.Parameters.AddWithValue("@password", txtpassword.Text);

    try
    {
        con.Open();
        SqlDataReader reader = com.ExecuteReader();

        if (reader.HasRows)
        {
            reader.Read(); // Move to the first row

            // Check admin status with proper null checking and trimming
            string status = (reader["status"] != DBNull.Value) ? reader["status"].ToString().Trim() : "";
            
            // Debug line - remove in production
            //Response.Write("Status: " + status); // This will help you see what status is being read

            if (string.Equals(status, "Rejected", StringComparison.OrdinalIgnoreCase))
            {
                Label4.ForeColor = System.Drawing.Color.Red;
                Label4.Text = "Your admin account has been rejected. Please contact super administrator.";
                return; // Add return to prevent further execution
            }
            else if (string.Equals(status, "Pending", StringComparison.OrdinalIgnoreCase))
            {
                Label4.ForeColor = System.Drawing.Color.Orange;
                Label4.Text = "Your admin account is pending approval.";
                return; // Add return to prevent further execution
            }
            else if (string.Equals(status, "Approved", StringComparison.OrdinalIgnoreCase))
            {
                Session["UserAuthenticated"] = "Yes";
                Session["AdminID"] = reader["aid"].ToString();
                Session["AdminEmail"] = reader["emailid"].ToString();
                Response.Redirect("adminpanel.aspx");
            }
            else
            {
                Label4.ForeColor = System.Drawing.Color.Red;
                Label4.Text = "Invalid account status. Please contact administrator.";
                return;
            }
        }
        else
        {
            Label4.ForeColor = System.Drawing.Color.Red;
            Label4.Text = "Email Or Password Invalid";
        }

        reader.Close();
    }
    catch (Exception ex)
    {
        Label4.ForeColor = System.Drawing.Color.Red;
        Label4.Text = "An error occurred: " + ex.Message;
    }
    finally
    {
        con.Close();
    }
}
           else if (rbUser.Checked)
           {
               String check = "SELECT * FROM [user] WHERE emailid = @emailid AND password = @password";
               SqlCommand com = new SqlCommand(check, con);

               com.Parameters.AddWithValue("@emailid", txtemail.Text);
               com.Parameters.AddWithValue("@password", txtpassword.Text);

               try
               {
                   con.Open();
                   SqlDataReader reader = com.ExecuteReader();

                   if (reader.HasRows)
                   {
                       reader.Read(); // Move to the first row

                       // Check user status
                       string status = reader["status"].ToString();
                       if (status == "Rejected")
                       {
                           Label4.ForeColor = System.Drawing.Color.Red;
                           Label4.Text = "Your account has been rejected. Please contact administrator.";
                       }
                       else if (status == "Pending")
                       {
                           Label4.ForeColor = System.Drawing.Color.Orange;
                           Label4.Text = "Your account is pending approval.";
                       }
                       else // status is Approved
                       {
                           Session["UserAuthenticated"] = "Yes";
                           Session["UserID"] = reader["uid"].ToString(); // Store user ID in session
                           Session["UserEmail"] = reader["emailid"].ToString(); // Store user email in session
                           Response.Redirect("Home.aspx");
                       }
                   }
                   else
                   {
                       Label4.ForeColor = System.Drawing.Color.Red;
                       Label4.Text = "Email Or Password Invalid";
                   }

                   reader.Close();
               }
               catch (Exception ex)
               {
                   Label4.ForeColor = System.Drawing.Color.Red;
                   Label4.Text = "An error occurred: " + ex.Message;
               }
               finally
               {
                   con.Close();
               }
           }

            else if (rbNGO.Checked)
            {
                String check = "SELECT * FROM [NGO] WHERE emailid = @emailid AND password = @password";
                SqlCommand com = new SqlCommand(check, con);

                com.Parameters.AddWithValue("@emailid", txtemail.Text);
                com.Parameters.AddWithValue("@password", txtpassword.Text);

                try
                {
                    con.Open();
                    SqlDataReader reader = com.ExecuteReader();

                    if (reader.HasRows)
                    {
                        reader.Read(); // Move to the first row

                        // Check NGO status if you have status field for NGOs
                        string status = reader["status"].ToString();
                        if (status == "Rejected")
                        {
                            Label4.ForeColor = System.Drawing.Color.Red;
                            Label4.Text = "Your NGO account has been rejected. Please contact administrator.";
                        }
                        else if (status == "Pending")
                        {
                            Label4.ForeColor = System.Drawing.Color.Orange;
                            Label4.Text = "Your NGO account is pending approval.";
                        }
                        else // status is Approved
                        {
                            Session["UserAuthenticated"] = "Yes";
                            Session["NGOID"] = reader["nid"].ToString(); // Store NGO ID in session
                            Session["NGOEmail"] = reader["emailid"].ToString();
                            Response.Redirect("NGOPanel.aspx");
                        }
                    }
                    else
                    {
                        Label4.ForeColor = System.Drawing.Color.Red;
                        Label4.Text = "Email Or Password Invalid";
                    }

                    reader.Close();
                }
                catch (Exception ex)
                {
                    Label4.ForeColor = System.Drawing.Color.Red;
                    Label4.Text = "An error occurred: " + ex.Message;
                }
                finally
                {
                    con.Close();
                }
            }
        }
    }
}