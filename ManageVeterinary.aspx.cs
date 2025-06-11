using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;

namespace Faunaa
{
    public partial class ManageVeterinary : System.Web.UI.Page
    {
        private readonly string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\bhvvh\onedrive\documents\visual studio 2010\Projects\Faunaa\Faunaa\App_Data\db.mdf;Integrated Security=True;User Instance=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
                LoadNGOData();
            }
        }

        private void BindGrid()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM VeterinaryServices", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string photoPath = string.Empty;

            if (fileUpload.HasFile)
            {
                string fileName = Path.GetFileName(fileUpload.FileName);
                photoPath = "~/uploads/" + fileName;
                fileUpload.SaveAs(Server.MapPath(photoPath));
            }

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"INSERT INTO VeterinaryServices 
                               (Name, Address, ContactTiming, Contact, Location, Photo) 
                               VALUES 
                               (@Name, @Address, @ContactTiming, @Contact, @Location, @Photo)";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                    cmd.Parameters.AddWithValue("@ContactTiming", txtContactTiming.Text.Trim());
                    cmd.Parameters.AddWithValue("@Contact", txtContact.Text.Trim());
                    cmd.Parameters.AddWithValue("@Location", txtLocation.Text.Trim());
                    cmd.Parameters.AddWithValue("@Photo", photoPath);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            BindGrid();
            ClearVeterinaryField();
        }

        // ... existing code ...

        protected void btnAddNGO_Click(object sender, EventArgs e)
        {
            try
            {
                string photoPath = string.Empty;

                if (ngoFileUpload.HasFile)
                {
                    string fileName = Path.GetFileName(ngoFileUpload.FileName);
                    photoPath = "~/uploads/" + fileName;
                    string physicalPath = Server.MapPath(photoPath);

                    // Ensure uploads directory exists
                    string uploadDirectory = Path.GetDirectoryName(physicalPath);
                    if (!Directory.Exists(uploadDirectory))
                    {
                        Directory.CreateDirectory(uploadDirectory);
                    }

                    ngoFileUpload.SaveAs(physicalPath);
                }

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = @"INSERT INTO AddNGO 
                           (Name, Address, WorkingHours, Contact, Location, Photo) 
                           VALUES 
                           (@Name, @Address, @WorkingHours, @Contact, @Location, @Photo)";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Name", txtNGOName.Text.Trim());
                        cmd.Parameters.AddWithValue("@Address", txtNGOAddress.Text.Trim());
                        cmd.Parameters.AddWithValue("@WorkingHours", txtNGOTiming.Text.Trim());
                        cmd.Parameters.AddWithValue("@Contact", txtNGOContact.Text.Trim());
                        cmd.Parameters.AddWithValue("@Location", txtNGOLocation.Text.Trim());
                        cmd.Parameters.AddWithValue("@Photo", photoPath);

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                // Clear fields and reload data
                ClearNGOFields();
                LoadNGOData();

                // Show success message
                ScriptManager.RegisterStartupScript(this, GetType(), "showSuccess",
                    "alert('NGO added successfully!');", true);

                // Keep NGO tab active
                ScriptManager.RegisterStartupScript(this, GetType(), "switchTab",
                    "setTimeout(function() { showTab('ngo'); }, 100);", true);
            }
            catch (Exception ex)
            {
                // Show error message
                ScriptManager.RegisterStartupScript(this, GetType(), "showError",
                    "alert('Error adding NGO: {ex.Message}');", true);
            }
        }

        private void LoadNGOData()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT * FROM AddNGO ORDER BY Id DESC", con))
                    {
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);
                            GridViewNGO.DataSource = dt;
                            GridViewNGO.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showError",
                    "alert('Error loading NGO data: {ex.Message}');", true);
            }
        }

        private void ClearNGOFields()
        {
            txtNGOName.Text = "";
            txtNGOAddress.Text = "";
            txtNGOTiming.Text = "";
            txtNGOContact.Text = "";
            txtNGOLocation.Text = "";
        }

        private void ClearVeterinaryField()
        {
            txtName.Text = "";
            txtAddress.Text = "";
            txtContactTiming.Text = "";
            txtContact.Text = "";
            txtLocation.Text = "";
        }
    }
}