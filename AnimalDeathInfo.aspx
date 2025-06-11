<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AnimalDeathInfo.aspx.cs" Inherits="Faunaa.AnimalDeathInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Animal Death Information</title>
    <style>
        body {
            background: linear-gradient(to right,#d3d3d3,#ff9f43);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            overflow-x: hidden;
            background-size: 400% 400%;
            animation: gradientAnimation 8s ease infinite;
            margin: 0;
            padding: 0;
        }

        .container {
            background-color: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(255, 127, 0, 0.1);
            text-align: center;
            max-width: 1200px;
            margin: 250px auto;
        }

        .container h2 {
            color: #ff6b00;
            text-align: center;
            font-size: 2em;
            margin-bottom: 20px;
            border-bottom: 3px solid #ffd2a8;
            padding-bottom: 10px;
        }

        .navbar-container {
            display: flex;
            align-items: center;
            background: linear-gradient(45deg, #1a1a1a, #2c2c2c);
            padding: 15px 15px;
            max-width: 100%;
            box-sizing: border-box;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
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
            font-size: 20px;
            margin: 0 5px;
            font-weight: 600;
            letter-spacing: 0.5px;
            border-radius: 25px;
            transition: all 0.3s ease;
            text-transform: uppercase;
            position: relative;
            margin-left: 40px;
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
            font-size: 15px;
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
            background: rgba(51, 51, 51, 0.95);
            min-width: 350px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            z-index: 1;
            border-radius: 12px;
            backdrop-filter: blur(10px);
            transform: translateY(20px);
            transition: all 0.3s ease;
            overflow: hidden;
        }

        .dropdown-menu a {
            color: #ffffff;
            padding: 12px 20px;
            text-decoration: none;
            display: block;
            font-size: 20px;
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

        /* Updated info-card styles */
        .info-card {
            border: 2px solid #ffd2a8;
            border-radius: 12px;
            padding: 20px;
            margin: 15px 0;
            background-color: #fff;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            text-align: left;
        }

        .info-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 15px rgba(255, 127, 0, 0.15);
        }

        .info-card p {
            margin: 10px 0;
            font-size: 1rem;
        }

        .info-card strong {
            color: #ff8534;
            display: block;
            margin-bottom: 5px;
            font-size: 1.1rem;
        }

        /* New styles for Guidelines and Address */
        .info-card .guidelines-text,
        .info-card .address-text {
            padding-left: 15px;
            display: block;
            margin-bottom: 15px;
            white-space: pre-line;
            line-height: 1.6;
            color: #333;
            background-color: #f8f9fa;
            padding: 10px 15px;
            border-radius: 6px;
            border-left: 3px solid #ff8534;
        }

        .emergency {
            color: #ff4500;
            font-weight: bold;
            padding: 10px;
            background-color: #ffe8d9;
            border-radius: 6px;
            display: inline-block;
            margin-top: 10px;
        }

        @media (max-width: 768px) {
            .container {
                width: 90%;
                padding: 20px;
                margin-top: 200px;
            }
            .info-card {
                padding: 15px;
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
            <h2>Animal Death Information and Guidelines</h2>
            <asp:Repeater ID="rptAnimalDeaths" runat="server">
                <ItemTemplate>
                    <div class="info-card">
                        <p>
                            <strong>Animal Type</strong>
                            <span><%# Eval("AnimalType") %></span>
                        </p>
                        <p>
                            <strong>Guidelines</strong>
                            <span class="guidelines-text"><%# Server.HtmlEncode(Eval("Guidelines").ToString()).Replace(Environment.NewLine, "<br/>") %></span>
                        </p>
                        <p>
                            <strong>Address</strong>
                            <span class="address-text"><%# Server.HtmlEncode(Eval("Address").ToString()).Replace(Environment.NewLine, "<br/>") %></span>
                        </p>
                        <p class="emergency">
                            <strong>Emergency Number</strong>
                            <span><%# Eval("EmergencyNumber") %></span>
                        </p>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>