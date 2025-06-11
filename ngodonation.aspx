<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ngodonation.aspx.cs" Inherits="Faunaa.ngodonation" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
<style>
    :root {
       --primary-color: #4682B4;
        --secondary-color: #2980b9;
        --accent-color: #2ecc71;
        --light-color: #f39c12;
        --white: #ffffff;
        --gray-100: #f8f9fa;
        --gray-200: #e9ecef;
        --shadow: 0 5px 15px rgba(0,0,0,0.1);
    }

    body {
        background-size: cover;
        background-position: center;
        background-attachment: fixed;
        background-repeat: no-repeat;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        color: #333;
    }

     .container {
        max-width: 1150px;
        margin-left: 550px; /* Space for sidebar */
        margin-right: 20px;
        margin-top: 80px; /* Space for header */
        margin-bottom: 60px; /* Space for footer */
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    .page-header {
        background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
        color: white;
        padding: 20px;
        border-radius: 15px;
        margin-bottom: 30px;
        box-shadow: var(--shadow);
        text-align: center;
    }

    .section-card {
        background: white;
        border-radius: 15px;
        padding: 25px;
        margin-bottom: 30px;
        box-shadow: var(--shadow);
        border-left: 5px solid var(--primary-color);
    }

    .form-control {
        border: 2px solid #eee;
        border-radius: 10px;
        padding: 12px;
        transition: all 0.3s ease;
    }

    .form-control:focus {
        border-color: var(--primary-color);
        box-shadow: 0 0 10px rgba(52, 152, 219, 0.2);
    }

    .btn-update {
        background: var(--primary-color);
        color: white;
        border: none;
        padding: 12px 25px;
        border-radius: 50px;
        font-weight: 600;
        transition: all 0.3s ease;
        box-shadow: var(--shadow);
    }

    .btn-update:hover {
        transform: translateY(-2px);
        background: var(--secondary-color);
    }

    .gridview-container {
        overflow-x: auto;
        border-radius: 15px;
        box-shadow: var(--shadow);
    }

    .table {
        width: 100%;
        background: white;
        border-collapse: collapse;
    }

    .table thead th {
        background: var(--primary-color);
        color: white;
        padding: 15px;
        text-align: left;
    }

    .table tbody tr:nth-child(even) {
        background-color: var(--gray-100);
    }

    .table tbody tr:hover {
        background-color: var(--gray-200);
    }

    .table tbody td {
        padding: 15px;
        border-bottom: 1px solid #ddd;
    }

    .status-badge {
        padding: 5px 15px;
        border-radius: 50px;
        font-weight: 600;
        background-color: rgba(46, 204, 113, 0.5);
        color: var(--primary-color);
    }
    
     .sidebar {
        width: 300px;
        background: var(--primary-color);
        padding: 2.5rem 2rem;
        position: fixed;
        height: 100vh;
        left: 0;
        top: 0;
        overflow-y: auto;
    }

    .sidebar h2 {
        color: var(--white);
        font-size: 2rem;
        margin-bottom: 3rem;
        padding-bottom: 1.2rem;
        border-bottom: 3px solid var(--accent-color);
        font-weight: 700;
    }

    .sidebar ul {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .sidebar ul li {
        margin: 0.7rem 0;
    }

    .sidebar ul li a {
        color: var(--white);
        text-decoration: none;
        font-size: 1.2rem;
        padding: 1.2rem 1.8rem;
        display: block;
        border-radius: 10px;
        transition: all 0.3s ease;
        position: relative;
        overflow: hidden;
    }

    .sidebar ul li a:hover {
        background: var(--secondary-color);
        padding-left: 2.5rem;
    }

    .sidebar ul li a::before {
        content: '';
        position: absolute;
        left: 0;
        top: 0;
        height: 100%;
        width: 6px;
        background:#00008B;
        transform: scaleY(0);
        transition: transform 0.2s ease;
    }

    .sidebar ul li a:hover::before {
        transform: scaleY(1);
    }

</style>
</head>
<body>
    <form id="form1" runat="server">
       <div class="container">
            <div class="sidebar">
             <h2>NGO Dashboard</h2>
                <ul>
                 <li><a href="NGOPanel.aspx">&#8962; Home</a></li> <!-- House symbol -->
                <li><a href="NGOPetcare.aspx">&#128024; Pets Care</a></li> <!-- Dog symbol -->
                <li><a href="ngodonation.aspx">&#128176; Manage Donations</a></li> <!-- Money bag symbol -->
                <li><a href="ngoadoption.aspx">&#128049; Manage Adoptions</a></li> <!-- Cat symbol -->
                <li><a href="NGOAdoptionApplication.aspx">&#128218; Adoption Applications</a></li> <!-- Document symbol -->
                <li><a href="login.aspx">&#10060; Logout</a></li>
                </ul>
            </div>
            <div class="page-header">
                <h2>Donation Management</h2>
            </div>

            <div class="section-card">
                <h4>Donation Records</h4>
                <div class="gridview-container">
                    <asp:GridView ID="gvDonations" runat="server" CssClass="table table-hover" 
                        AutoGenerateColumns="False" AllowPaging="True" 
                        OnPageIndexChanging="gvDonations_PageIndexChanging" PageSize="10">
                        <Columns>
                            <asp:BoundField DataField="Name" HeaderText="Donor Name" />
                            <asp:BoundField DataField="Email" HeaderText="Email Address" />
                            <asp:BoundField DataField="Phone" HeaderText="Contact Number" />
                            <asp:BoundField DataField="Amount" HeaderText="Amount" DataFormatString="₹{0:N2}" />
                            <asp:BoundField DataField="DonationDate" HeaderText="Donation Date" DataFormatString="{0:dd MMM yyyy HH:mm}" />
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <span class="status-badge">Completed</span>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:Button ID="btnSendEmail" runat="server" Text="Send Email" 
                                        CommandArgument='<%# Eval("Email") %>' 
                                        OnCommand="btnSendEmail_Command" CssClass="btn-update" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:Label ID="lblUpdateMessage" runat="server"></asp:Label>
                </div>
            </div>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
