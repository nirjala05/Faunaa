<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddGrommingTraining.aspx.cs" Inherits="Faunaa.AddGrommingTraining" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Add Grooming & Training</title>
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
        --shadow: 0 5px 15px rgba(0,0,0,0.08);
    }

    body {
        margin: 0;
        font-family: 'Inter', sans-serif;
        background: var(--gray-100);
        color: var(--primary-color);
        line-height: 1.6;
    }

    /* Layout Structure */
    .admin-panel {
        display: flex;
        min-height: 100vh;
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
       

    /* Form Elements */
    .form-group {
        margin-bottom: 1.8rem;
    }

    .form-control {
        width: 100%;
        padding: 0.8rem 1rem;
        font-size: 1rem;
        border: 2px solid var(--gray-200);
        border-radius: 8px;
        transition: all 0.3s ease;
        background: var(--white);
    }

    .form-control:focus {
        border-color: var(--accent-color);
        box-shadow: 0 0 0 4px rgba(112, 119, 161, 0.1);
        outline: none;
    }

    label {
        display: block;
        margin-bottom: 0.8rem;
        font-weight: 500;
        color: var(--primary-color);
        font-size: 1.1rem;
    }

    /* Enhanced Checkbox Design */
    #cblServices {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 1rem;
        margin: 1rem 0;
    }

    #cblServices label {
        position: relative;
        padding: 1rem 1rem 1rem 3rem;
        background: var(--gray-100);
        border: 2px solid var(--gray-200);
        border-radius: 10px;
        cursor: pointer;
        transition: all 0.3s ease;
    }

    #cblServices input[type="checkbox"] {
        position: absolute;
        opacity: 0;
    }

    #cblServices label::before {
        content: '';
        position: absolute;
        left: 1rem;
        top: 50%;
        transform: translateY(-50%);
        width: 1.5rem;
        height: 1.5rem;
        border: 2px solid var(--accent-color);
        border-radius: 6px;
        background: var(--white);
        transition: all 0.3s ease;
    }

    #cblServices input[type="checkbox"]:checked + label {
        background: rgba(112, 119, 161, 0.1);
        border-color: var(--accent-color);
    }

    #cblServices input[type="checkbox"]:checked + label::before {
        background: var(--accent-color);
        border-color: var(--accent-color);
    }

    /* Button Styling */
    .btn-primary {
        background: var(--accent-color);
        color: var(--white);
        border: none;
        padding: 1rem 2rem;
        font-size: 1rem;
        border-radius: 8px;
        cursor: pointer;
        transition: all 0.3s ease;
        font-weight: 500;
    }

    .btn-primary:hover {
        background: var(--secondary-color);
        transform: translateY(-2px);
        box-shadow: var(--shadow);
    }

    /* Table Styling */
    .table {
        width: 100%;
        border-collapse: separate;
        border-spacing: 0;
        margin: 2rem 0;
    }

    .table th {
        background: var(--gray-100);
        padding: 1rem;
        font-weight: 600;
        text-align: left;
        color: var(--primary-color);
    }

    .table td {
        padding: 1rem;
        border-bottom: 1px solid var(--gray-200);
    }

    .table tbody tr:hover {
        background: var(--gray-100);
    }

    /* File Upload Styling */
    #fullimage {
        border: 2px dashed var(--accent-color);
        padding: 2rem;
        border-radius: 10px;
        background: var(--gray-100);
        width: 100%;
        cursor: pointer;
        transition: all 0.3s ease;
    }

    #fullimage:hover {
        background: rgba(112, 119, 161, 0.1);
    }
    h2 {
    text-align: center;
    color: var(--primary-color);
    font-size: 2.2rem;
    font-weight: 600;
    margin-bottom: 2rem;
    padding-bottom: 15px;
    position: relative;
}


/* Optional animation for the underline */
@keyframes slideIn {
    from {
        width: 0;
        opacity: 0;
    }
    to {
        width: 150px;
        opacity: 1;
    }
}

h2::after {
    animation: slideIn 0.5s ease forwards;
}

    /* Center View Button Container */
.view-button-container {
    text-align: center;
    margin: 2rem 0;
}

/* View Button Styling */
.view-button {
    display: inline-block;
    padding: 10px 30px;
    background: var(--accent-color);
    color: white;
    text-decoration: none;
    border-radius: 6px;
    font-weight: 500;
    transition: all 0.3s ease;
}

.view-button:hover {
    background: var(--secondary-color);
    color: white;
    text-decoration: none;
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
       <li><a href="login.aspx">&#10060; Logout</a></li>
        
    </ul>
</div>


        <div class="container mt-4">
            <h2>Add Grooming & Training Center Details</h2>
            <div class="form-group mb-3">
                <asp:Label ID="lblName" runat="server" Text="Center Name:"></asp:Label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvName" runat="server" 
                    ControlToValidate="txtName" ErrorMessage="Name is required!" 
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
            </div>

            <div class="form-group mb-3">
                <asp:Label ID="lblAddress" runat="server" Text="Address:"></asp:Label>
                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvAddress" runat="server" 
                    ControlToValidate="txtAddress" ErrorMessage="Address is required!" 
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
            </div>

            <div class="form-group mb-3">
                <asp:Label ID="lblContact" runat="server" Text="Contact Number:"></asp:Label>
                <asp:TextBox ID="txtContact" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RegularExpressionValidator ID="revContact" runat="server" 
                    ControlToValidate="txtContact" ErrorMessage="Invalid Phone Number!" 
                    ForeColor="Red" ValidationExpression="^\d{10}$">
                </asp:RegularExpressionValidator>
            </div>

            <div class="form-group mb-3">
                <asp:Label ID="lblServices" runat="server" Text="Services Offered:"></asp:Label>
                <asp:CheckBoxList ID="cblServices" runat="server" CssClass="list-unstyled">
                    <asp:ListItem Text="Dog Grooming" Value="DogGrooming" />
                    <asp:ListItem Text="Cat Grooming" Value="CatGrooming" />
                    <asp:ListItem Text="Basic Training" Value="BasicTraining" />
                    <asp:ListItem Text="Advanced Training" Value="AdvancedTraining" />
                    <asp:ListItem Text="Behavior Training" Value="BehaviorTraining" />
                </asp:CheckBoxList>
            </div>

            <div class="form-group mb-3">
                <asp:Label ID="lblImage" runat="server" Text="Center Image:"></asp:Label>
                <asp:FileUpload id="fullimage" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group mb-3">
                <asp:Label ID="lblDescription" runat="server" Text="Description:"></asp:Label>
                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" 
                    TextMode="MultiLine" Rows="4">
                </asp:TextBox>
            </div>

            <div class="form-group mb-3">
                <asp:Button ID="btnSubmit" runat="server" Text="Add Center" 
                    CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
                <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
            </div>

            <hr />

            <h3>Preview of Added Centers</h3>
            <div class="table-responsive">
                <asp:GridView ID="gvCenters" runat="server" AutoGenerateColumns="False" 
                    CssClass="table table-striped" OnRowCommand="gvCenters_RowCommand"
                    DataKeyNames="CenterId">
                    <Columns>
                        <asp:BoundField DataField="CenterName" HeaderText="Name" />
                        <asp:BoundField DataField="Address" HeaderText="Address" />
                        <asp:BoundField DataField="Contact" HeaderText="Contact" />
                        <asp:ImageField DataImageUrlField="ImagePath" HeaderText="Image" 
                            ControlStyle-Width="100px" />
                        <asp:ButtonField ButtonType="Button" CommandName="DeleteCenter" 
                            Text="Delete" ControlStyle-CssClass="btn btn-primary btn-sm" />
                        <asp:ButtonField ButtonType="Button" CommandName="EditCenter" 
                            Text="Edit" ControlStyle-CssClass="btn btn-primary btn-sm" />
                    </Columns>
                </asp:GridView>
                <br />
            </div>

             <div class="view-button-container">
                 <a href="GroomingTraining.aspx" class="view-button">View</a>
              </div>
        </div>
        
           </div>
           <div class="footer">&copy; 2025 Faunaa | Admin Panel</div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>