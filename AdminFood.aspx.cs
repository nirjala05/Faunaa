using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI.WebControls;

namespace Faunaa
{
    public partial class AdminFood : System.Web.UI.Page
    {
        private string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\bhvvh\onedrive\documents\visual studio 2010\Projects\Faunaa\Faunaa\App_Data\db.mdf;Integrated Security=True;User Instance=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindFoodGrid();
                BindMedicineGrid();
                BindClothesGrid();
                BindToysGrid();
            }
        }

        // Food Tab
        private void BindFoodGrid()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "SELECT * FROM AnimalItems WHERE Category = 'Food'";
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                gvFood.DataSource = dt;
                gvFood.DataBind();
            }
        }

        protected void btnAddFood_Click(object sender, EventArgs e)
        {
            if (fileFoodImage.HasFile)
            {
                try
                {
                    string fileName = Path.GetFileName(fileFoodImage.PostedFile.FileName);
                    string filePath = "~/uploads/" + fileName;

                    if (!Directory.Exists(Server.MapPath("~/uploads")))
                    {
                        Directory.CreateDirectory(Server.MapPath("~/uploads"));
                    }

                    fileFoodImage.SaveAs(Server.MapPath(filePath));

                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        con.Open();
                        string query = "INSERT INTO AnimalItems (Category, Name, Description, Price, Image) VALUES (@Category, @Name, @Description, @Price, @Image)";
                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@Category", "Food");
                        cmd.Parameters.AddWithValue("@Name", txtFoodName.Text);
                        cmd.Parameters.AddWithValue("@Description", txtFoodDescription.Text);
                        cmd.Parameters.AddWithValue("@Price", Convert.ToDecimal(txtFoodPrice.Text));
                        cmd.Parameters.AddWithValue("@Image", fileName);
                        cmd.ExecuteNonQuery();
                    }

                    BindFoodGrid();
                }
                catch (Exception ex)
                {
                    Response.Write("Error: " + ex.Message);
                }
            }
            else
            {
                Response.Write("Please select an image file.");
            }
        }

        protected void gvFood_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvFood.EditIndex = e.NewEditIndex;
            BindFoodGrid();
        }

        protected void gvFood_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(gvFood.DataKeys[e.RowIndex].Value);
            string name = (gvFood.Rows[e.RowIndex].FindControl("txtName") as TextBox).Text;
            string description = (gvFood.Rows[e.RowIndex].FindControl("txtDescription") as TextBox).Text;
            decimal price = Convert.ToDecimal((gvFood.Rows[e.RowIndex].FindControl("txtPrice") as TextBox).Text);

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "UPDATE AnimalItems SET Name = @Name, Description = @Description, Price = @Price WHERE Id = @Id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Description", description);
                cmd.Parameters.AddWithValue("@Price", price);
                cmd.Parameters.AddWithValue("@Id", id);
                cmd.ExecuteNonQuery();
            }

            gvFood.EditIndex = -1;
            BindFoodGrid();
        }

        protected void gvFood_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvFood.EditIndex = -1;
            BindFoodGrid();
        }

        protected void gvFood_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvFood.DataKeys[e.RowIndex].Value);
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "DELETE FROM AnimalItems WHERE Id = @Id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Id", id);
                cmd.ExecuteNonQuery();
            }
            BindFoodGrid();
        }

        // Medicine Tab
        private void BindMedicineGrid()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "SELECT * FROM AnimalItems WHERE Category = 'Medicine'";
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                gvMedicine.DataSource = dt;
                gvMedicine.DataBind();
            }
        }

        protected void btnAddMedicine_Click(object sender, EventArgs e)
        {
            if (fileMedicineImage.HasFile)
            {
                try
                {
                    string fileName = Path.GetFileName(fileMedicineImage.PostedFile.FileName);
                    string filePath = "~/uploads/" + fileName;

                    if (!Directory.Exists(Server.MapPath("~/uploads")))
                    {
                        Directory.CreateDirectory(Server.MapPath("~/uploads"));
                    }

                    fileMedicineImage.SaveAs(Server.MapPath(filePath));

                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        con.Open();
                        string query = "INSERT INTO AnimalItems (Category, Name, Description, Price, Image) VALUES (@Category, @Name, @Description, @Price, @Image)";
                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@Category", "Medicine");
                        cmd.Parameters.AddWithValue("@Name", txtMedicineName.Text);
                        cmd.Parameters.AddWithValue("@Description", txtMedicineDescription.Text);
                        cmd.Parameters.AddWithValue("@Price", Convert.ToDecimal(txtMedicinePrice.Text));
                        cmd.Parameters.AddWithValue("@Image", fileName);
                        cmd.ExecuteNonQuery();
                    }

                    BindMedicineGrid();
                }
                catch (Exception ex)
                {
                    Response.Write("Error: " + ex.Message);
                }
            }
            else
            {
                Response.Write("Please select an image file.");
            }
        }

        protected void gvMedicine_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvMedicine.EditIndex = e.NewEditIndex;
            BindMedicineGrid();
        }

        protected void gvMedicine_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(gvMedicine.DataKeys[e.RowIndex].Value);
            string name = (gvMedicine.Rows[e.RowIndex].FindControl("txtName") as TextBox).Text;
            string description = (gvMedicine.Rows[e.RowIndex].FindControl("txtDescription") as TextBox).Text;
            decimal price = Convert.ToDecimal((gvMedicine.Rows[e.RowIndex].FindControl("txtPrice") as TextBox).Text);

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "UPDATE AnimalItems SET Name = @Name, Description = @Description, Price = @Price WHERE Id = @Id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Description", description);
                cmd.Parameters.AddWithValue("@Price", price);
                cmd.Parameters.AddWithValue("@Id", id);
                cmd.ExecuteNonQuery();
            }

            gvMedicine.EditIndex = -1;
            BindMedicineGrid();
        }

        protected void gvMedicine_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvMedicine.EditIndex = -1;
            BindMedicineGrid();
        }

        protected void gvMedicine_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvMedicine.DataKeys[e.RowIndex].Value);
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "DELETE FROM AnimalItems WHERE Id = @Id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Id", id);
                cmd.ExecuteNonQuery();
            }
            BindMedicineGrid();
        }

        // Clothes Tab
        private void BindClothesGrid()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "SELECT * FROM AnimalItems WHERE Category = 'Clothes'";
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                gvClothes.DataSource = dt;
                gvClothes.DataBind();
            }
        }

        protected void btnAddClothes_Click(object sender, EventArgs e)
        {
            if (fileClothesImage.HasFile)
            {
                try
                {
                    string fileName = Path.GetFileName(fileClothesImage.PostedFile.FileName);
                    string filePath = "~/uploads/" + fileName;

                    if (!Directory.Exists(Server.MapPath("~/uploads")))
                    {
                        Directory.CreateDirectory(Server.MapPath("~/uploads"));
                    }

                    fileClothesImage.SaveAs(Server.MapPath(filePath));

                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        con.Open();
                        string query = "INSERT INTO AnimalItems (Category, Name, Description, Price, Image) VALUES (@Category, @Name, @Description, @Price, @Image)";
                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@Category", "Clothes");
                        cmd.Parameters.AddWithValue("@Name", txtClothesName.Text);
                        cmd.Parameters.AddWithValue("@Description", txtClothesDescription.Text);
                        cmd.Parameters.AddWithValue("@Price", Convert.ToDecimal(txtClothesPrice.Text));
                        cmd.Parameters.AddWithValue("@Image", fileName);
                        cmd.ExecuteNonQuery();
                    }

                    BindClothesGrid();
                }
                catch (Exception ex)
                {
                    Response.Write("Error: " + ex.Message);
                }
            }
            else
            {
                Response.Write("Please select an image file.");
            }
        }

        protected void gvClothes_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvClothes.EditIndex = e.NewEditIndex;
            BindClothesGrid();
        }

        protected void gvClothes_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(gvClothes.DataKeys[e.RowIndex].Value);
            string name = (gvClothes.Rows[e.RowIndex].FindControl("txtName") as TextBox).Text;
            string description = (gvClothes.Rows[e.RowIndex].FindControl("txtDescription") as TextBox).Text;
            decimal price = Convert.ToDecimal((gvClothes.Rows[e.RowIndex].FindControl("txtPrice") as TextBox).Text);

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "UPDATE AnimalItems SET Name = @Name, Description = @Description, Price = @Price WHERE Id = @Id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Description", description);
                cmd.Parameters.AddWithValue("@Price", price);
                cmd.Parameters.AddWithValue("@Id", id);
                cmd.ExecuteNonQuery();
            }

            gvClothes.EditIndex = -1;
            BindClothesGrid();
        }

        protected void gvClothes_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvClothes.EditIndex = -1;
            BindClothesGrid();
        }

        protected void gvClothes_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvClothes.DataKeys[e.RowIndex].Value);
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "DELETE FROM AnimalItems WHERE Id = @Id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Id", id);
                cmd.ExecuteNonQuery();
            }
            BindClothesGrid();
        }

        // Toys Tab
        private void BindToysGrid()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "SELECT * FROM AnimalItems WHERE Category = 'Toys'";
                SqlDataAdapter sda = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                gvToys.DataSource = dt;
                gvToys.DataBind();
            }
        }

        protected void btnAddToys_Click(object sender, EventArgs e)
        {
            if (fileToysImage.HasFile)
            {
                try
                {
                    string fileName = Path.GetFileName(fileToysImage.PostedFile.FileName);
                    string filePath = "~/uploads/" + fileName;

                    if (!Directory.Exists(Server.MapPath("~/uploads")))
                    {
                        Directory.CreateDirectory(Server.MapPath("~/uploads"));
                    }

                    fileToysImage.SaveAs(Server.MapPath(filePath));

                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        con.Open();
                        string query = "INSERT INTO AnimalItems (Category, Name, Description, Price, Image) VALUES (@Category, @Name, @Description, @Price, @Image)";
                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@Category", "Toys");
                        cmd.Parameters.AddWithValue("@Name", txtToysName.Text);
                        cmd.Parameters.AddWithValue("@Description", txtToysDescription.Text);
                        cmd.Parameters.AddWithValue("@Price", Convert.ToDecimal(txtToysPrice.Text));
                        cmd.Parameters.AddWithValue("@Image", fileName);
                        cmd.ExecuteNonQuery();
                    }

                    BindToysGrid();
                }
                catch (Exception ex)
                {
                    Response.Write("Error: " + ex.Message);
                }
            }
            else
            {
                Response.Write("Please select an image file.");
            }
        }

        protected void gvToys_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvToys.EditIndex = e.NewEditIndex;
            BindToysGrid();
        }

        protected void gvToys_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(gvToys.DataKeys[e.RowIndex].Value);
            string name = (gvToys.Rows[e.RowIndex].FindControl("txtName") as TextBox).Text;
            string description = (gvToys.Rows[e.RowIndex].FindControl("txtDescription") as TextBox).Text;
            decimal price = Convert.ToDecimal((gvToys.Rows[e.RowIndex].FindControl("txtPrice") as TextBox).Text);

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "UPDATE AnimalItems SET Name = @Name, Description = @Description, Price = @Price WHERE Id = @Id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Description", description);
                cmd.Parameters.AddWithValue("@Price", price);
                cmd.Parameters.AddWithValue("@Id", id);
                cmd.ExecuteNonQuery();
            }

            gvToys.EditIndex = -1;
            BindToysGrid();
        }

        protected void gvToys_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvToys.EditIndex = -1;
            BindToysGrid();
        }

        protected void gvToys_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvToys.DataKeys[e.RowIndex].Value);
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "DELETE FROM AnimalItems WHERE Id = @Id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Id", id);
                cmd.ExecuteNonQuery();
            }
            BindToysGrid();
        }
    }
}