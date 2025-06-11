<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manageuser.aspx.cs" Inherits="Faunaa.manageuser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Manage Users</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }
      
  .container {
        max-width: 1900px;
        margin-left: 350px; /* Space for sidebar */
        margin-right: 20px;
        margin-top: 80px; /* Space for header */
        margin-bottom: 60px; /* Space for footer */
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
       
        
        .grid-container {
            overflow-x: auto;
            
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
            text-align: center;
            font-size:x-large;
        }
        .grid td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            text-align: center;
            font-size:larger;
        }
        .grid tr:hover {
            background-color: #f5f5f5;
        }
  .btn {
    padding: 8px 14px;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    margin: 0 4px;
    font-size: 24px;
    font-weight: bold;
    transition: background 0.3s, transform 0.2s;
}

.btn:hover {
    opacity: 0.9;
    transform: scale(1.05);
}

.btn:active {
    transform: scale(0.98);
}

.btn-approve {
    background-color: #28a745;
    color: white;
}

.btn-approve:hover {
    background-color: #218838;
}

.btn-reject {
    background-color: #dc3545;
    color: white;
}

.btn-reject:hover {
    background-color: #c82333;
}

.btn-delete {
    background-color: #6c757d;
    color: white;
}

.btn-delete:hover {
    background-color: #5a6268;
}

        .status-pending {
            color: #ffc107;
            font-weight: bold;
        }
        .status-approved {
            color: #28a745;
            font-weight: bold;
        }
        .status-rejected {
            color: #dc3545;
            font-weight: bold;
        }
        .filter-section {
            margin-bottom: 20px;
        }
        .filter-dropdown {
            padding: 8px;
            margin-right: 10px;
            border-radius: 4px;
            border: 1px solid #ddd;
        }
        .message {
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 4px;
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

        /* Update the admin-panel class */
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
        <div class="container">
            <div class="header">
                <h2>Manage Users</h2>
                <div class="filter-section">
                    <asp:DropDownList ID="ddlStatus" runat="server" CssClass="filter-dropdown" 
                        AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                        <asp:ListItem Text="All Users" Value="All" />
                        <asp:ListItem Text="Approved Users" Value="Approved" />
                        <asp:ListItem Text="Rejected Users" Value="Rejected" />
                    </asp:DropDownList>
                </div>
            </div>

            <asp:Label ID="lblMessage" runat="server" CssClass="message" Visible="false"></asp:Label>

            <div class="grid-container">
                <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" 
                    CssClass="grid" DataKeyNames="uid" OnRowCommand="gvUsers_RowCommand"
                    EmptyDataText="No users found.">
                    <Columns>
                        <asp:BoundField DataField="name" HeaderText="Name" />
                        <asp:BoundField DataField="emailid" HeaderText="Email" />
                        <asp:BoundField DataField="phoneno" HeaderText="Phone" />
                        <asp:BoundField DataField="registration_date" HeaderText="Registration Date" 
                            DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("status") %>'
                                    CssClass='<%# "status-" + Eval("status").ToString().ToLower() %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnApprove" runat="server" 
                                    CommandName="ApproveUser" CommandArgument='<%# Eval("uid") %>'
                                    CssClass="btn btn-approve" Text="Approve"
                                    Visible='<%# Eval("status").ToString() != "Approved" %>'></asp:LinkButton>
                                <asp:LinkButton ID="btnReject" runat="server" 
                                    CommandName="RejectUser" CommandArgument='<%# Eval("uid") %>'
                                    CssClass="btn btn-reject" Text="Reject"
                                    Visible='<%# Eval("status").ToString() != "Rejected" %>'></asp:LinkButton>
                                <asp:LinkButton ID="btnDelete" runat="server" 
                                    CommandName="DeleteUser" CommandArgument='<%# Eval("uid") %>'
                                    CssClass="btn btn-delete" Text="Delete"
                                    OnClientClick="return confirm('Are you sure you want to delete this user?');"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
     <div class="footer">&copy; 2025 Faunaa | Admin Panel</div>
</body>
</html>