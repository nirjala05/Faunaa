using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;

namespace Faunaa
{
    public partial class ManageNewsAndArticles : System.Web.UI.Page
    {
        private string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\bhvvh\onedrive\documents\visual studio 2010\Projects\Faunaa\Faunaa\App_Data\db.mdf;Integrated Security=True;User Instance=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Create Uploads directory if it doesn't exist
                string uploadPath = Server.MapPath("~/uploads");
                if (!Directory.Exists(uploadPath))
                {
                    Directory.CreateDirectory(uploadPath);
                }
            }
        }

        protected void btnAddNews_Click(object sender, EventArgs e)
        {
            if (fileUploadNews.HasFile)
            {
                SaveContent("News", txtNewsTitle.Text, txtNewsContent.Text, fileUploadNews, lblNewsMessage);
            }
            else
            {
                SaveContent("News", txtNewsTitle.Text, txtNewsContent.Text, null, lblNewsMessage);
            }
        }

        protected void btnAddMedia_Click(object sender, EventArgs e)
        {
            if (fileUploadMedia.HasFile)
            {
                SaveContent("Media", txtMediaTitle.Text, txtMediaContent.Text, fileUploadMedia, lblMediaMessage);
            }
            else
            {
                SaveContent("Media", txtMediaTitle.Text, txtMediaContent.Text, null, lblMediaMessage);
            }
        }

        protected void btnAddFact_Click(object sender, EventArgs e)

        {
            SaveContent("Facts", txtFactTitle.Text, txtFactContent.Text, null, lblFactMessage);
        }

        protected void btnAddArticle_Click(object sender, EventArgs e)
        {
            if (fileUploadArticle.HasFile)
            {
                SaveContent("Articles", txtArticleTitle.Text, txtArticleContent.Text, fileUploadArticle, lblArticleMessage);
            }
            else
            {
                SaveContent("Articles", txtArticleTitle.Text, txtArticleContent.Text, null, lblArticleMessage);
            }
        }

        private void SaveContent(string category, string title, string content, FileUpload fileUpload, Label messageLabel)
        {
            string imagePath = null;

            try
            {
                if (fileUpload != null && fileUpload.HasFile)
                {
                    string fileName = Path.GetFileName(fileUpload.FileName);
                    string extension = Path.GetExtension(fileName);
                    string uniqueFileName = DateTime.Now.Ticks.ToString() + extension;
                    string physicalPath = Server.MapPath("~/uploads/") + uniqueFileName;

                    // Save the file
                    fileUpload.SaveAs(physicalPath);

                    // Store the virtual path
                    imagePath = "/uploads/" + uniqueFileName;

                    // Debug message
                    messageLabel.Text = "Image saved at: " + physicalPath + "<br/>";
                }

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = @"INSERT INTO AnimalWelfareContent 
                                   (Title, Content, Image, Category, CreatedDate) 
                                   VALUES (@Title, @Content, @Image, @Category, @CreatedDate)";

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Title", title);
                    cmd.Parameters.AddWithValue("@Content", content);
                    cmd.Parameters.AddWithValue("@Image", (object)imagePath ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@Category", category);
                    cmd.Parameters.AddWithValue("@CreatedDate", DateTime.Now);

                    con.Open();
                    cmd.ExecuteNonQuery();

                    ClearForm(category);
                    messageLabel.Text += "Content added successfully!";
                }
            }
            catch (Exception ex)
            {
                messageLabel.Text = "Error: " + ex.Message;
            }
        }

        private void ClearForm(string category)
        {
            switch (category)
            {
                case "News":
                    txtNewsTitle.Text = "";
                    txtNewsContent.Text = "";
                    break;
                case "Media":
                    txtMediaTitle.Text = "";
                    txtMediaContent.Text = "";
                    break;
                case "Facts":
                    txtFactTitle.Text = "";
                    txtFactContent.Text = "";
                    break;
                case "Articles":
                    txtArticleTitle.Text = "";
                    txtArticleContent.Text = "";
                    break;
            }
        }
    }
}