using System;
using System.Web.UI;

namespace Faunaa
{
    public partial class TermsAndConditions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Verify user is logged in
                if (Session["UserAuthenticated"] == null || Session["UserAuthenticated"].ToString() != "Yes")
                {
                    Response.Redirect("Login.aspx");
                }

                // Verify PetId is present
                if (string.IsNullOrEmpty(Request.QueryString["PetId"]))
                {
                    Response.Redirect("Adoption.aspx");
                }
            }
        }

        protected void btnProceed_Click(object sender, EventArgs e)
        {
            if (chkAcceptTerms.Checked)
            {
                string petId = Request.QueryString["PetId"];
                Response.Redirect("AdoptionForm.aspx?PetId=" + petId + "&TermsAccepted=true");
            }
            else
            {
                // Show error message that terms must be accepted
                ScriptManager.RegisterStartupScript(this, GetType(), "alert",
                    "alert('Please accept the terms and conditions to proceed.');", true);
            }
        }
    }
}