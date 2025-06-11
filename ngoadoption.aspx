<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ngoadoption.aspx.cs" Inherits="Faunaa.ngoadoption" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<style>
 :root {
        --primary-color: #4682B4;
        --secondary-color: #2980b9; /* Darker blue for hover/active */
        --accent-color: #2ecc71; /* Green for growth and health */
        --light-color: #f39c12; /* Orange for warmth and energy */
        --white: #ffffff;
        --gray-100: #f8f9fa;
        --gray-200: #e9ecef;
        --shadow: 0 5px 15px rgba(0,0,0,0.1);
        --animal-pattern: url('data:image/svg+xml,%3Csvg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20"%3E%3Cpath fill="%23e0e0e0" d="M0 0h20v20H0z"/%3E%3Ccircle cx="5" cy="5" r="2" fill="%23d0d0d0" /%3E%3Ccircle cx="15" cy="15" r="2" fill="%23d0d0d0" /%3E%3C/svg%3E'); /* Subtle animal pattern */
    }

    body {
        margin: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; /* Modern font */
        background: var(--gray-100);
        color: var(--primary-color);
        line-height: 1.6;
    }

    .admin-panel {
        display: flex;
        min-height: 100vh;
        flex-direction: column;
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
        background: #00008B;
        transform: scaleY(0);
        transition: transform 0.2s ease;
    }

    .sidebar ul li a:hover::before {
        transform: scaleY(1);
    }

    .container {
            max-width: 1000px;
            margin: 80px auto;
            padding: 20px;
            background: var(--white);
            border-radius: 10px;
            box-shadow: var(--shadow);
        }

        .form-group {
            margin-bottom: 20px;
            font-size:larger;
        }

        .form-control {
            border: 2px solid var(--gray-200);
            border-radius: 6px;
            padding: 10px;
            width: 100%;
        }

        .form-control:focus {
            border-color: var(--accent-color);
            box-shadow: 0 0 5px rgba(243, 156, 18, 0.5);
        }

        .btn-primary {
            background: var(--primary-color);
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            color: white;
            font-weight: bold;
            transition: 0.3s;
        }

        .btn-primary:hover {
            background: #00008B;
            transform: scale(1.05);
        }

        .btn-danger {
            background: #e74c3c;
            border: none;
            padding: 8px 16px;
            border-radius: 6px;
            color: white;
            transition: 0.3s;
        }

        .btn-danger:hover {
            background: #c0392b;
            transform: scale(1.05);
        }

        .table th {
            background: var(--primary-color);
            color: white;
            padding: 12px;
            width:1000px;
        }

        .table td {
            padding: 12px;
            border-bottom: 1px solid var(--gray-200);
        }
    
</style>
</head>
<body>
    <form id="form1" runat="server">
     <div class="container mt-4">
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
</div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
