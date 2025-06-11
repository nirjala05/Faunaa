<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminFood.aspx.cs" Inherits="Faunaa.AdminFood" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Admin Page</title>
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

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

     

  .tab button {
    padding: 12px 25px;
    background-color: #081963;
    margin: 0 5px;
    border-radius: 8px 8px 0 0;
    cursor: pointer;
    color: white;
    font-weight: bold;
    transition: all 0.3s ease;
    box-shadow: 0 3px 6px rgba(0, 0, 0, 0.2);
        }

 .tab button:hover {
    background-color: #a7ffeb;
    color: #081963;
    transform: translateY(-2px);
        }

 .tab button.active {
     background-color: #00796b;
    color: white;
    transform: translateY(-3px);
        }

        .tabcontent {
            display: none;
            padding: 20px;
            border: 1px solid #ccc;
            border-top: none;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-group input, .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        .form-group button {
            padding: 10px 20px;
            background-color: var(--accent-color);
            color: var(--white);
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .form-group button:hover {
            background-color: var(--light-color);
            transform: scale(1.05);
        }

        .form-group button:active,
        .form-group button:focus {
            outline: none;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
        }

        #btnAddFood {
            background-color: var(--primary-color);
            color:White;
        }

        #btnAddMedicine {
            background-color: var(--primary-color);
            color:White;
        }

        #btnAddClothes {
            background-color: var(--primary-color);
            color:White;
        }

        #btnAddToys {
            background-color: var(--primary-color);
            color:White; 
        }

        .grid-view {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .grid-view th, .grid-view td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: left;
        }

        .grid-view th {
            background-color: var(--primary-color);
            color: white;
        }

        .grid-view tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        /* Style for Edit and Delete buttons */
        .btn-edit, .btn-delete {
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .btn-edit {
            background-color: #2196F3;
            color: white;
        }

        .btn-edit:hover {
            background-color: #1976D2;
            transform: scale(1.05);
        }

        .btn-delete {
            background-color: #F44336;
            color: white;
        }

        .btn-delete:hover {
            background-color: #D32F2F;
            transform: scale(1.05);
        }
        
 .view-button {
    display: inline-block;
    padding: 10px 30px;
    background: var(--accent-color);
    color: white;
    text-decoration: none;
    border-radius: 6px;
    font-weight: 500;
    transition: all 0.3s ease;
    margin-top:40px;
    margin-left:350px;
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
            <h1>Admin Page</h1>
            <div class="tab">
                <button type="button" class="tablinks" onclick="openTab(event, 'Food')">Food</button>
                <button type="button" class="tablinks" onclick="openTab(event, 'Medicine')">Medicine</button>
                <button type="button" class="tablinks" onclick="openTab(event, 'Clothes')">Clothes</button>
                <button type="button" class="tablinks" onclick="openTab(event, 'Toys')">Toys</button>
            </div>

            <!-- Food Tab -->
            <div id="Food" class="tabcontent">
                <h2>Manage Food</h2>
                <div class="form-group">
                    <label>Name:</label>
                    <asp:TextBox ID="txtFoodName" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Description:</label>
                    <asp:TextBox ID="txtFoodDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Price:</label>
                    <asp:TextBox ID="txtFoodPrice" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Image:</label>
                    <asp:FileUpload ID="fileFoodImage" runat="server" />
                </div>
                <div class="form-group">
                    <asp:Button ID="btnAddFood" runat="server" Text="Add Food" OnClick="btnAddFood_Click" />
                </div>
                <asp:GridView ID="gvFood" runat="server" CssClass="grid-view" AutoGenerateColumns="false"
                    DataKeyNames="Id" OnRowEditing="gvFood_RowEditing" OnRowUpdating="gvFood_RowUpdating" OnRowCancelingEdit="gvFood_RowCancelingEdit" OnRowDeleting="gvFood_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="true" />
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Description">
                            <ItemTemplate>
                                <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Price">
                            <ItemTemplate>
                                <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPrice" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:ImageField DataImageUrlField="Image" HeaderText="Image" DataImageUrlFormatString="~/uploads/{0}" ControlStyle-Width="100" ReadOnly="true" />
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:Button ID="btnEdit" runat="server" CommandName="Edit" Text="Edit" CssClass="btn-edit" />
                                <asp:Button ID="btnDelete" runat="server" CommandName="Delete" Text="Delete" CssClass="btn-delete" 
                                    OnClientClick="return confirm('Are you sure you want to delete this item?');" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="Update" CssClass="btn-edit" />
                                <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn-delete" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

            <!-- Medicine Tab -->
            <div id="Medicine" class="tabcontent">
                <h2>Manage Medicine</h2>
                <div class="form-group">
                    <label>Name:</label>
                    <asp:TextBox ID="txtMedicineName" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Description:</label>
                    <asp:TextBox ID="txtMedicineDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Price:</label>
                    <asp:TextBox ID="txtMedicinePrice" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Image:</label>
                    <asp:FileUpload ID="fileMedicineImage" runat="server" />
                </div>
                <div class="form-group">
                    <asp:Button ID="btnAddMedicine" runat="server" Text="Add Medicine" OnClick="btnAddMedicine_Click" />
                </div>
                <asp:GridView ID="gvMedicine" runat="server" CssClass="grid-view" AutoGenerateColumns="false"
                    DataKeyNames="Id" OnRowEditing="gvMedicine_RowEditing" OnRowUpdating="gvMedicine_RowUpdating" OnRowCancelingEdit="gvMedicine_RowCancelingEdit" OnRowDeleting="gvMedicine_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="true" />
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Description">
                            <ItemTemplate>
                                <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Price">
                            <ItemTemplate>
                                <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPrice" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:ImageField DataImageUrlField="Image" HeaderText="Image" DataImageUrlFormatString="~/uploads/{0}" ControlStyle-Width="100" ReadOnly="true" />
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:Button ID="btnEdit" runat="server" CommandName="Edit" Text="Edit" CssClass="btn-edit" />
                                <asp:Button ID="btnDelete" runat="server" CommandName="Delete" Text="Delete" CssClass="btn-delete" 
                                    OnClientClick="return confirm('Are you sure you want to delete this item?');" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="Update" CssClass="btn-edit" />
                                <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn-delete" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

            <!-- Clothes Tab -->
            <div id="Clothes" class="tabcontent">
                <h2>Manage Clothes</h2>
                <div class="form-group">
                    <label>Name:</label>
                    <asp:TextBox ID="txtClothesName" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Description:</label>
                    <asp:TextBox ID="txtClothesDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Price:</label>
                    <asp:TextBox ID="txtClothesPrice" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Image:</label>
                    <asp:FileUpload ID="fileClothesImage" runat="server" />
                </div>
                <div class="form-group">
                    <asp:Button ID="btnAddClothes" runat="server" Text="Add Clothes" OnClick="btnAddClothes_Click" />
                </div>
                <asp:GridView ID="gvClothes" runat="server" CssClass="grid-view" AutoGenerateColumns="false"
                    DataKeyNames="Id" OnRowEditing="gvClothes_RowEditing" OnRowUpdating="gvClothes_RowUpdating" OnRowCancelingEdit="gvClothes_RowCancelingEdit" OnRowDeleting="gvClothes_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="true" />
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Description">
                            <ItemTemplate>
                                <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Price">
                            <ItemTemplate>
                                <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPrice" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:ImageField DataImageUrlField="Image" HeaderText="Image" DataImageUrlFormatString="~/uploads/{0}" ControlStyle-Width="100" ReadOnly="true" />
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:Button ID="btnEdit" runat="server" CommandName="Edit" Text="Edit" CssClass="btn-edit" />
                                <asp:Button ID="btnDelete" runat="server" CommandName="Delete" Text="Delete" CssClass="btn-delete" 
                                    OnClientClick="return confirm('Are you sure you want to delete this item?');" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="Update" CssClass="btn-edit" />
                                <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn-delete" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

            <!-- Toys Tab -->
            <div id="Toys" class="tabcontent">
                <h2>Manage Toys</h2>
                <div class="form-group">
                    <label>Name:</label>
                    <asp:TextBox ID="txtToysName" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Description:</label>
                    <asp:TextBox ID="txtToysDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Price:</label>
                    <asp:TextBox ID="txtToysPrice" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Image:</label>
                    <asp:FileUpload ID="fileToysImage" runat="server" />
                </div>
                <div class="form-group">
                    <asp:Button ID="btnAddToys" runat="server" Text="Add Toys" OnClick="btnAddToys_Click" />
                </div>
                <asp:GridView ID="gvToys" runat="server" CssClass="grid-view" AutoGenerateColumns="false"
                    DataKeyNames="Id" OnRowEditing="gvToys_RowEditing" OnRowUpdating="gvToys_RowUpdating" OnRowCancelingEdit="gvToys_RowCancelingEdit" OnRowDeleting="gvToys_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="true" />
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Description">
                            <ItemTemplate>
                                <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Price">
                            <ItemTemplate>
                                <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPrice" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:ImageField DataImageUrlField="Image" HeaderText="Image" DataImageUrlFormatString="~/uploads/{0}" ControlStyle-Width="100" ReadOnly="true" />
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:Button ID="btnEdit" runat="server" CommandName="Edit" Text="Edit" CssClass="btn-edit" />
                                <asp:Button ID="btnDelete" runat="server" CommandName="Delete" Text="Delete" CssClass="btn-delete" 
                                    OnClientClick="return confirm('Are you sure you want to delete this item?');" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="Update" CssClass="btn-edit" />
                                <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn-delete" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
             <div class="view-button-container">
    <a href="Food.aspx" class="view-button">View</a>
</div>
        </div>

        <script>
            function openTab(evt, tabName) {
                var i, tabcontent, tablinks;
                tabcontent = document.getElementsByClassName("tabcontent");
                for (i = 0; i < tabcontent.length; i++) {
                    tabcontent[i].style.display = "none";
                }
                tablinks = document.getElementsByClassName("tablinks");
                for (i = 0; i < tablinks.length; i++) {
                    tablinks[i].className = tablinks[i].className.replace(" active", "");
                }
                document.getElementById(tabName).style.display = "block";
                evt.currentTarget.className += " active";
            }

            // Open the default tab
            document.getElementById("Food").style.display = "block";
            document.getElementsByClassName("tablinks")[0].className += " active";
        </script>
        <div class="footer">&copy; 2025 Faunaa | Admin Panel</div>
    </form>
</body>
</html>