using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Faunaa
{
    public partial class ManageNGO : System.Web.UI.Page
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
                using (SqlCommand cmd = new SqlCommand("SELECT nid, name, emailid, phoneno, address, registration_date, status FROM [NGO]", con))
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    gvNGOs.DataSource = dt;
                    gvNGOs.DataBind();
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error loading NGOs: " + ex.Message, false);
            }
        }

        protected void btnAddNGO_Click(object sender, EventArgs e)
        {
            if (txtPassword.Text != txtCPassword.Text)
            {
                ShowMessage("Passwords do not match!", false);
                return;
            }

            try
            {
                string query = @"INSERT INTO [NGO] (name, emailid, phoneno, address, password, cpassword, status) 
                               VALUES (@name, @emailid, @phoneno, @address, @password, @cpassword, 'Pending')";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@name", txtNGOName.Text.Trim());
                    cmd.Parameters.AddWithValue("@emailid", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@phoneno", txtPhone.Text.Trim());
                    cmd.Parameters.AddWithValue("@address", txtAddress.Text.Trim());
                    cmd.Parameters.AddWithValue("@password", txtPassword.Text);
                    cmd.Parameters.AddWithValue("@cpassword", txtCPassword.Text);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    ClearForm();
                    ShowMessage("NGO added successfully!", true);
                    BindGrid();
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error adding NGO: " + ex.Message, false);
            }
        }

        protected void gvNGOs_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandArgument != null)
                {
                    // Get the row index
                    int rowIndex = Convert.ToInt32(e.CommandArgument);
                    
                    // Get the NGO ID from the GridView
                    GridViewRow row = gvNGOs.Rows[rowIndex];
                    int ngoId = Convert.ToInt32(row.Cells[0].Text); // Assuming nid is in the first column

                    switch (e.CommandName)
                    {
                        case "ApproveNGO":
                            UpdateNGOStatus(ngoId, "Approved");
                            break;

                        case "RejectNGO":
                            UpdateNGOStatus(ngoId, "Rejected");
                            break;

                        case "DeleteNGO":
                            DeleteNGO(ngoId);
                            break;
                    }
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error processing command: " + ex.Message, false);
            }
        }

        private void UpdateNGOStatus(int ngoId, string status)
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE [NGO] SET status = @status WHERE nid = @nid", con))
                {
                    cmd.Parameters.AddWithValue("@status", status);
                    cmd.Parameters.AddWithValue("@nid", ngoId);

                    con.Open();
                    int result = cmd.ExecuteNonQuery();
                    con.Close();

                    if (result > 0)
                    {
                        ShowMessage("NGO status updated successfully!", true);
                        BindGrid();
                    }
                    else
                    {
                        ShowMessage("NGO not found.", false);
                    }
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error updating NGO status: " + ex.Message, false);
            }
        }

        private void DeleteNGO(int ngoId)
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("DELETE FROM [NGO] WHERE nid = @nid", con))
                {
                    cmd.Parameters.AddWithValue("@nid", ngoId);

                    con.Open();
                    int result = cmd.ExecuteNonQuery();
                    con.Close();

                    if (result > 0)
                    {
                        ShowMessage("NGO deleted successfully!", true);
                        BindGrid();
                    }
                    else
                    {
                        ShowMessage("NGO not found or already deleted.", false);
                    }
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error deleting NGO: " + ex.Message, false);
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
            txtNGOName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            txtAddress.Text = "";
            txtPassword.Text = "";
            txtCPassword.Text = "";
        }
    }
}