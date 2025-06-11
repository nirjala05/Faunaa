using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Faunaa
{
    public partial class manageuser : System.Web.UI.Page
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
            using (SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\bhvvh\onedrive\documents\visual studio 2010\Projects\Faunaa\Faunaa\App_Data\db.mdf;Integrated Security=True;User Instance=True"))
            {
                string query = "SELECT [uid], name, emailid, phoneno, registration_date, status FROM [user]";

                // Apply status filter if selected 
                if (ddlStatus.SelectedValue != "All")
                {
                    query += " WHERE status = @status";
                }

                query += " ORDER BY registration_date DESC";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    if (ddlStatus.SelectedValue != "All")
                    {
                        cmd.Parameters.AddWithValue("@status", ddlStatus.SelectedValue);
                    }

                    try
                    {
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        gvUsers.DataSource = dt;
                        gvUsers.DataBind();
                    }
                    catch (Exception ex)
                    {
                        ShowMessage("Error loading users: " + ex.Message, false);
                    }
                }
            }
        }

        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGrid();
        }

        protected void gvUsers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandArgument != null)
            {
                int uid = Convert.ToInt32(e.CommandArgument);

                switch (e.CommandName)
                {
                    case "ApproveUser":
                        UpdateUserStatus(uid, "Approved");
                        break;

                    case "RejectUser":
                        UpdateUserStatus(uid, "Rejected");
                        break;

                    case "DeleteUser":
                        DeleteUser(uid);
                        break;
                }
            }
        }

        private void UpdateUserStatus(int uid, string status)
        {
            using (SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\bhvvh\onedrive\documents\visual studio 2010\Projects\Faunaa\Faunaa\App_Data\db.mdf;Integrated Security=True;User Instance=True"))
            {
                string query = "UPDATE [user] SET status = @status WHERE [uid] = @uid";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@status", status);
                    cmd.Parameters.AddWithValue("@uid", uid);

                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();
                        ShowMessage("User status updated to {status} successfully!", true);
                        BindGrid();
                    }
                    catch (Exception ex)
                    {
                        ShowMessage("Error updating user status: " + ex.Message, false);
                    }
                }
            }
        }

        private void DeleteUser(int uid)
        {
            using (SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\bhvvh\onedrive\documents\visual studio 2010\Projects\Faunaa\Faunaa\App_Data\db.mdf;Integrated Security=True;User Instance=True"))
            {
                string query = "DELETE FROM [user] WHERE [uid] = @uid";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@uid", uid);

                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();
                        ShowMessage("User deleted successfully!", true);
                        BindGrid();
                    }
                    catch (Exception ex)
                    {
                        ShowMessage("Error deleting user: " + ex.Message, false);
                    }
                }
            }
        }

        private void ShowMessage(string message, bool success)
        {
            lblMessage.Visible = true;
            lblMessage.CssClass = "message " + (success ? "success" : "error");
            lblMessage.Text = message;
        }
    }
}