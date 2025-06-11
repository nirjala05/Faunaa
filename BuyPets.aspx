<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BuyPets.aspx.cs" Inherits="Faunaa.BuyPets" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Available Pets</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: linear-gradient(to right,#d3d3d3,#ff9f43);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            position: relative;
            overflow-x: hidden;
            background-size: 400% 400%;
            animation: gradientAnimation 8s ease infinite;
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

        .container {
            max-width: 1300px;
            margin: 200px auto 0; /* Increased top margin */
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #ffffff;
            font-size: 2.5em;
            margin: 4px 0;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.2);
            letter-spacing: 1px;
            padding-top: 20px;
        }

        .pet-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 60px;
            padding: 20px;
            margin-top: 20px;
        }

        .pet-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            padding: 20px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .pet-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.2);
        }

        .pet-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: linear-gradient(to right, #d3d3d3, #ff9f43);
        }

        .pet-image {
            width: 100%;
            height: 250px;
            object-fit: cover;
            border-radius: 15px;
            margin-bottom: 20px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }

        .pet-image:hover {
            transform: scale(1.05);
        }

        .pet-card h4 {
            color: #ff9f43;
            font-size: 1.5em;
            margin: 15px 0;
            font-weight: 600;
        }

        .pet-card p {
            margin: 10px 0;
            color: #555;
            font-size: 0.95em;
            line-height: 1.5;
        }

        .pet-card p strong {
            color: #ff9f43;
            font-weight: 500;
        }

        .price-tag {
            background: linear-gradient(to right, #c59169, #ff9f43);
            color: white;
            padding: 8px 15px;
            border-radius: 25px;
            display: inline-block;
            margin: 10px 0;
            font-weight: 500;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
        }

        .btn-primary {
            background: linear-gradient(to right, #c59169, #ff9f43);
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 25px;
            cursor: pointer;
            width: 100%;
            margin-top: 15px;
            font-size: 1em;
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        .btn-primary:hover {
            background: linear-gradient(to left, #c59169, #ff9f43);
            box-shadow: 0 7px 20px rgba(0,0,0,0.2);
            transform: translateY(-2px);
        }

        @media (max-width: 768px) {
            .navbar-container {
                height: 200px;
            }

            .navbar-container img {
                width: 200px;
            }

            .container {
                margin-top: 270px;
            }

            .pet-grid {
                grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
                gap: 20px;
                padding: 10px;
            }

            h2 {
                font-size: 2em;
                margin: 30px 0;
            }

            .pet-card {
                padding: 15px;
            }

            .pet-image {
                height: 200px;
            }
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .pet-card {
            animation: fadeIn 0.6s ease-out forwards;
        }

        ::-webkit-scrollbar {
            width: 10px;
        }

        ::-webkit-scrollbar-track {
            background: rgba(255,255,255,0.1);
        }

        ::-webkit-scrollbar-thumb {
            background: linear-gradient(to right, #d3d3d3, #ff9f43);
            border-radius: 5px;
        }

        ::-webkit-scrollbar-thumb:hover {
            background: linear-gradient(to left, #d3d3d3, #ff9f43);
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

        .social-icons {
            text-align: center;
            margin-top: 20px;
        }

        .social-icons a {
            display: inline-block;
            margin: 0 10px;
            font-size: 30px;
            color: #333;
            transition: 0.3s;
        }

        .social-icons a:hover {
            color: #007bff;
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
               
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Cart.aspx" CssClass="go-to-cart">Go to Cart</asp:HyperLink>
            </div>
        </div>
        <div class="container">
            <h2>🐾 Available Pets for Sale</h2>
            <div class="pet-grid">
                <asp:Repeater ID="RepeaterAvailablePets" runat="server">
                    <ItemTemplate>
                        <div class="pet-card">
                            <img src='<%# Eval("Image") %>' alt='<%# Eval("Name") %>' class="pet-image" />
                            <h3><%# Eval("Name") %></h3>
                            <p><b>Breed:</b> <%# Eval("Breed") %></p>
                            <p><b>Age:</b> <%# Eval("Age") %> years</p>
                            <p><b>Description:</b> <%# Eval("Description") %></p>
                            <p><b>Price:</b> ₹<%# Eval("Price") %></p>
                            <asp:Button ID="btnAddToCart" runat="server" Text="Add To Cart"
                                CommandArgument='<%# Eval("Id") %>'
                                CssClass="btn-primary" OnCommand="btnAddToCart_Command" />
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
            <p>Email: <strong><a href="faunaa005@gmail.com">faunaa005@gmail.com</a></strong></p>
            <h5>Useful Links</h5>
            <p>
                <a href="AboutUs.aspx">About Us</a> | 
                <a href="AboutUs.aspx">Contact</a> | 
                <a href="AboutUs.aspx">Privacy Policy</a>
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