<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Faunaa.Cart" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Your Cart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        h1 {
            text-align: center;
            color: #333;
            margin-top: 20px;
        }
        .cart-container {
            max-width: 900px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            max-height:3000px;
        }
        .cart-item {
            display: flex;
            align-items: center;
            border-bottom: 1px solid #ddd;
            padding: 15px 0;
        }
        .cart-item:last-child {
            border-bottom: none;
        }
        .cart-item img {
            width: 100px;
            height: 100px;
            border-radius: 8px;
            margin-right: 20px;
        }
        .cart-item-details {
            flex-grow: 1;
        }
        .cart-item-details h3 {
            margin: 0;
            color: #333;
            font-size: 18px;
        }
        .cart-item-details p {
            margin: 5px 0;
            color: #666;
            font-size: 14px;
        }
        .btn-checkout {
            display: block;
            width: 100%;
            padding: 15px;
            background-color: #ffa500;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            text-align: center;
            margin-top: 20px;
        }
        .btn-checkout:hover {
            background-color:#ffa500;
        }
        .grid-view {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .grid-view th, .grid-view td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: left;
        }
        .grid-view th {
            background-color: #ffa500;
            color: white;
        }
        .grid-view tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .gst-details {
            margin-top: 20px;
            padding: 15px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .gst-details h3 {
            margin: 0 0 10px 0;
            color: #333;
            font-size: 16px;
        }
        .gst-details p {
            margin: 5px 0;
            color: #666;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="cart-container">
            <h1>Your Cart</h1>

            <!-- Repeater for Cart Items -->
            <asp:Repeater ID="RepeaterCart" runat="server">
                <ItemTemplate>
                    <div class="cart-item">
                        <img src='<%# ResolveUrl("~/uploads/" + Eval("Image")) %>' alt="Item Image" />
                        <div class="cart-item-details">
                            <h3><%# Eval("Name") %></h3>
                            <p>Category: <%# Eval("Category") %></p>
                            <p>Price: ₹<%# Eval("Price") %></p>
                            <p>GST (18%): ₹<%# Convert.ToDecimal(Eval("Price")) * 0.18m %></p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <!-- GridView for Cart Items -->
            <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="False" CssClass="grid-view">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="Category" HeaderText="Category" />
                    <asp:BoundField DataField="Price" HeaderText="Price" />
                    <asp:BoundField DataField="GST" HeaderText="GST (18%)" DataFormatString="{0:C}" />
                </Columns>
            </asp:GridView>

            <!-- GST Details Section -->
            <div class="gst-details">
                <h3>GST Details</h3>
                <p>Total GST (18%): ₹<asp:Literal ID="litTotalGST" runat="server" /></p>
                <p>Total Amount (Including GST): ₹<asp:Literal ID="litTotalAmount" runat="server" /></p>
            </div>

            <!-- Checkout Button -->
            <asp:Button ID="btnCheckout" runat="server" Text="Proceed to Checkout" OnClick="btnCheckout_Click" CssClass="btn-checkout" />
        </div>
    </form>
</body>
</html>