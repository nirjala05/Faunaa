<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminReview.aspx.cs" Inherits="Faunaa.AdminReview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Admin Review</title>
    <style>
        
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
        
          .header {
            background: var(--primary-color);
            color: var(--white);
            padding: 15px;
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

       /* Update the footer class */
.footer {
    background: var(--secondary-color);
    color: var(--white);
    text-align: center;
    padding: 10px;
    position: fixed; /* Change to fixed */
    bottom: 0;
    width: 100%;
    font-size: 14px;
    z-index: 1000; /* Ensure footer stays on top */
}

         /* Sidebar Styling */
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
        
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        h2 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 30px;
            padding-bottom: 10px;
            border-bottom: 2px solid #3498db;
            font-size: 28px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .application-row {
            margin-bottom: 25px;
            border: 1px solid #e0e0e0;
            padding: 20px;
            border-radius: 8px;
            background-color: #ffffff;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
            transition: transform 0.2s ease;
        }

        .application-row:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        h4 {
            color: #2c3e50;
            margin-top: 0;
            margin-bottom: 15px;
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
            font-size: 20px;
        }

        p {
            margin: 8px 0;
            color: #555;
            line-height: 1.6;
        }

        p strong {
            color: #2c3e50;
            margin-right: 5px;
        }

        .button-group {
            margin-top: 15px;
            display: flex;
            gap: 10px;
            justify-content: flex-start;
        }

        /* Updated Button Styles - Changed selectors to match ASP.NET rendered IDs */
        .button-group input[type="submit"] {
            padding: 10px 25px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: 600;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            margin-right: 10px;
        }

        input[type="submit"][value="Check"] {
            background: linear-gradient(45deg, #3498db, #2980b9);
            color: white;
        }

        input[type="submit"][value="Check"]:hover {
            background: linear-gradient(45deg, #2980b9, #2573a7);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(52, 152, 219, 0.3);
        }

        input[type="submit"][value="Approve"] {
            background: linear-gradient(45deg, #2ecc71, #27ae60);
            color: white;
        }

        input[type="submit"][value="Approve"]:hover {
            background: linear-gradient(45deg, #27ae60, #219a52);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(46, 204, 113, 0.3);
        }

        input[type="submit"][value="Reject"] {
            background: linear-gradient(45deg, #e74c3c, #c0392b);
            color: white;
        }

        input[type="submit"][value="Reject"]:hover {
            background: linear-gradient(45deg, #c0392b, #a93226);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(231, 76, 60, 0.3);
        }

         input[type="submit"][value="Delete"] {
            background: linear-gradient(45deg, #e74c3c, #c0392b);
            color: white;
        }

        input[type="submit"][value="Delete"]:hover {
            background: linear-gradient(45deg, #c0392b, #a93226);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(231, 76, 60, 0.3);
        }

        .status-message {
            display: block;
            margin-top: 10px;
            padding: 10px;
            border-radius: 4px;
            font-weight: 500;
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

        .info-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
            margin-bottom: 20px;
        }

        .info-item {
            padding: 15px;
            background-color: #f8f9fa;
            border-radius: 8px;
            border: 1px solid #e9ecef;
            transition: all 0.3s ease;
        }

        .info-item:hover {
            background-color: #fff;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        @media (max-width: 768px) {
            .info-grid {
                grid-template-columns: 1fr;
            }

            .button-group {
                flex-direction: column;
            }

            #btnCheck, #btnApprove, #btnReject {
                width: 100%;
                margin-bottom: 8px;
            }
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
        <li><a href="login.aspx">&#10060; Logout</a></li> <!-- Cross mark symbol -->
        
    </ul>
</div>
        <div class="container">
            <h2>Review Adoption Applications</h2>
            <asp:Repeater ID="rptApplications" runat="server">
                <ItemTemplate>
                    <div class="application-row">
                        <h4>Application ID: <%# Eval("ApplicationId") %></h4>
                        <div class="user-info">
                            <p><strong>User ID:</strong> <%# Eval("UserId") %></p>
                            <p><strong>Pet ID:</strong> <%# Eval("PetId") %></p>
                        </div>
                        <div class="info-grid">
                            <div class="info-item">
                                <p><strong>Adopter Name:</strong> <%# Eval("AdopterName") %></p>
                                <p><strong>Email:</strong> <%# Eval("Email") %></p>
                                <p><strong>Address:</strong> <%# Eval("Address") %></p>
                                <p><strong>City:</strong> <%# Eval("City") %></p>
                                <p><strong>State:</strong> <%# Eval("State") %></p>
                                <p><strong>Zip Code:</strong> <%# Eval("ZipCode") %></p>
                            </div>
                            <div class="info-item">
                                <p><strong>Total Adults:</strong> <%# Eval("TotalAdults") %></p>
                                <p><strong>Total Children:</strong> <%# Eval("TotalChildren") %></p>
                                <p><strong>Annual Income:</strong> <%# Eval("TotalAnualIncome") %></p>
                                <p><strong>Has Current Pets:</strong> <%# Eval("HasCurrentPets") %></p>
                                <p><strong>Application Date:</strong> <%# Eval("ApplicationDate", "{0:d}") %></p>
                                <p><strong>Status:</strong> <%# Eval("Status") %></p>
                            </div>
                        </div>

                        <div class="button-group">
    <asp:Button ID="btnCheck" runat="server" Text="Check" 
        CommandArgument='<%# Eval("ApplicationId") %>' 
        OnCommand="btnCheck_Command" />
    <asp:Button ID="btnApprove" runat="server" Text="Approve" 
        CommandArgument='<%# Eval("ApplicationId") %>' 
        OnCommand="btnApprove_Command" />
    <asp:Button ID="btnReject" runat="server" Text="Reject" 
        CommandArgument='<%# Eval("ApplicationId") %>' 
        OnCommand="btnReject_Command" />
    <!-- Add the Delete Button -->
    <asp:Button ID="btnDelete" runat="server" Text="Delete" 
        CommandArgument='<%# Eval("ApplicationId") %>' 
        OnCommand="btnDelete_Command" 
        CssClass="delete-button" />
</div>

                        <asp:Label ID="lblStatus" runat="server" CssClass="status-message" />
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:Label ID="lblMessage" runat="server" CssClass="status-message" />
        </div>
    </form>
      <div class="footer">&copy; 2025 Faunaa | Admin Panel</div>
</body>
</html>