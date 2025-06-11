using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Faunaa
{
    public partial class ManageBuyPets : System.Web.UI.Page
    {
        private string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\bhvvh\onedrive\documents\visual studio 2010\Projects\Faunaa\Faunaa\App_Data\db.mdf;Integrated Security=True;User Instance=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        protected void btnAddPet_Click(object sender, EventArgs e)
        {
            try
            {
                string name = txtPetName.Text;
                string breed = txtBreed.Text;
                int age = int.Parse(txtAge.Text);
                decimal price = decimal.Parse(txtPrice.Text);
                string description = txtDescription.Text;
                string imagePath = SaveFile(fileUpload);

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("INSERT INTO BuyPets (Name, Breed, Age, Price, Description, Image) VALUES (@Name, @Breed, @Age, @Price, @Description, @Image)", con);
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Breed", breed);
                    cmd.Parameters.AddWithValue("@Age", age);
                    cmd.Parameters.AddWithValue("@Price", price);
                    cmd.Parameters.AddWithValue("@Description", description);
                    cmd.Parameters.AddWithValue("@Image", imagePath ?? (object)DBNull.Value);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                //lblMessage.Text = "Pet added successfully!";
                ClearForm();
                BindGrid();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }
        }

        protected void btnDelete_Command(object sender, CommandEventArgs e)
        {
            int petId = Convert.ToInt32(e.CommandArgument);

            // First get the image path to delete the file
            string imagePath = string.Empty;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT Image FROM BuyPets WHERE Id = @Id", con);
                cmd.Parameters.AddWithValue("@Id", petId);
                con.Open();
                object result = cmd.ExecuteScalar();
                if (result != null && result != DBNull.Value)
                {
                    imagePath = result.ToString();
                }
            }

            // Delete the record
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM BuyPets WHERE Id = @Id", con);
                cmd.Parameters.AddWithValue("@Id", petId);
                con.Open();
                cmd.ExecuteNonQuery();
            }

            // Delete the image file if it exists
            if (!string.IsNullOrEmpty(imagePath))
            {
                string fullPath = Server.MapPath("~/uploads/" + imagePath);
                if (File.Exists(fullPath))
                {
                    File.Delete(fullPath);
                }
            }

            BindGrid();
        }

        private void BindGrid()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM BuyPets", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                // Update image paths for display
                foreach (DataRow row in dt.Rows)
                {
                    string imagePath = row["Image"].ToString();
                    if (!string.IsNullOrEmpty(imagePath))
                    {
                        row["Image"] = "~/uploads/" + imagePath;
                    }
                    else
                    {
                        row["Image"] = "~/uploads/default-pet.jpg";
                    }
                }

                GridViewPets.DataSource = dt;
                GridViewPets.DataBind();
            }
        }

        private string SaveFile(FileUpload fileUpload)
        {
            if (fileUpload.HasFile)
            {
                try
                {
                    string fileName = Path.GetFileName(fileUpload.FileName);
                    string uniqueFileName = Guid.NewGuid().ToString() + "_" + fileName; // Create unique filename
                    string uploadPath = Server.MapPath("~/uploads/");

                    // Create directory if it doesn't exist
                    if (!Directory.Exists(uploadPath))
                    {
                        Directory.CreateDirectory(uploadPath);
                    }

                    string filePath = Path.Combine(uploadPath, uniqueFileName);
                    fileUpload.SaveAs(filePath);
                    return uniqueFileName; // Return just the filename
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error uploading file: " + ex.Message;
                    return null;
                }
            }
            return null;
        }

        private void ClearForm()
        {
            txtPetName.Text = string.Empty;
            txtBreed.Text = string.Empty;
            txtAge.Text = string.Empty;
            txtPrice.Text = string.Empty;
            txtDescription.Text = string.Empty;
        }
    }
}