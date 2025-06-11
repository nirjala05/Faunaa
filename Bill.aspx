<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bill.aspx.cs" Inherits="Faunaa.Bill" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
<style>
/* General body styles */
body {
    font-family: 'Arial', sans-serif;
    background-color: #f9f9f9; /* Light gray background */
    margin: 0;
    padding: 20px;
}

/* Container for the bill */
div {
    max-width: 600px;
    margin: auto;
    background: #ffffff; /* White background for the bill */
    padding: 30px;
    border-radius: 12px; /* Rounded corners */
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1); /* Soft shadow */
}

/* Heading styles */
h2 {
    text-align: center;
    color: #ffa500;
    margin-bottom: 20px;
    font-size: 28px; /* Increased font size */
}

/* Label styles */
label {
    display: block;
    margin-bottom: 10px;
    color: #333; /* Dark gray for labels */
    font-size: 16px; /* Font size for labels */
}

/* Thank You message styles */
.thank-you {
    text-align: center;
    font-size: 24px; /* Larger font size for thank you message */
    color: #5cb85c; /* Green color for thank you */
    margin-top: 20px;
}

/* Email sent notification styles */
.email-sent {
    text-align: center;
    font-size: 16px; /* Font size for email notification */
    color: #ffa500; /* Light blue color for email sent */
    margin-top: 10px;
}

/* Button styles */
.btn {
    background-color: #ffa500; /* Warm red background */
    color: white; /* White text */
    border: none;
    padding: 12px;
    border-radius: 8px; /* Rounded corners */
    cursor: pointer;
    width: 100%;
    font-size: 20px; /* Increased font size */
    transition: background-color 0.3s, transform 0.3s; /* Smooth transition */
}

/* Button hover effect */
.btn:hover {
    background-color: #ffa07a; /* Darker red on hover */
    transform: translateY(-2px); /* Slight lift effect */
}
</style>
</head>
<body>
     <form id="form1" runat="server">
        <div>
            <h2>Your Order Bill</h2>
            <asp:Label ID="lblOrderId" runat="server" Text="Order ID: "></asp:Label><br />
            <asp:Label ID="lblCustomerName" runat="server" Text="Customer Name: "></asp:Label><br />
            <asp:Label ID="lblCustomerEmail" runat="server" Text="Customer Email: "></asp:Label><br />
            <asp:Label ID="lblCustomerAddress" runat="server" Text="Delivery Address: "></asp:Label><br />
            <asp:Label ID="lblPaymentMethod" runat="server" Text="Payment Method: "></asp:Label><br />
            <asp:Label ID="lblSubtotal" runat="server" Text="Subtotal: "></asp:Label><br />
            <asp:Label ID="lblGST" runat="server" Text="GST (18%): "></asp:Label><br />
            <asp:Label ID="lblTotal" runat="server" Text="Total Amount: "></asp:Label><br />
            <asp:Button ID="btnPrint" runat="server" Text="Print Bill" OnClick="btnPrint_Click" CssClass="btn"/>

            <div class="thank-you">Thank You for Your Order!</div>
            <div class="email-sent">A confirmation email has been sent to your email address.</div>
        </div>
    </form>
</body>
</html>