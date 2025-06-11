<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adoption.aspx.cs" Inherits="Faunaa.Adoption" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Pet Adoption</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
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
            max-width: 1200px;
            margin: 150px auto; /* Center the container with top margin */
            padding: 20px; /* Add padding for spacing */
        }

        /* Header Styles */
       
        .pet-card {
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
            margin-bottom: 20px;
            background: white;
            overflow: hidden;
        }

        .pet-card:hover {
            transform: translateY(-5px);
        }

        .pet-image {
            width: 100%;
            height: 250px;
            object-fit: cover;
        }

        .pet-info {
            padding: 15px;
        }

        .adopt-btn {
            background-color: #FF6B35;
            border: none;
            width: 100%;
            padding: 10px;
            color: white;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .adopt-btn:hover {
            background-color: #ff5722;
        }

        .filter-section {
            margin: 20px 0;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
        }

        h2 {
            text-align: center;
            color: #ffffff;
            font-size: 2.5em;
            margin: 1px 0;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
            letter-spacing: 1px;
            padding-top: 20px;
            font-size: 2em;
            margin: 30px 0;
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

        /* Footer Styles */
        .footer {
            background-color: #1a1a1a;
            color: #ffffff;
            padding: 40px 20px;
            text-align: center;
            position: relative;
            bottom: 0;
            width: 100%;
            margin-top: 20px;
        }

        .footer h5 {
            margin-bottom: 20px;
            font-weight: bold;
        }

        .footer p {
            margin: 5px 0;
        }

        .footer a {
            color: #ff8c00;
            text-decoration: none;
        }

        .footer a:hover {
            text-decoration: underline;
        }

        .footer .social-icons a {
            margin: 0 10px;
            color: #ffffff;
            font-size: 1.5em;
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
            <h2>🐾 Available Pets for Adoption</h2>
            <div class="filter-section">
                <div class="row">
                    <div class="col-md-6">
                        <asp:DropDownList ID="ddlFilterType" runat="server" CssClass="form-select" 
                            AutoPostBack="true" OnSelectedIndexChanged="ddlFilterType_SelectedIndexChanged">
                            <asp:ListItem Text="All Pets" Value="" />
                            <asp:ListItem Text="Dogs" Value="Dog" />
                            <asp:ListItem Text="Cats" Value="Cat" />
                        </asp:DropDownList>
                    </div>
                </div>
            </div>

            <div class="row">
                <asp:Repeater ID="rptPets" runat="server" OnItemCommand="rptPets_ItemCommand">
                    <ItemTemplate>
                        <div class="col-md-4">
                            <div class="pet-card">
                                <asp:Image ID="imgPet" runat="server" CssClass="pet-image" 
                                    ImageUrl='<%# Eval("ImagePath") %>' />
                                <div class="pet-info">
                                    <p><strong>Name:</strong> <%# Eval("PetName") %></p>
                                    <p><strong>Type:</strong> <%# Eval("Type") %></p>
                                    <p><strong>Breed:</strong> <%# Eval("Breed") %></p>
                                    <p><strong>Age:</strong> <%# Eval("Age") %> years</p>
                                    <p><strong>Gender:</strong> <%# Eval("Gender") %></p>
                                    <p><strong>Description:</strong> <%# Eval("Description") %></p>
                                    <asp:Button ID="btnAdopt" runat="server" Text="Adopt Me" 
                                        PostBackUrl='<%# "TermsAndConditions.aspx?PetId=" + Eval("PetId") %>'
                                        CommandName="Adopt" 
                                        CommandArgument='<%# Eval("PetId") %>' 
                                        CssClass="adopt-btn" />
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </form>

    <!-- Footer Section -->
    <footer class="footer">
        <div class="container">
            <h5>About Animal Welfare</h5>
            <p>Our organization is dedicated to the rescue, rehabilitation, and rehoming of animals in need. We believe in creating a compassionate world where every animal is treated with kindness and respect.</p>
            <p>Join us in our mission to make a difference in the lives of animals.</p>
            <h5>Contact Us</h5>
            <p>Helpline: <strong><a href="tel:1234567890"><i class="fas fa-phone"></i> 123-456-7890</a></strong></p>
            <p>Email: <strong><a href="mailto:faunaa005@gmail.com">faunaa005@gmail.com</a></strong></p>
            <h5>Useful Links</h5>
            <p>
                <a href="AboutUs.aspx">About Us</a> | 
                <a href="Contact.aspx">Contact</a> | 
                <a href="PrivacyPolicy.aspx">Privacy Policy</a>
            </p>
            <div class="social-icons">
                <a href="https://www.facebook.com" target="_blank"><i class="fab fa-facebook"></i></a>
                <a href="https://www.twitter.com" target="_blank"><i class="fab fa-twitter"></i></a>
                <a href="https://www.instagram.com" target="_blank"><i class="fab fa-instagram"></i></a>
            </div>
        </div>
    </footer>
</body>
</html>