using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace Faunaa
{
    public partial class AddPets : System.Web.UI.Page
    {
        private readonly string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\bhvvh\onedrive\documents\visual studio 2010\Projects\Faunaa\Faunaa\App_Data\db.mdf;Integrated Security=True;User Instance=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPets();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string imagePath = "";
                if (fuImage.HasFile)
                {
                    // Create the directory if it doesn't exist
                    string uploadDir = Server.MapPath("~/Images/Pets");
                    if (!Directory.Exists(uploadDir))
                    {
                        Directory.CreateDirectory(uploadDir);
                    }

                    // Generate unique filename to prevent overwriting
                    string fileName = Path.GetFileName(fuImage.FileName);
                    string uniqueFileName = Guid.NewGuid().ToString() + "_" + fileName;
                    imagePath = "~/Images/Pets/" + uniqueFileName;
                    string physicalPath = Server.MapPath(imagePath);

                    // Save the file
                    fuImage.SaveAs(physicalPath);
                }

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = @"INSERT INTO Pets 
                        (PetName, Type, Breed, Age, Gender, ImagePath, Description, Status) 
                        VALUES 
                        (@PetName, @Type, @Breed, @Age, @Gender, @ImagePath, @Description, 'Available');
                        SELECT SCOPE_IDENTITY();";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@PetName", txtPetName.Text.Trim());
                        cmd.Parameters.AddWithValue("@Type", ddlType.SelectedValue);
                        cmd.Parameters.AddWithValue("@Breed", txtBreed.Text.Trim());
                        cmd.Parameters.AddWithValue("@Age", Convert.ToInt32(txtAge.Text));
                        cmd.Parameters.AddWithValue("@Gender", ddlGender.SelectedValue);
                        cmd.Parameters.AddWithValue("@ImagePath", imagePath);
                        cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());

                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                lblMessage.Text = "Pet added successfully!";
                lblMessage.ForeColor = System.Drawing.Color.Green;
                ClearForm();
                LoadPets();
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Error: " + ex.Message;
            }
        }

        private void LoadPets()
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "SELECT * FROM Pets";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);
                            gvPets.DataSource = dt;
                            gvPets.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Error loading pets: " + ex.Message;
            }
        }

        private void ClearForm()
        {
            txtPetName.Text = "";
            ddlType.SelectedIndex = 0;
            txtBreed.Text = "";
            txtAge.Text = "";
            ddlGender.SelectedIndex = 0;
            txtDescription.Text = "";
        }

        protected void gvPets_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeletePet")
            {
                try
                {
                    int rowIndex = Convert.ToInt32(e.CommandArgument);
                    int petId = Convert.ToInt32(gvPets.DataKeys[rowIndex].Value);
                    DeletePet(petId);
                    LoadPets();
                    lblMessage.Text = "Pet deleted successfully!";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                }
                catch (Exception ex)
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Error deleting pet: " + ex.Message;
                }
            }
        }

        private void DeletePet(int petId)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Pets WHERE PetId = @PetId";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@PetId", petId);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}