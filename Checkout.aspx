<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="Faunaa.Checkout" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Checkout - Faunaa</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .checkout-container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .total-price {
            font-size: 24px;
            font-weight: bold;
            color: #4CAF50; /* Green for nature theme */
        }
        .btn
        {
            background-color:#ffa500;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="checkout-container">
            <h1>Checkout</h1>

            <!-- Message Label -->
            <asp:Label ID="lblMessage" runat="server" CssClass="error-message" Visible="false"></asp:Label>

            <!-- Total Price Label -->
            <div>
                <span>Total Price (including GST): </span>
                <asp:Label ID="litTotalPrice" runat="server" CssClass="total-price" />
            </div>

            <!-- GridView to display cart items -->
            <asp:GridView ID="gvCheckout" runat="server" CssClass="table table-bordered" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="Category" HeaderText="Category" />
                    <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="GST" HeaderText="GST" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="TotalPrice" HeaderText="Total Price" DataFormatString="{0:C}" />
                 </Columns>
            </asp:GridView>

            <!-- Customer details form -->
            <div class="form-group">
                <asp:Label ID="lblName" runat="server" Text="Name:"></asp:Label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblEmail" runat="server" Text="Email Id:"></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="Invalid email id" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </div>

            <div class="form-group">
                <asp:Label ID="lblAddress" runat="server" Text="Address:"></asp:Label>
                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblPayment" runat="server" Text="Payment Method:"></asp:Label>
                <asp:DropDownList ID="ddlPayment" runat="server" CssClass="form-control">
                   
                    <asp:ListItem Text="Cash on Delivery" Value="Cash on Delivery"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <!-- Place Order button -->
            <asp:Button ID="btnPlaceOrder" runat="server" Text="Place Order" OnClick="btnPlaceOrder_Click" CssClass="btn" />
        </div>
    </form>
</body>
</html>