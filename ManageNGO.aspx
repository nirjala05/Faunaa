﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageNGO.aspx.cs" Inherits="Faunaa.ManageNGO" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Manage NGOs</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .form-section {
            margin-bottom: 30px;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-control {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .btn-primary {
            background-color: var(--accent-color);
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn-primary:hover {
            transform: scale(1.05);
        }
        .grid {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .grid th {
            background-color: #ff8c00;
            color: white;
            padding: 12px;
            text-align: left;
        }
        .grid td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        .btn {
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin: 0 2px;
        }
        .btn-approve { background-color: #28a745; color: white; }
        .btn-reject { background-color: #dc3545; color: white; }
        .btn-delete { background-color: #FF0000; color: white; }
        .message {
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 4px;
        }
        .success { background-color: #d4edda; color: #155724; }
        .error { background-color: #f8d7da; color: #721c24; }
        
        :root {
            --primary-color: #2D3250;
            --secondary-color: #424769;
            --accent-color: #7077A1;
            --light-color: #F6B17A;
            --white: #ffffff;
            --gray-100: #f8f9fa;
            --gray-200: #e9ecef;
            --shadow: 0 5px 15px rgba(0,0,0,0.08);
        }

        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
            background: var(--gray-100);
            color: var(--primary-color);
            line-height: 1.6;
        }

        .admin-panel {
            display: flex;
            min-height: 100vh;
            flex-direction: column;
        }

        .header {
            background: var(--primary-color);
            color: var(--white);
            padding: 15px;
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .footer {
            background: var(--secondary-color);
            color: var(--white);
            text-align: center;
            padding: 10px;
            position: fixed;
            bottom: 0;
            width: 100%;
            font-size: 14px;
            z-index: 1000;
        }

        .sidebar {
            width: 300px;
            background: var(--primary-color);
            padding: 2rem 1.5rem;
            position: fixed;
            height: 100vh;
            left: 0;
            top: 0;
            overflow-y: auto;
        }

        .sidebar h2 {
            color: var(--white);
            font-size: 1.75rem;
            margin-bottom: 2.5rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid var(--accent-color);
            font-weight: 600;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .sidebar ul li {
            margin: 0.5rem 0;
        }

        .sidebar ul li a {
            color: var(--white);
            text-decoration: none;
            font-size: 1.1rem;
            padding: 1rem 1.5rem;
            display: block;
            border-radius: 8px;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .sidebar ul li a:hover {
            background: var(--secondary-color);
            padding-left: 2rem;
        }

        .sidebar ul li a::before {
            content: '';
            position: absolute;
            left: 0;
            top: 0;
            height: 100%;
            width: 4px;
            background: var(--light-color);
            transform: scaleY(0);
            transition: transform 0.2s ease;
        }

        .sidebar ul li a:hover::before {
            transform: scaleY(1);
        }

        /* Additional styles for form elements */
        .form-container {
            margin-left: 270px; /* Adjust based on sidebar width */
            padding: 20px;
        }

        .input-group {
            margin-bottom: 20px;
        }

        .input-group label {
            display: block;
            margin-bottom: 5px;
            color: var(--primary-color);
            font-weight: 500;
        }

        .input-group input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            transition: border-color 0.3s ease;
        }

        .input-group input:focus {
            border-color: var(--accent-color);
            outline: none;
        }

        /* Grid styling */
        #gvNGOs {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            background: white;
            box-shadow: var(--shadow);
        }

        #gvNGOs th {
            background: var(--primary-color);
            color: white;
            padding: 12px;
            text-align: left;
        }

        #gvNGOs td {
            padding: 10px;
            border-bottom: 1px solid var(--gray-200);
        }

        #gvNGOs tr:hover {
            background-color: var(--gray-100);
        }
         .message {
            padding: 15px;
            margin: 20px 0;
            border-radius: 4px;
            font-size: 14px;
            font-weight: bold;
            display: block;
            text-align: center;
        }

        .success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .error {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }

        /* Add animation for messages */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .message {
            animation: fadeIn 0.5s ease-in;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <span>Admin Panel</span>
        </div>
        
        <div class="sidebar">
    <ul>
        <li><a href="adminpanel.aspx">&#8962; Home</a></li> <!-- House symbol -->
        <li><a href="manageuser.aspx">&#128100; Users</a></li> <!-- User symbol -->
        <li><a href="ManageAdmin.aspx">&#128274; Admin</a></li> <!-- Shield symbol -->
        <li><a href="ManageNGO.aspx">&#127968; NGO</a></li> <!-- Globe symbol -->
        <li><a href="ManageBuyPets.aspx">&#128024; Pets</a></li> <!-- Dog symbol -->
        <li><a href="AddPets.aspx">&#128049; Adoptions</a></li> <!-- Cat symbol -->
        <li><a href="AdminReview.aspx">&#128218; Adoptions Applications</a></li> <!-- Document symbol -->
        <li><a href="AdminDonations.aspx">&#128176; Donations</a></li> <!-- Money bag symbol -->
       <li><a href="AdminFood.aspx">&#128138; Food & Medicine</a></li> <!-- Pill Emoji -->
        <li><a href="ManageVeterinary.aspx">&#128021; Veterinary & Services</a></li> <!-- Vet symbol -->
        <li><a href="ManageNewsAndArticles.aspx">&#128196; Article & Facts</a></li> <!-- Newspaper symbol -->
        <li><a href="AddGrommingTraining.aspx">&#128218; Grooming & Training</a></li> <!-- Document symbol -->
        <li><a href="AnimalDeathAdmin.aspx">&#128128; PetDeath Information</a></li> <!-- Pet symbol -->
        <li><a href="SetAlerts.aspx">&#9888; Set Alerts</a></li>
        <li><a href="login.aspx">&#10060; Logout</a></li><!-- Cross mark symbol -->
        
    </ul>
</div>

        <div class="form-container">
            <div class="container">
                <h2>Add New NGO</h2>
                <asp:Label ID="lblMessage" runat="server" Visible="false" CssClass="message"></asp:Label>
                
                <div class="form-section">
                    <div class="input-group">
                        <asp:Label ID="Label1" runat="server" Text="NGO Name:"></asp:Label>
                        <asp:TextBox ID="txtNGOName" runat="server" CssClass="form-control" required></asp:TextBox>
                    </div>
                    
                    <div class="input-group">
                        <asp:Label ID="Label2" runat="server" Text="Email:"></asp:Label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" required></asp:TextBox>
                    </div>
                    
                    <div class="input-group">
                        <asp:Label ID="Label3" runat="server" Text="Phone:"></asp:Label>
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" required></asp:TextBox>
                    </div>
                    
                    <div class="input-group">
                        <asp:Label ID="Label4" runat="server" Text="Address:"></asp:Label>
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine" required></asp:TextBox>
                    </div>
                   
                    <div class="input-group">
                        <asp:Label ID="Label6" runat="server" Text="Password:"></asp:Label>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" required></asp:TextBox>
                    </div>
                    
                    <div class="input-group">
                        <asp:Label ID="Label7" runat="server" Text="Confirm Password:"></asp:Label>
                        <asp:TextBox ID="txtCPassword" runat="server" TextMode="Password" CssClass="form-control" required></asp:TextBox>
                    </div>
                    
                    <asp:Button ID="btnAddNGO" runat="server" Text="Add NGO" OnClick="btnAddNGO_Click" CssClass="btn-primary" />
                </div>

                <h2>Manage NGOs</h2>
 <asp:GridView ID="gvNGOs" runat="server" AutoGenerateColumns="False" 
    OnRowCommand="gvNGOs_RowCommand" CssClass="grid">
    <Columns>
        <asp:BoundField DataField="nid" HeaderText="ID" />
        <asp:BoundField DataField="name" HeaderText="NGO Name" />
        <asp:BoundField DataField="emailid" HeaderText="Email" />
        <asp:BoundField DataField="phoneno" HeaderText="Phone" />
        <asp:BoundField DataField="address" HeaderText="Address" />
        <asp:BoundField DataField="registration_date" HeaderText="Registration Date" />
        <asp:BoundField DataField="status" HeaderText="Status" />
        <asp:TemplateField HeaderText="Actions">
            <ItemTemplate>
                <asp:LinkButton ID="btnApprove" runat="server" 
                    CommandName="ApproveNGO" 
                    CommandArgument="<%# Container.DataItemIndex %>"
                    CssClass="btn btn-approve" 
                    Text="Approve"
                    Visible='<%# Eval("status").ToString() != "Approved" %>'>
                </asp:LinkButton>
                <asp:LinkButton ID="btnReject" runat="server" 
                    CommandName="RejectNGO" 
                    CommandArgument="<%# Container.DataItemIndex %>"
                    CssClass="btn btn-reject" 
                    Text="Reject"
                    Visible='<%# Eval("status").ToString() != "Rejected" %>'>
                </asp:LinkButton>
                <asp:LinkButton ID="btnDelete" runat="server" 
                    CommandName="DeleteNGO" 
                    CommandArgument="<%# Container.DataItemIndex %>"
                    CssClass="btn btn-delete" 
                    Text="Delete"
                    OnClientClick="return confirm('Are you sure you want to delete this NGO?');">
                </asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
            </div>
        </div>
        <div class="footer">&copy; 2025 Faunaa | Admin Panel</div>
    </form>
</body>
</html>