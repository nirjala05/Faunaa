<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VeterinaryServices.aspx.cs" Inherits="Faunaa.VeterinaryServices" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Veterinary & NGO Services</title>
    <style>
       body {
            background: linear-gradient(to right, #d3d3d3, #ff9f43);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 90%;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #ff8c00;
            text-align: center;
        }
   .grid {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            font-family: 'Verdana', sans-serif;
            font-size: 16px;
        }

        .grid th, .grid td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
            font-size: large;
        }

        .grid th {
            background-color: #ff8c00;
            color: white;
            font-weight: bold;
            text-transform: uppercase;
        }

        .grid tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .grid tr:hover {
            background-color: #f1f1f1;
        }

        .btn {
            padding: 12px 24px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            outline: none;
        }

        .btn-info {
            background: #ff8c00;
            color: white;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .btn-info:hover {
            background: #ff8c00;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
            transform: translateY(-2px);
        }

        .btn-info:active {
            transform: translateY(0);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .navbar-container {
            display: flex;
            align-items: center;
            background: linear-gradient(45deg, #1a1a1a, #2c2c2c);
            padding: 15px 15px;
            max-width: 100%;
            box-sizing: border-box;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
            height: 180px;
        }

        .navbar-container img {
            width: 300px;
            height: auto;
            padding: 5px;
            transition: transform 0.3s ease;
        }

        @media (max-width: 768px) {
            .navbar-container img {
                width: 200px;
            }
        }

        .navbar {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            width: 100%;
        }

        .navbar a {
            display: block;
            color: #ffffff;
            text-align: center;
            padding: 15px 25px;
            text-decoration: none;
            font-size: 24px;
            margin: 0 5px;
            font-weight: 600;
            letter-spacing: 0.5px;
            border-radius: 25px;
            transition: all 0.3s ease;
            text-transform: uppercase;
            position: relative;
        }

        .navbar a::after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            background: #ff8c00;
            bottom: 8px;
            left: 50%;
            transform: translateX(-50%);
            transition: width 0.3s ease;
        }

        .navbar a:hover::after {
            width: 70%;
        }

        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-toggle {
            color: #ffffff;
            text-decoration: none;
            padding: 15px 25px;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
        }

        .dropdown-toggle:hover {
            color: #ff8c00;
        }

        .dropdown-menu {
            display: none;
            position: absolute;
            background-color: #333;
            min-width: 300px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            z-index: 1;
            border-radius: 8px;
        }

        .dropdown-menu a {
            color: #ffffff;
            padding: 12px 20px;
            text-decoration: none;
            display: block;
            font-size: 16px;
            transition: all 0.3s ease;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .dropdown-menu a:last-child {
            border-bottom: none;
        }

        .dropdown-menu a:hover {
            background: rgba(255, 140, 0, 0.1);
            padding-left: 25px;
            color: #ff8c00;
        }

        .dropdown:hover .dropdown-menu {
            display: block;
            transform: translateY(0);
            animation: fadeIn 0.3s ease;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .container {
            width: 90%;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .tabs {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }

        .tab-btn {
            padding: 12px 24px;
            border: none;
            border-radius: 6px 6px 0 0;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all 0.3s ease;
            background: #ff8c00;
            color: #333;
            flex: 1;
            max-width: 250px;
        }

        .tab-btn.active {
            background: #ff8c00;
            color: white;
        }

        .tab-btn:hover {
            background: #ff8c00;
            color: white;
        }

        h2 {
            color:#ff8c00;
            font-family: 'Arial', sans-serif;
            text-align: center;
            text-transform: uppercase;
            margin-bottom: 20px;
        }

       
    </style>

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDHBV4OKR4I2pj2IWH19uyCqd6kcVUVXWM" async defer></script>
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
    <form id="form1" runat="server">
        <div class="navbar-container">
          <asp:Image ID="Image2" runat="server" Width="200px"  ImageUrl="~/faunaa.jpg.png" />
            <div class="navbar">
                <a href="home.aspx">Home</a>
                 <a href="AboutUs.aspx">About Us</a>
<div class="dropdown">
    <a class="dropdown-toggle">Pages</a>
    <div class="dropdown-menu">
  <a href="BuyPets.aspx">Buy Pets</a>
       <a href="Donation.aspx">Donation</a>
       <a href="Adoption.aspx">Adoption</a>
       <a href="Food.aspx">Paw Mart</a>
       <a href="GroomingTraining.aspx">Grooming & Training</a>
       <a href="VeterinaryServices.aspx">VeterinaryServices</a>
        <a href="PetCareTips.aspx">Pet HealthTips</a>
       <a href="NewsAndArticles.aspx">News & Articles</a>
       <a href="AnimalDeathInfo.aspx">AnimalDeath Information</a>
       <a href="ApplicationStatus.aspx">ApplicationStatus</a>
       <a href="Logout.aspx">Logout</a> 
    </div>
    
</div>
<a href="Login.aspx">Login</a>

        </div>

        </div>

        <div class="container">
            <div class="tabs">
                <asp:Button ID="btnVetTab" runat="server" Text="Veterinary Services" OnClick="btnVetTab_Click" CssClass="tab-btn active" />
                <asp:Button ID="btnNGOTab" runat="server" Text="NGO Services" OnClick="btnNGOTab_Click" CssClass="tab-btn" />
            </div>

            <asp:Panel ID="pnlVetServices" runat="server">
                <h2>Veterinary Services</h2>
              <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Location" OnRowCommand="GridView1_RowCommand" CssClass="grid">
    <Columns>
        <asp:BoundField DataField="Name" HeaderText="Name" />
        <asp:BoundField DataField="Address" HeaderText="Address" />
        <asp:BoundField DataField="ContactTiming" HeaderText="Timings" />
        <asp:BoundField DataField="Contact" HeaderText="Contact" />
        <asp:BoundField DataField="Location" HeaderText="Location" />
         <asp:ImageField DataImageUrlField="Photo" HeaderText="Photo" 
                            ControlStyle-Width="200px" 
                            ControlStyle-Height="200px">
                            <ControlStyle Height="200px" Width="200px"></ControlStyle>
         </asp:ImageField>
          <asp:TemplateField HeaderText="Actions">
            <ItemTemplate>
                <asp:Button ID="btnDirections" runat="server" Text="Get Directions" CommandName="GetDirections" CommandArgument="<%# Container.DataItemIndex %>"  CssClass="btn btn-info" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
</asp:Panel>

            
            <asp:Panel ID="pnlNGOServices" runat="server" Visible="false">
                <h2>NGO Services</h2>
                <asp:GridView ID="GridViewNGO" runat="server" AutoGenerateColumns="False" CssClass="grid">
                    <Columns>
                        
                        <asp:BoundField DataField="Name" HeaderText="Name" />
                        <asp:BoundField DataField="Address" HeaderText="Address" />
                        <asp:BoundField DataField="WorkingHours" HeaderText="WorkingHours" />
                        <asp:BoundField DataField="Contact" HeaderText="Contact" />
                        <asp:BoundField DataField="Location" HeaderText="Location" />
                        <asp:ImageField DataImageUrlField="Photo" HeaderText="Photo" 
                            ControlStyle-Width="200px" 
                            ControlStyle-Height="200px">
                            <ControlStyle Height="200px" Width="200px"></ControlStyle>
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
            </asp:Panel>
        </div>
    </form>
</body>
</html> 