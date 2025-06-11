using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Faunaa
{
    public partial class NGOPetCare : System.Web.UI.Page
    {
      
        private string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\bhvvh\onedrive\documents\visual studio 2010\Projects\Faunaa\Faunaa\App_Data\db.mdf;Integrated Security=True;User Instance=True";

        protected void btnInsertPet_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = @"INSERT INTO PetCare (PetType, Breed, HealthCondition, Diet, Medicine, HealthTips) 
                                     VALUES (@PetType, @Breed, @HealthCondition, @Diet, @Medicine, @HealthTips)";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@PetType", txtPetType.Text.Trim());
                    cmd.Parameters.AddWithValue("@Breed", txtBreed.Text.Trim());
                    cmd.Parameters.AddWithValue("@HealthCondition", txtHealthCondition.Text.Trim());
                    cmd.Parameters.AddWithValue("@Diet", txtDiet.Text.Trim());
                    cmd.Parameters.AddWithValue("@Medicine", txtMedicine.Text.Trim());
                    cmd.Parameters.AddWithValue("@HealthTips", txtHealthTips.Text.Trim());

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                lblMessage.Text = "Pet data inserted successfully!";
                lblMessage.Visible = true;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error inserting pet data: " + ex.Message;
                lblMessage.Visible = true;
            }
        }
    }
}