<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDonations.aspx.cs" Inherits="Faunaa.AdminDonations" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Admin - Animal Welfare Donation Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet" />
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

        body {
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            background-repeat: no-repeat;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 80vh;
            position: relative;
            padding: 20px;
            color: #333;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin-left:600px;
        }

        .page-header {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 20px;
            border-radius: 15px;
            margin-bottom: 30px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .page-header h2 {
            margin: 0;
            font-size: 2em;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .section-card {
            background: white;
            border-radius: 15px;
            padding: 25px;
            margin-bottom: 30px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            border-left: 5px solid var(--primary-color);
            font-size:larger;
        }

        .section-card h4 {
            color: var(--dark-color);
            font-weight: 600;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid var(--light-color);
            display: flex;
            align-items: center;
            gap: 10px;
        }

      
        .gridview-container {
            overflow-x: auto;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }

       
        .status-badge {
            padding: 5px 15px;
            border-radius: 50px;
            font-size: 0.9em;
            font-weight: 600;
            background-color: rgba(46, 204, 113, 0.5);
            color: var(--primary-color);
        }

        .update-message {
            padding: 10px 20px;
            border-radius: 50px;
            margin-left: 15px;
            font-weight: 500;
            display: inline-block;
        }

        .message-success {
            background-color: rgba(46, 204, 113, 0.1);
            color: var(--primary-color);
        }

        .message-error {
            background-color: rgba(231, 76, 60, 0.1);
            color: var(--accent-color);
        }

        @media (max-width: 768px) {
            .admin-container {
                padding: 15px;
                margin: 15px;
            }

            .page-header {
                padding: 15px;
            }

            .page-header h2 {
                font-size: 1.5em;
            }

            .section-card {
                padding: 15px;
            }
        }
        
        .sidebar {
            width: 330px;
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
    position: fixed; /* Change to fixed */
    bottom: 0;
    width: 100%;
    font-size: 14px;
    z-index: 1000; /* Ensure footer stays on top */
}

   .btn {
    background-color: var(--secondary-color); /* Green color */
    color: white; /* White text */
    border: none; /* No border */
    padding: 8px 16px; /* Padding */
    font-size: 14px; /* Font size */
    cursor: pointer; /* Pointer cursor */
    border-radius: 5px; /* Rounded corners */
    transition: background 0.3s ease; /* Smooth transition */
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="header">
    <span>Admin Panel</span>
</div>
     <div class="admin-panel">
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
                <div class="page-header">
                    <h2>
                        <i class="fas fa-paw"></i>
                        Donation Management
                    </h2>
                </div>


                <div class="section-card">
                    <h4>
                        <i class="fas fa-hand-holding-heart"></i>
                        Donation Records
                    </h4>
                    <div class="gridview-container">
                        <asp:GridView ID="gvDonations" runat="server" CssClass="table table-hover" 
    AutoGenerateColumns="False" AllowPaging="True" 
    OnPageIndexChanging="gvDonations_PageIndexChanging" PageSize="10">
    <Columns>
        <asp:BoundField DataField="Name" HeaderText="Donor Name" />
        <asp:BoundField DataField="Email" HeaderText="Email Address" />
        <asp:BoundField DataField="Phone" HeaderText="Contact Number" />
        <asp:BoundField DataField="Amount" HeaderText="Amount" 
            DataFormatString="₹{0:N2}" />
        <asp:BoundField DataField="DonationDate" HeaderText="Donation Date" 
            DataFormatString="{0:dd MMM yyyy HH:mm}" />
        <asp:TemplateField HeaderText="Status">
            <ItemTemplate>
                <span class="status-badge">Completed</span>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Action">
            <ItemTemplate>
                <asp:Button ID="btnSendEmail" runat="server" Text="Send Email" 
                    CommandArgument='<%# Eval("Email") %>' 
                    OnCommand="btnSendEmail_Command" CssClass="btn" />
                <asp:Label ID="lblDonorName" runat="server" Text='<%# Eval("Name") %>' Visible="false"></asp:Label>
                <asp:Label ID="lblAmount" runat="server" Text='<%# Eval("Amount") %>' Visible="false"></asp:Label>
                <asp:Label ID="lblDonationDate" runat="server" Text='<%# Eval("DonationDate", "{0:dd MMM yyyy HH:mm}") %>' Visible="false"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
                <asp:Label ID="lblUpdateMessage" runat="server"></asp:Label>
                    </div>
                </div>
            </div>
              <div class="footer">&copy; 2025 Faunaa | Admin Panel</div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>