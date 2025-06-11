<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AnimalDeathAdmin.aspx.cs" Inherits="Faunaa.AnimalDeathAdmin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Animal Death Admin</title>
    <style>
        :root {
            --primary-color: #2D3250;
            --secondary-color: #424769;
            --accent-color: #7077A1;
            --light-color: #F6B17A;
            --white: #ffffff;
            --gray-100: #f8f9fa;
            --gray-200: #e9ecef;
            --gray-300: #dee2e6;
            --danger: #dc3545;
            --shadow: 0 5px 15px rgba(0,0,0,0.08);
        }

        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            margin: 0;
            background-color: var(--gray-100);
            color: var(--secondary-color);
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

        .container h2 {
            color: var(--primary-color);
            text-align: center;
            font-size: 2em;
            margin-bottom: 30px;
            border-bottom: 3px solid var(--accent-color);
            padding-bottom: 15px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: var(--primary-color);
        }

        .form-control {
            width: 100%;
            padding: 12px;
            border: 2px solid var(--gray-300);
            border-radius: 8px;
            transition: all 0.3s ease;
            box-sizing: border-box;
        }

        .form-control:focus {
            outline: none;
            border-color: var(--accent-color);
            box-shadow: 0 0 0 3px rgba(112, 119, 161, 0.2);
        }

        .btn {
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s ease;
            margin-right: 10px;
        }

        .btn-primary {
            background-color: var(--primary-color);
            color: var(--white);
        }

        .btn-primary:hover {
            background-color: var(--secondary-color);
            transform: translateY(-1px);
        }

        .btn-danger {
            background-color: var(--white);
            color: var(--danger);
            border: 2px solid var(--danger);
        }

        .btn-danger:hover {
            background-color: var(--danger);
            color: var(--white);
            transform: translateY(-1px);
        }

        .grid-view {
            margin-top: 30px;
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            background-color: var(--white);
            border-radius: 8px;
            overflow: hidden;
            box-shadow: var(--shadow);
        }

        .grid-view th {
            background-color: var(--primary-color);
            color: var(--white);
            padding: 15px;
            text-align: left;
            font-weight: 600;
        }

        .grid-view td {
            padding: 15px;
            border-bottom: 1px solid var(--gray-200);
        }

        .grid-view tr:hover {
            background-color: var(--gray-100);
        }

        /* Edit Button Style */
        .grid-view .edit-btn {
            background-color: var(--accent-color);
            color: var(--white);
            padding: 8px 16px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-weight: 500;
        }

        .grid-view .edit-btn:hover {
            background-color: var(--secondary-color);
            transform: translateY(-1px);
        }

        /* Delete Button Style */
        .grid-view .delete-btn {
            background-color: var(--white);
            color: var(--danger);
            padding: 8px 16px;
            border: 1px solid var(--danger);
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-weight: 500;
        }

        .grid-view .delete-btn:hover {
            background-color: var(--danger);
            color: var(--white);
            transform: translateY(-1px);
        }

        .success-message {
            color: #2ea44f;
            background-color: #e6f4ea;
            padding: 12px;
            border-radius: 6px;
            margin-bottom: 20px;
            display: block;
        }

        .error-message {
            color: var(--danger);
            background-color: #ffeef0;
            padding: 12px;
            border-radius: 6px;
            margin-bottom: 20px;
            display: block;
        }

        @media (max-width: 768px) {
            .container {
                margin: 20px;
                padding: 20px;
            }
            
            .btn {
                width: 100%;
                margin-bottom: 10px;
            }

            .grid-view {
                display: block;
                overflow-x: auto;
                white-space: nowrap;
            }
        }
 .view-button-container {
    text-align: center;
    margin-top: 20px;
}

.view-button {
    padding: 14px 35px;
    background: var(--accent-color);
    color: white;
    text-decoration: none;
    border-radius: 8px;
    font-weight: bold;
    transition: all 0.3s ease;
    box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
}

.view-button:hover {
    background: var(--secondary-color);
    transform: scale(1.1);
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
            <h2>Manage Animal Death Information</h2>
            
            <asp:Label ID="lblMessage" runat="server" CssClass="success-message"></asp:Label>
            
            <div class="form-group">
                <label>Animal Type:</label>
                <asp:TextBox ID="txtAnimalType" runat="server" CssClass="form-control" required></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label>Guidelines:</label>
                <asp:TextBox ID="txtGuidelines" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control" required></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label>Address:</label>
                <asp:TextBox ID="txtaddress" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control" required></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label>Emergency Number:</label>
                <asp:TextBox ID="txtEmergencyNumber" runat="server" CssClass="form-control" required></asp:TextBox>
            </div>
            
            <div class="form-group">
                <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-primary" OnClick="btnAdd_Click" />
                <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-danger" OnClick="btnClear_Click" />
                <asp:HiddenField ID="hfDeathId" runat="server" />
            </div>
            
            <asp:GridView ID="gvAnimalDeaths" runat="server" AutoGenerateColumns="False" 
                CssClass="grid-view" OnRowCommand="gvAnimalDeaths_RowCommand" 
                DataKeyNames="DeathId" OnRowDeleting="gvAnimalDeaths_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="AnimalType" HeaderText="Animal Type" />
                    <asp:BoundField DataField="EmergencyNumber" HeaderText="Emergency Number" />
                    <asp:ButtonField CommandName="EditRow" Text="Edit" ButtonType="Button" ControlStyle-CssClass="edit-btn" HeaderText="Edit"/>
                    <asp:CommandField ShowDeleteButton="True" ButtonType="Button" ControlStyle-CssClass="delete-btn" HeaderText="Delete"/>
                </Columns>
            </asp:GridView>
            <div class="view-button-container">
                 <a href="AnimalDeathInfo.aspx" class="view-button">View</a>
              </div>
        </div>
        </div>
    </form>
       <div class="footer">&copy; 2025 Faunaa | Admin Panel</div>
</body>
</html>