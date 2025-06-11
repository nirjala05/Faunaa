using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;

namespace Faunaa
{
    public partial class NewsAndArticles : System.Web.UI.Page
    {
        private string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\bhvvh\onedrive\documents\visual studio 2010\Projects\Faunaa\Faunaa\App_Data\db.mdf;Integrated Security=True;User Instance=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAllContent();
            }
        }

        private void LoadAllContent()
        {
            LoadContent("News", phNews);
            LoadContent("Media", phMedia);
            LoadContent("Facts", phFacts);
            LoadContent("Articles", phArticles);
        }

        private void LoadContent(string category, PlaceHolder placeHolder)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    string query = @"SELECT Id, Title, Content, Image, CreatedDate 
                           FROM AnimalWelfareContent 
                           WHERE Category = @Category 
                           ORDER BY CreatedDate DESC";

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Category", category);

                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    StringBuilder sb = new StringBuilder();

                    if (!reader.HasRows)
                    {
                        sb.Append("<div class='content-item'>");
                        sb.Append("<p>No content available for " + category + " at the moment.</p>");
                        sb.Append("</div>");
                    }
                    else
                    {
                        while (reader.Read())
                        {
                            sb.Append("<div class='content-item'>");

                            // Title
                            sb.Append("<h4>" + Server.HtmlEncode(reader["Title"].ToString()) + "</h4>");

                            // Image
                            if (reader["Image"] != DBNull.Value && !string.IsNullOrEmpty(reader["Image"].ToString()))
                            {
                                string imagePath = reader["Image"].ToString();

                                // Debug information
                                sb.Append("<!-- Original image path: " + imagePath + " -->");

                                // Ensure path starts with /
                                if (!imagePath.StartsWith("/"))
                                {
                                    imagePath = "/" + imagePath;
                                }

                                string fullImagePath = ResolveUrl("~" + imagePath);

                                // More debug information
                                sb.Append("<!-- Resolved image path: " + fullImagePath + " -->");

                                sb.Append("<img src='" + fullImagePath + "' alt='" +
                                    Server.HtmlEncode(reader["Title"].ToString()) +
                                    "' class='content-image' onerror=\"console.log('Image failed to load:', this.src);\" />");
                            }

                            // Content
                            sb.Append("<p>" + Server.HtmlEncode(reader["Content"].ToString()) + "</p>");

                            // Date
                            if (reader["CreatedDate"] != DBNull.Value)
                            {
                                DateTime createdDate = Convert.ToDateTime(reader["CreatedDate"]);
                                sb.Append("<small>Posted on: " + createdDate.ToString("MMM dd, yyyy") + "</small>");
                            }

                            sb.Append("</div>");
                        }
                    }

                    reader.Close();
                    placeHolder.Controls.Add(new LiteralControl(sb.ToString()));
                }
                catch (Exception ex)
                {
                    placeHolder.Controls.Add(new LiteralControl("Error loading " + category + ": " + ex.Message));
                }
            }
        }
    }
}