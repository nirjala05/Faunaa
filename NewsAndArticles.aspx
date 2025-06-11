<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewsAndArticles.aspx.cs" Inherits="Faunaa.NewsAndArticles" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Animal Welfare Content</title>
    <style>
body {
     background: linear-gradient(to right,#d3d3d3,#ff9f43);
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    line-height: 1.6;
    position: relative;
    overflow-x: hidden;
    background-size: 400% 400%;
    animation: gradientAnimation 5s ease infinite;
}


body, html {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    /* overflow-x: hidden;  Prevent horizontal scrolling */
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

/* ... rest of your existing styles ... */
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

.dropdown-menu {
    display: none;
    position: absolute;
    background: rgba(51, 51, 51, 0.95);
    min-width: 300px;
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
            width: 80%;
            margin: 200px auto; /* Increased top margin to shift container down */
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
        }

        h2 {
            color: #F28C28;
            text-align: center;
            margin-bottom: 20px;
            font-size:xx-large;
        }

        .tabs {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        .tab {
            padding: 10px 20px;
            background-color:#FFC000;
            margin: 0 5px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            width:5%;
            
        }

        .tab.active {
            background-color: #FFA500;
            color: white;
        }

        .tab:hover {
            background-color: #F28C28;
        }

        .tab-content {
            display: none;
        }

        .tab-content.active {
            display: block;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            // Show only the first tab by default
            $('.tab-content').hide();
            $('#newsTab').show().addClass('active');
            $('.tab[data-tab="newsTab"]').addClass('active');

            // Handle tab click
            $('.tab').click(function () {
                var tabId = $(this).data('tab');

                // Hide all tab contents
                $('.tab-content').hide().removeClass('active');

                // Show selected tab content
                $('#' + tabId).show().addClass('active');

                // Remove active class from all tabs and add to selected tab
                $('.tab').removeClass('active');
                $(this).addClass('active');
            });
        });
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
            <h2>Animal Welfare Content</h2>
            
            <div class="tabs">
                <div class="tab" data-tab="newsTab">News</div>
                <div class="tab" data-tab="mediaTab">Media</div>
                <div class="tab" data-tab="factsTab">Facts</div>
                <div class="tab" data-tab="articlesTab">Articles</div>
            </div>

            <div id="newsTab" class="tab-content active">
                <h3>Latest News</h3>
                <asp:PlaceHolder ID="phNews" runat="server"></asp:PlaceHolder>
            </div>

            <div id="mediaTab" class="tab-content">
                <h3>Media</h3>
                <asp:PlaceHolder ID="phMedia" runat="server"></asp:PlaceHolder>
            </div>

            <div id="factsTab" class="tab-content">
                <h3>Facts</h3>
                <asp:PlaceHolder ID="phFacts" runat="server"></asp:PlaceHolder>
            </div>

            <div id="articlesTab" class="tab-content">
                <h3>Articles</h3>
                <asp:PlaceHolder ID="phArticles" runat="server"></asp:PlaceHolder>
            </div>
        </div>
    </form>
</body>
</html>
