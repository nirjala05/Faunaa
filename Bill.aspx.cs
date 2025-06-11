using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Faunaa
{
    public partial class Bill : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve order details from session
                if (Session["OrderId"] != null)
                {
                    lblOrderId.Text += Session["OrderId"].ToString();
                }
                else
                {
                    lblOrderId.Text += "N/A";
                }

                lblCustomerName.Text += Session["CustomerName"] != null ? Session["CustomerName"].ToString() : "N/A";
                lblCustomerEmail.Text += Session["CustomerEmail"] != null ? Session["CustomerEmail"].ToString() : "N/A";
                lblCustomerAddress.Text += Session["CustomerAddress"] != null ? Session["CustomerAddress"].ToString() : "N/A";
                lblPaymentMethod.Text += Session["PaymentMethod"] != null ? Session["PaymentMethod"].ToString() : "N/A";

                decimal subtotal = Session["Subtotal"] != null ? Convert.ToDecimal(Session["Subtotal"]) : 0;
                decimal gst = Session["GST"] != null ? Convert.ToDecimal(Session["GST"]) : 0;
                decimal total = Session["Total"] != null ? Convert.ToDecimal(Session["Total"]) : 0;

                lblSubtotal.Text += subtotal.ToString("C");
                lblGST.Text += gst.ToString("C");
                lblTotal.Text += total.ToString("C");
            }
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            // Logic to print the bill can be implemented here
            // For example, you can use JavaScript to open the print dialog
            ClientScript.RegisterStartupScript(this.GetType(), "Print", "window.print();", true);
        }
    }
}