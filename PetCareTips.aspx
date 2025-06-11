<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PetCareTips.aspx.cs" Inherits="Faunaa.PetCareTips" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Pet Care Tips</title>
    <style>
        body {
            background: linear-gradient(to right, #d3d3d3, #ff9f43);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            position: relative;
            overflow-x: hidden;
            background-size: 400% 400%;
            animation: gradientAnimation 5s ease infinite;
            padding: 0; /* Reset padding */
            margin: 0; /* Reset margin */
        }

        .container {
            max-width: 700px;
            margin: 200px auto;
            background: white;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        }

        h2 {
            text-align: center;
            color: #FF6B35;
        }

        .input-group {
            margin-bottom: 20px;
        }

        .input-group label {
            display: block;
            margin-bottom: 6px;
            color: #555;
            font-weight: bold;
        }

        .input-group input, .input-group select {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 16px;
            transition: 0.3s ease;
        }

        input::placeholder {
            color: #aaa;
        }

        input:focus, select:focus {
            border-color: #ff9f43;
            outline: none;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        .btn {
            background: linear-gradient(to right, #c59169, #ff9f43);
            color: white;
            border: none;
            padding: 12px;
            border-radius: 6px;
            cursor: pointer;
            width: 100%;
            font-size: 18px;
            font-weight: bold;
            transition: 0.3s;
        }

        .btn:hover {
            background: linear-gradient(to left, #c59169, #ff9f43);
        }

        .results {
            margin-top: 25px;
            padding: 15px;
            background: #e7f3fe;
            border-left: 6px solid #2196F3;
            border-radius: 6px;
        }

        .results-text {
            color: #333;
            font-size: 16px;
        }

        .navbar-container {
            display: flex;
            align-items: center;
            background: linear-gradient(45deg, #1a1a1a, #2c2c2c);
            padding: 15px 15px;
            max-width: 100%;
            box-sizing: border-box;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            position: fixed; /* Changed to fixed */
            top: 0;
            left: 0; /* Ensure it spans the whole width */
            width: 100%; /* Ensure it spans the whole width */
            z-index: 1000;
            height: 180px; /* Increased height to accommodate larger logo */
        }

        /* Logo styling */
        .navbar-container img {
            width: 300px; /* Increased width */
            height: auto; /* Maintain aspect ratio */
            padding: 5px;
            transition: transform 0.3s ease;
        }

        /* Optional: Adjust logo on smaller screens */
        @media (max-width: 768px) {
            .navbar-container img {
                width: 200px;
            }
        }

        /* Rest of your existing navbar styles */
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

        .navbar a:hover {
            color: #ff8c00;
            background: rgba(255, 255, 255, 0.1);
            transform: translateY(-2px);
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

        /* Enhanced Dropdown Styles */
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

        /* Dropdown menu (hidden by default) */
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
       <div class="navbar-container">
            <asp:Image ID="Image2" runat="server" Width="200px" ImageUrl="~/faunaa.jpg.png" />
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
            <h2>Get Pet Care Tips</h2>
            <div class="input-group">
                <label for="ddlPetType">Pet Type:</label>
                <asp:DropDownList ID="ddlPetType" runat="server">
                    <asp:ListItem Value="0">Select Pet Type</asp:ListItem>
                    <asp:ListItem Value="Dog">Dog</asp:ListItem>
                    <asp:ListItem Value="Cat">Cat</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="input-group">
                <label for="txtBreed">Breed:</label>
                <asp:TextBox ID="txtBreed" runat="server" placeholder="Enter breed"></asp:TextBox>
            </div>
            <div class="input-group">
                <label for="ddlHealth">Health Condition:</label>
                <asp:DropDownList ID="ddlHealth" runat="server">
                    <asp:ListItem Value="0">Select Health Condition</asp:ListItem>
                    <asp:ListItem Value="Healthy">Healthy</asp:ListItem>
                    <asp:ListItem Value="Injured">Injured</asp:ListItem>
                    <asp:ListItem Value="Sick">Sick</asp:ListItem>
                </asp:DropDownList>
            </div>
            <asp:Button ID="btnGetTips" runat="server" Text="Get Tips" CssClass="btn" OnClick="btnGetTips_Click" />
            <div id="results" runat="server" class="results" visible="false">
                <h3>Pet Care Details</h3>
                <asp:Label ID="lblResults" runat="server" CssClass="results-text"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>