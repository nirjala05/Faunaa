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
    public partial class AddGrommingTraining : System.Web.UI.Page
    {
         protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCenters();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string imagePath = "";
                if (fullimage.HasFile)
                {
                    string fileName = Path.GetFileName(fullimage.FileName);
                    imagePath = "~/Images/Centers/" + fileName;
                    string physicalPath = Server.MapPath(imagePath);
                    fullimage.SaveAs(physicalPath);
                }

                string services = "";
                foreach (ListItem item in cblServices.Items)
                {
                    if (item.Selected)
                    {
                        services += item.Text + ", ";
                    }
                }
                services = services.TrimEnd(',', ' ');

               // string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\bhvvh\onedrive\documents\visual studio 2010\Projects\Faunaa\Faunaa\App_Data\db.mdf;Integrated Security=True;User Instance=True"))
                {
                    string query = @"INSERT INTO GroomingTrainingCenters 
                    (CenterName, Address, Contact, Services, ImagePath, Description) 
                    VALUES (@Name, @Address, @Contact, @Services, @ImagePath, @Description)";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                        cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                        cmd.Parameters.AddWithValue("@Contact", txtContact.Text.Trim());
                        cmd.Parameters.AddWithValue("@Services", services);
                        cmd.Parameters.AddWithValue("@ImagePath", imagePath);
                        cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());

                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                lblMessage.Text = "Center added successfully!";
                ClearForm();
                LoadCenters();
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Error: " + ex.Message;
            }
        }

        private void LoadCenters()
        {
            try
            {
                //string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\bhvvh\onedrive\documents\visual studio 2010\Projects\Faunaa\Faunaa\App_Data\db.mdf;Integrated Security=True;User Instance=True"))
                {
                    string query = "SELECT * FROM GroomingTrainingCenters";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);
                            gvCenters.DataSource = dt;
                            gvCenters.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Error loading centers: " + ex.Message;
            }
        }

        private void ClearForm()
        {
            txtName.Text = "";
            txtAddress.Text = "";
            txtContact.Text = "";
            txtDescription.Text = "";
            foreach (ListItem item in cblServices.Items)
            {
                item.Selected = false;
            }
        }

        protected void gvCenters_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "DeleteCenter")
                {
                    int rowIndex = Convert.ToInt32(e.CommandArgument);
                    GridViewRow row = gvCenters.Rows[rowIndex];
                    string centerId = gvCenters.DataKeys[rowIndex].Value.ToString();

                    DeleteCenter(Convert.ToInt32(centerId));
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Text = "Center deleted successfully!";
                    LoadCenters();
                }
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Error: " + ex.Message;
            }
        }

        private void DeleteCenter(int centerId)
        {
            //string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\bhvvh\onedrive\documents\visual studio 2010\Projects\Faunaa\Faunaa\App_Data\db.mdf;Integrated Security=True;User Instance=True"))

            {
                string query = "DELETE FROM GroomingTrainingCenters WHERE CenterId = @CenterId";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@CenterId", centerId);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}
    