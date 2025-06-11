<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageBuyPets.aspx.cs" Inherits="Faunaa.ManageBuyPets" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Admin - Manage Pets</title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

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
        margin: 0;
        font-family: 'Inter', sans-serif;
        background: var(--gray-100);
        color: var(--primary-color);
        line-height: 1.6;
    }


      .container {
        max-width: 1150px;
        margin-left: 650px; /* Space for sidebar */
        margin-right: 20px;
        margin-top: 80px; /* Space for header */
        margin-bottom: 60px; /* Space for footer */
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

h2 {
    color: #00796b; /* Teal color for headings */
    text-align: center;
    margin-bottom: 20px;
}

.form-group {
    margin-bottom: 20px;
}

.form-control {
    width: 100%;
    padding: 12px;
    margin: 10px 0;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.btn-danger {
        background: #ff6b6b;
        border: none;
        padding: 8px 20px;
        border-radius: 50px;
        transition: all 0.3s ease;
    }

    .btn-danger:hover {
        background: #ff5252;
        transform: translateY(-2px);
    }

.btn {
    padding: 12px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s; /* Smooth transition */
}

.btn-primary {
    background-color: var(--secondary-color);
    color: white;
}

.btn-primary:hover {
    background-color: var(--secondary-color);
}

.grid {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

.grid th, .grid td {
    border: 1px solid #ddd;
    padding: 10px;
    text-align: left;
}

.grid th {
    background-color: var(--secondary-color);
    color: white;
}

.message {
    margin-top: 10px;
    color: #d32f2f; /* Red color for error messages */
    text-align: center;
    font-weight: bold;
}

/* Responsive Design */
@media (max-width: 768px) {
    .container {
        width: 95%; /* Full width on smaller screens */
    }
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
            <h2>Manage Pets</h2>
            <div class="form-group">
                <asp:TextBox ID="txtPetName" runat="server" placeholder="Pet Name" CssClass="form-control" required></asp:TextBox>
                <asp:TextBox ID="txtBreed" runat="server" placeholder="Breed" CssClass="form-control" required></asp:TextBox>
                <asp:TextBox ID="txtAge" runat="server" placeholder="Age" CssClass="form-control" required></asp:TextBox>
                <asp:TextBox ID="txtPrice" runat="server" placeholder="Price" CssClass="form-control" required></asp:TextBox>
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="4" placeholder="Description" CssClass="form-control" required></asp:TextBox>
                <asp:FileUpload ID="fileUpload" runat="server" CssClass="form-control" />
                <asp:Button ID="btnAddPet" runat="server" Text="Add Pet" OnClick="btnAddPet_Click" CssClass="btn btn-primary" />
                <asp:Label ID="lblMessage" runat="server" CssClass="message" />
            </div>

            <h3>Available Pets</h3>
            <asp:GridView ID="GridViewPets" runat="server" AutoGenerateColumns="False" CssClass="grid">
                <Columns>
                   
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="Breed" HeaderText="Breed" />
                    <asp:BoundField DataField="Age" HeaderText="Age" />
                    <asp:BoundField DataField="Price" HeaderText="Price" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />
                    <asp:ImageField DataImageUrlField="Image" HeaderText="Image" 
                        ControlStyle-Width="100px" 
                        ControlStyle-Height="100px">
                        <ControlStyle Height="100px" Width="100px"></ControlStyle>
                    </asp:ImageField>
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandArgument='<%# Eval("Id") %>' OnCommand="btnDelete_Command" CssClass="btn btn-danger" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <div class="view-button-container">
                 <a href="BuyPets.aspx" class="view-button">View</a>
              </div>
        </div>

        <div class="footer">&copy; 2025 Faunaa | Admin Panel</div>
    </form>
</body>
</html>
