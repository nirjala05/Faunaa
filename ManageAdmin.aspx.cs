using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Faunaa
{
    public partial class ManageAdmin : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\bhvvh\onedrive\documents\visual studio 2010\Projects\Faunaa\Faunaa\App_Data\db.mdf;Integrated Security=True;User Instance=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        private void BindGrid()
        {
            try
            {
                // Include aid in the SELECT statement
                using (SqlCommand cmd = new SqlCommand("SELECT aid, name, emailid, phoneno, address, registration_date, status FROM [admin]", con))
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    gvAdmins.DataSource = dt;
                    gvAdmins.DataBind();
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error loading admins: " + ex.Message, false);
            }
        }

        protected void btnAddAdmin_Click(object sender, EventArgs e)
        {
            if (txtPassword.Text != txtCPassword.Text)
            {
                ShowMessage("Passwords do not match!", false);
                return;
            }

            try
            {
                string query = @"INSERT INTO [admin] (name, emailid, phoneno, address, password, cpassword) 
                               VALUES (@name, @email, @phone, @address, @password, @cpassword)";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@name", txtName.Text.Trim());
                    cmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@phone", txtPhone.Text.Trim());
                    cmd.Parameters.AddWithValue("@address", txtAddress.Text.Trim());
                    cmd.Parameters.AddWithValue("@password", txtPassword.Text);
                    cmd.Parameters.AddWithValue("@cpassword", txtCPassword.Text);
                  

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    ClearForm();
                    ShowMessage("Admin added successfully!", true);
                    BindGrid();
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error adding admin: " + ex.Message, false);
            }
        }

        protected void gvAdmins_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandArgument != null)
            {
                int aid = Convert.ToInt32(e.CommandArgument);

                switch (e.CommandName)
                {
                    case "ApproveAdmin":
                        UpdateAdminStatus(aid, "Approved");
                        break;

                    case "RejectAdmin":
                        UpdateAdminStatus(aid, "Rejected");
                        break;

                    case "DeleteAdmin":
                        DeleteAdmin(aid);
                        break;
                }
            }
        }

        private void UpdateAdminStatus(int aid, string status)
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE [admin] SET status = @status WHERE aid = @aid", con))
                {
                    cmd.Parameters.AddWithValue("@status", status);
                    cmd.Parameters.AddWithValue("@aid", aid);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    ShowMessage("Admin status updated to {status} successfully!", true);
                    BindGrid();
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error updating admin status: " + ex.Message, false);
            }
        }

        private void DeleteAdmin(int aid)
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("DELETE FROM [admin] WHERE aid = @aid", con))
                {
                    cmd.Parameters.AddWithValue("@aid", aid);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    ShowMessage("Admin deleted successfully!", true);
                    BindGrid();
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error deleting admin: " + ex.Message, false);
            }
        }

        private void ShowMessage(string message, bool success)
        {
            lblMessage.Visible = true;
            lblMessage.CssClass = "message " + (success ? "success" : "error");
            lblMessage.Text = message;
        }

        private void ClearForm()
        {
            txtName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            txtAddress.Text = "";
            txtPassword.Text = "";
            txtCPassword.Text = "";
        }
    }
}