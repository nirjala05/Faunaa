<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageVeterinary.aspx.cs" Inherits="Faunaa.ManageVeterinary" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Admin Panel - Animal Welfare Services</title>
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
        /*background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)),
                    url('images/4.jpg');*/
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
            max-width: 1000px; /* Decreased from 1200px */
            margin: 0 auto;
            padding: 15px;
            margin-left:450px;
            
        }

        .main-title {
            color: var(--primary-color);
            text-align: center;
            font-size: 2em; /* Decreased from 3em */
            margin-bottom: 25px;
            text-transform: uppercase;
            letter-spacing: 2px;
            text-shadow: 2px 2px 4px rgba(26, 35, 126, 0.2);
        }

        .tabs-container {
            background: var(--white);
            padding: 15px;
            border-radius: 10px;
            box-shadow: var(--shadow);
            width:1200px;
        }

        .tab-buttons {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
            justify-content: center;
            padding: 8px;
        }

        .tab-button {
            background:var(--primary-color); 
            color: var(--white);
            padding: 12px 25px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
            min-width: 180px;
        }

        .tab-button:hover {
            background: var(--primary-color);
            transform: translateY(-2px);
            box-shadow: 0 3px 10px rgba(26, 35, 126, 0.3);
        }

        .tab-button.active {
            background: var(--primary-color);
            box-shadow: 0 3px 10px rgba(26, 35, 126, 0.3);
        }

        .tab-content {
            display: none;
            animation: fadeIn 0.4s ease;
        }

        .tab-content.active {
            display: block;
        }

        .form-section {
            background: var(--white);
            padding: 20px;
            border-radius: 10px;
            box-shadow: var(--shadow);
            margin-bottom: 20px;
        }

        .form-section h2 {
            font-size: 1.5em;
            color: var(--primary-color);
            margin-bottom: 20px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .form-group {
            display: grid;
            gap: 10px;
            margin-bottom: 15px;
        }

        .form-control {
            width: 95%;
            padding: 10px 15px;
            border: 2px solid ;
            border-radius: 6px;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 2px rgba(26, 35, 126, 0.1);
            outline: none;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin: 5px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .btn-primary {
            background: var(--primary-color);
            color: var(--white);
        }

        .btn-primary:hover {
            background: var(--primary-color);
            transform: translateY(-2px);
        }

        .btn-info {
            background: var(--primary-color);
            color: var(--white);
        }

        .btn-info:hover {
            background: var(--primary-color);
             transform: translateY(-2px);
        }

        .grid {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 6px;
            margin-top: 15px;
        }

        .grid th {
            background: var(--primary-color);
            color: var(--white);
            padding: 12px;
            text-transform: uppercase;
            font-weight: 600;
            font-size: 14px;
        }

        .grid td {
            background: var(--white);
            padding: 10px;
            font-size: 13px;
            transition: all 0.3s ease;
        }

        .grid tr:hover td {
            background: #e8eaf6;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(5px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .data-section {
            margin-top: 20px;
        }

        .data-section h2 {
            font-size: 1.5em;
            color: var(--primary-color);
            margin-bottom: 15px;
        }
        
        h1
        {
            text-align:center;
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

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDHBV4OKR4I2pj2IWH19uyCqd6kcVUVXWM&libraries=places" async defer></script>
    <script>

        function switchTab(tabName) {
            var contents = document.getElementsByClassName('tab-content');
            for (var i = 0; i < contents.length; i++) {
                contents[i].style.display = 'none';
            }

            var buttons = document.getElementsByClassName('tab-button');
            for (var i = 0; i < buttons.length; i++) {
                buttons[i].classList.remove('active');
            }

            document.getElementById(tabName + 'Tab').style.display = 'block';
            document.getElementById(tabName + 'Button').classList.add('active');

            // Refresh maps after tab switch
            setTimeout(function () {
                if (tabName === 'veterinary' && map) {
                    google.maps.event.trigger(map, 'resize');
                    map.setCenter(marker.getPosition());
                } else if (tabName === 'ngo' && ngoMap) {
                    google.maps.event.trigger(ngoMap, 'resize');
                    ngoMap.setCenter(ngoMarker.getPosition());
                }
            }, 100);
        }
    </script>

    <script>
        function getDirections(address) {
            if (!address) {
                alert("Address is not defined.");
                return;
            }
            console.log("Address captured: " + address);
            var url = "https://www.google.com/maps/dir/?api=1&destination=" + encodeURIComponent(address);
            window.open(url, '_blank');
        }
    </script>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
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
            <h1 class="main-title">Animal Welfare Services Management</h1>

            <div class="tabs-container">
                <div class="tab-buttons">
                    <button type="button" id="veterinaryButton" class="tab-button active" onclick="switchTab('veterinary'); return false;">
                        Veterinary Services
                    </button>
                    <button type="button" id="ngoButton" class="tab-button" onclick="switchTab('ngo'); return false;">
                        NGO Services
                    </button>
                </div>

                <!-- Veterinary Services Tab -->
                <div id="veterinaryTab" class="tab-content active">
                    <div class="form-section">
                        <h2>Add Veterinary Service</h2>
                        <div class="form-group">
                            <asp:TextBox ID="txtName" runat="server" placeholder="Name" CssClass="form-control"></asp:TextBox>
                            <asp:TextBox ID="txtAddress" runat="server" placeholder="Address" CssClass="form-control"></asp:TextBox>
                            <asp:TextBox ID="txtContactTiming" runat="server" placeholder="Contact Timing" CssClass="form-control"></asp:TextBox>
                            <asp:TextBox ID="txtContact" runat="server" placeholder="Contact Number" CssClass="form-control"></asp:TextBox>
                            <asp:TextBox ID="txtLocation" runat="server" placeholder="Latitude,Longitude" CssClass="form-control" ></asp:TextBox>
                            <asp:FileUpload ID="fileUpload" runat="server" CssClass="form-control" />
                        </div>
                        <div class="button-group">
                            <asp:Button ID="btnAdd" runat="server" Text="Add Service" OnClick="btnAdd_Click" CssClass="btn btn-primary" />
                        </div>
                       
                    </div>

                    <div class="data-section">
                        <h2>Manage Veterinary Services</h2>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="grid">
                            <Columns>
                                <asp:BoundField DataField="Name" HeaderText="Name" />
                                <asp:BoundField DataField="Address" HeaderText="Address" />
                                <asp:BoundField DataField="ContactTiming" HeaderText="Contact Timing" />
                                <asp:BoundField DataField="Contact" HeaderText="Contact" />
                                <asp:BoundField DataField="Location" HeaderText="Location" />
                                <asp:ImageField DataImageUrlField="Photo" HeaderText="Photo" 
                                    ControlStyle-Width="100px" 
                                    ControlStyle-Height="100px">
                                    <ControlStyle Height="100px" Width="100px"></ControlStyle>
                                </asp:ImageField>
                                <asp:TemplateField HeaderText="Actions">
                                   <ItemTemplate>
                                <asp:Button ID="btnDirections" runat="server" Text="Get Directions" 
                                    OnClientClick='<%# "getDirections(\"" + Eval("Location") + "\"); return false;" %>' 
                                    CssClass="btn btn-info" />
                            </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>

                <!-- NGO Services Tab -->
                <div id="ngoTab" class="tab-content">
                    <div class="form-section">
                        <h2>Add NGO Service</h2>
                        <div class="form-group">
                            <asp:TextBox ID="txtNGOName" runat="server" placeholder="NGO Name" CssClass="form-control"></asp:TextBox>
                            <asp:TextBox ID="txtNGOAddress" runat="server" placeholder="Address" CssClass="form-control"></asp:TextBox>
                            <asp:TextBox ID="txtNGOTiming" runat="server" placeholder="Working Hours" CssClass="form-control"></asp:TextBox>
                            <asp:TextBox ID="txtNGOContact" runat="server" placeholder="Contact Number" CssClass="form-control"></asp:TextBox>
                            <asp:TextBox ID="txtNGOLocation" runat="server" placeholder="Latitude,Longitude" CssClass="form-control"></asp:TextBox>
                            <asp:FileUpload ID="ngoFileUpload" runat="server" CssClass="form-control" />
                        </div>
                        <div class="button-group">
                            <asp:Button ID="btnAddNGO" runat="server" Text="Add NGO" OnClick="btnAddNGO_Click" CssClass="btn btn-primary" />
                        </div>
                       
                    </div>

                    <div class="data-section">
                        <h2>Manage NGO Services</h2>
                        <asp:GridView ID="GridViewNGO" runat="server" AutoGenerateColumns="False" CssClass="grid">
                            <Columns>
                                <asp:BoundField DataField="Name" HeaderText="Name" />
                                <asp:BoundField DataField="Address" HeaderText="Address" />
                                <asp:BoundField DataField="WorkingHours" HeaderText="Working Hours" />
                                <asp:BoundField DataField="Contact" HeaderText="Contact" />
                                <asp:BoundField DataField="Location" HeaderText="Location" />
                                <asp:ImageField DataImageUrlField="Photo" HeaderText="Photo" 
                                    ControlStyle-Width="100px" 
                                    ControlStyle-Height="100px">
                                    <ControlStyle Height="100px" Width="100px"></ControlStyle>
                                </asp:ImageField>
                                <asp:TemplateField HeaderText="Actions">
                                   <ItemTemplate>
                                <asp:Button ID="btnDirections" runat="server" Text="Get Directions" 
                                    OnClientClick='<%# "getDirections(\"" + Eval("Location") + "\"); return false;" %>' 
                                    CssClass="btn btn-info" />
                            </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
         <div class="view-button-container">
    <a href="VeterinaryServices.aspx" class="view-button">View</a>
</div>
    </form>
</body>
</html> 