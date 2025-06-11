using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Faunaa
{
    public partial class AnimalDeathAdmin : System.Web.UI.Page
    {
        private string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\bhvvh\onedrive\documents\visual studio 2010\Projects\Faunaa\Faunaa\App_Data\db.mdf;Integrated Security=True;User Instance=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        private void LoadData()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = @"SELECT DeathId, AnimalType, Guidelines, 
                                   Address, EmergencyNumber, DateAdded
                                   FROM AnimalDeaths ORDER BY DateAdded DESC";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            gvAnimalDeaths.DataSource = dt;
                            gvAnimalDeaths.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error loading data: " + ex.Message, false);
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                // Validate input
                if (string.IsNullOrEmpty(txtAnimalType.Text.Trim()) ||
                    string.IsNullOrEmpty(txtEmergencyNumber.Text.Trim()))
                    
                {
                    ShowMessage("Please fill in all required fields.", false);
                    return;
                }

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    string query;

                    if (string.IsNullOrEmpty(hfDeathId.Value))
                    {
                        // Insert new record
                        query = @"INSERT INTO AnimalDeaths 
                            (AnimalType, Guidelines, Address, EmergencyNumber, DateAdded) 
                            VALUES 
                            (@AnimalType, @Guidelines, @Address, @EmergencyNumber, GETDATE())";
                    }
                    else
                    {
                        // Update existing record
                        query = @"UPDATE AnimalDeaths SET 
                            AnimalType = @AnimalType, 
                            Guidelines = @Guidelines, 
                            Address = @Address,
                            EmergencyNumber = @EmergencyNumber, 
                            WHERE DeathId = @DeathId";
                    }

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        // Add parameters with correct size limits
                        cmd.Parameters.AddWithValue("@AnimalType",
                            txtAnimalType.Text.Trim().Length > 50 ?
                            txtAnimalType.Text.Trim().Substring(0, 50) :
                            txtAnimalType.Text.Trim());
                        cmd.Parameters.AddWithValue("@Guidelines", txtGuidelines.Text.Trim());
                        cmd.Parameters.AddWithValue("@Address", txtaddress.Text.Trim());
                        cmd.Parameters.AddWithValue("@EmergencyNumber",
                            txtEmergencyNumber.Text.Trim().Length > 50 ?
                            txtEmergencyNumber.Text.Trim().Substring(0, 50) :
                            txtEmergencyNumber.Text.Trim());

                        if (!string.IsNullOrEmpty(hfDeathId.Value))
                        {
                            cmd.Parameters.AddWithValue("@DeathId", Convert.ToInt32(hfDeathId.Value));
                        }

                        cmd.ExecuteNonQuery();
                    }
                }

                ShowMessage("Information saved successfully!", true);
                ClearForm();
                LoadData();
            }
            catch (Exception ex)
            {
                ShowMessage("Error: " + ex.Message, false);
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ClearForm();
        }

        private void ClearForm()
        {
            hfDeathId.Value = "";
            txtAnimalType.Text = "";
            txtGuidelines.Text = "";
            txtaddress.Text = "";
            txtEmergencyNumber.Text = "";
            btnAdd.Text = "Add";
            lblMessage.Text = "";
        }

        protected void gvAnimalDeaths_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "EditRow")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    int deathId = Convert.ToInt32(gvAnimalDeaths.DataKeys[index].Value);

                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        string query = @"SELECT DeathId, AnimalType,Guidelines, 
                                       Address, EmergencyNumber 
                                       FROM AnimalDeaths WHERE DeathId = @DeathId";
                        using (SqlCommand cmd = new SqlCommand(query, con))
                        {
                            cmd.Parameters.AddWithValue("@DeathId", deathId);
                            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                            {
                                DataTable dt = new DataTable();
                                sda.Fill(dt);

                                if (dt.Rows.Count > 0)
                                {
                                    hfDeathId.Value = deathId.ToString();
                                    txtAnimalType.Text = dt.Rows[0]["AnimalType"].ToString();
                                    txtGuidelines.Text = dt.Rows[0]["Guidelines"].ToString();
                                    txtaddress.Text = dt.Rows[0]["Address"].ToString();
                                    txtEmergencyNumber.Text = dt.Rows[0]["EmergencyNumber"].ToString();
                                    btnAdd.Text = "Update";
                                }
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error editing record: " + ex.Message, false);
            }
        }

        protected void gvAnimalDeaths_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int deathId = Convert.ToInt32(gvAnimalDeaths.DataKeys[e.RowIndex].Value);
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    string query = "DELETE FROM AnimalDeaths WHERE DeathId = @DeathId";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@DeathId", deathId);
                        cmd.ExecuteNonQuery();
                    }
                }

                ShowMessage("Record deleted successfully!", true);
                LoadData();
            }
            catch (Exception ex)
            {
                ShowMessage("Error deleting record: " + ex.Message, false);
            }
        }

        private void ShowMessage(string message, bool success)
        {
            lblMessage.Text = message;
            lblMessage.CssClass = success ? "success-message" : "error-message";
        }
    }
}