<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddPets.aspx.cs" Inherits="Faunaa.AddPets" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Add Pets for Adoption</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<style>
       :root {
         --primary-color: #2D3250;
        --secondary-color: #424769;
        --accent-color: #7077A1;
        --light-color: #F6B17A;
        --white: #ffffff;
        --gray-100: #f8f9fa;
        --gray-200: #e9ecef;
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
            margin: 0;
        }

        /* Admin Panel Layout */
        .admin-panel {
            display: grid;
            grid-template-columns: 250px 1fr;
            height: 100vh;
        }

        /* Sidebar Styling */
        .sidebar {
            width: 350px;
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

h2
{
    text-align:center;
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
       

    h2 {
        color: var(--primary-color);
        font-size: 2rem;
        margin-bottom: 2rem;
        text-align: center;
        padding-bottom: 10px;
        border-bottom: 3px solid var(--accent-color);
    }

    .form-group {
        background: white;
        padding: 1.2rem;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        margin-bottom: 1.5rem;
    }

    .form-control {
        border: 2px solid #e1e5ee;
        border-radius: 6px;
        padding: 8px;
    }

    .form-control:focus {
        border-color: var(--accent-color);
        box-shadow: 0 0 0 3px rgba(112, 119, 161, 0.1);
    }

    /* Button Styling */
    .btn-primary {
        background: var(--accent-color);
        border: none;
        padding: 10px 25px;
        border-radius: 6px;
        font-weight: 700;
    }

    .btn-primary:hover {
        background: var(--secondary-color);
    }

    /* Table Styling */
    .table-responsive {
        background: white;
        padding: 1rem;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
    }

    .table th {
        
        color:white;
        padding: 12px;
    }

    .table td {
        padding: 12px;
        vertical-align: middle;
    }

    .table tr:hover {
        background: var(--gray-100);
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

    /* File Upload */
    .form-control[type="file"] {
        border: 2px dashed var(--accent-color);
        padding: 1.5rem;
        background: var(--gray-100);
    }

    /* Success Message */
    #lblMessage {
        display: inline-block;
        padding: 8px 15px;
        border-radius: 4px;
        background: #d4edda;
        color: #155724;
        margin-left: 10px;
    }

    /* View Link */
    a[href="Adoption.aspx"] {
        display: inline-block;
        padding: 8px 20px;
        background: var(--light-color);
        color: white;
        text-decoration: none;
        border-radius: 4px;
        margin-top: 1rem;
    }

    /* Center View Button Container */
.
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

    /* Validation Messages */
    .validators {
        color: #dc3545;
        font-size: 0.9rem;
        margin-top: 5px;
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
            position: relative;
            bottom: 0;
            width: 100%;
            font-size: 14px;
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


        <div class="container mt-4">
            <h2>Add Pet for Adoption</h2>
            
            <div class="form-group mb-3">
                <asp:Label ID="lblPetName" runat="server" Text="Pet Name:"></asp:Label>
                <asp:TextBox ID="txtPetName" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPetName" runat="server" 
                    ControlToValidate="txtPetName" ErrorMessage="Pet name is required!" 
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
            </div>

            <div class="form-group mb-3">
                <asp:Label ID="lblType" runat="server" Text="Pet Type:"></asp:Label>
                <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Dog" Value="Dog" />
                    <asp:ListItem Text="Cat" Value="Cat" />
                </asp:DropDownList>
            </div>

            <div class="form-group mb-3">
                <asp:Label ID="lblBreed" runat="server" Text="Breed:"></asp:Label>
                <asp:TextBox ID="txtBreed" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group mb-3">
                <asp:Label ID="lblAge" runat="server" Text="Age:"></asp:Label>
                <asp:TextBox ID="txtAge" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
            </div>

            <div class="form-group mb-3">
                <asp:Label ID="lblGender" runat="server" Text="Gender:"></asp:Label>
                <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Male" Value="Male" />
                    <asp:ListItem Text="Female" Value="Female" />
                </asp:DropDownList>
            </div>

            <div class="form-group mb-3">
                <asp:Label ID="lblImage" runat="server" Text="Pet Image:"></asp:Label>
                <asp:FileUpload ID="fuImage" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvImage" runat="server" 
                    ControlToValidate="fuImage" ErrorMessage="Image is required!" 
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
            </div>

            <div class="form-group mb-3">
                <asp:Label ID="lblDescription" runat="server" Text="Description:"></asp:Label>
                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" 
                    TextMode="MultiLine" Rows="4">
                </asp:TextBox>
            </div>

            <div class="form-group mb-3">
                <asp:Button ID="btnSubmit" runat="server" Text="Add Pet" 
                    CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
                <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
            </div>

            <hr />

            <h3>Available Pets</h3>
            <div class="table-responsive">
                <asp:GridView ID="gvPets" runat="server" AutoGenerateColumns="False" 
                    CssClass="table table-striped" OnRowCommand="gvPets_RowCommand"
                    DataKeyNames="PetId">
                    <Columns>
                        <asp:BoundField DataField="PetName" HeaderText="Name" />
                        <asp:BoundField DataField="Type" HeaderText="Type" />
                        <asp:BoundField DataField="Breed" HeaderText="Breed" />
                        <asp:BoundField DataField="Age" HeaderText="Age" />
                        <asp:BoundField DataField="Gender" HeaderText="Gender" />
                        <asp:ImageField DataImageUrlField="ImagePath" HeaderText="Image" 
                            ControlStyle-Width="100px" />
                        <asp:BoundField DataField="Status" HeaderText="Status" />
                        <asp:ButtonField ButtonType="Button" CommandName="DeletePet" 
                            Text="Delete" ControlStyle-CssClass="btn btn-danger btn-sm" />
                    </Columns>
                </asp:GridView>
            </div>

            <div class="view-button-container">
    <a href="Adoption.aspx" class="view-button">View</a>
</div>
        </div>
        <div class="footer">&copy; 2025 Faunaa | Admin Panel</div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
