using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace Faunaa
{
    public partial class PetCareTips : Page
    {
        private string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\bhvvh\onedrive\documents\visual studio 2010\Projects\Faunaa\Faunaa\App_Data\db.mdf;Integrated Security=True;User Instance=True";

        protected void btnGetTips_Click(object sender, EventArgs e)
        {
            string petType = ddlPetType.SelectedValue;
            string breed = txtBreed.Text.Trim();
            string healthCondition = ddlHealth.SelectedValue;

            if (petType == "0" || healthCondition == "0")
            {
                lblResults.Text = "Please select all fields.";
                results.Visible = true;
                return;
            }

            string tips = GetPetCareTips(petType, breed, healthCondition);
            lblResults.Text = tips;
            results.Visible = true;
        }

        private string GetPetCareTips(string petType, string breed, string healthCondition)
        {
            string tips = string.Empty;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"SELECT Diet, Medicine, HealthTips 
                                 FROM PetCare 
                                 WHERE PetType = @PetType 
                                 AND Breed = @Breed 
                                 AND HealthCondition = @HealthCondition";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@PetType", petType);
                cmd.Parameters.AddWithValue("@Breed", breed);
                cmd.Parameters.AddWithValue("@HealthCondition", healthCondition);

                try
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        tips = "<strong>Diet:</strong> " + reader["Diet"].ToString() + "<br/>" +
                               "<strong>Medicine:</strong> " + reader["Medicine"].ToString() + "<br/>" +
                               "<strong>Health Tips:</strong> " + reader["HealthTips"].ToString();
                    }
                    else
                    {
                        tips = "No tips found for the selected criteria.";
                    }
                }
                catch (Exception ex)
                {
                    tips = "Error retrieving tips: " + ex.Message;
                }
            }

            return tips;
        }
    }
}