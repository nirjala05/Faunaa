<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GroomingTraining.aspx.cs" Inherits="Faunaa.GroomingTraining" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Grooming & Training Centers</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
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

    .container {
        max-width: 1200px;
        margin: 0 auto;
    }

    /* Header Styles */
    h1 {
        color: #2c3e50;
        text-align: center;
        margin-bottom: 40px;
        font-weight: 600;
        position: relative;
        padding-bottom: 15px;
    }

    h1:after {
        content: '';
        display: block;
        width: 100px;
        height: 3px;
        background: #3498db;
        position: absolute;
        bottom: 0;
        left: 50%;
        transform: translateX(-50%);
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
    height: 180px; /* Increased height to accommodate larger logo */
}

/* Logo styling */
.navbar-container img {
    width: 280px; /* Increased width */
    height: auto; /* Maintain aspect ratio */
    padding: 3px;
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

.center-card {
    border: 1px solid #ddd;
    border-radius: 10px;
    margin-bottom: 20px;
    padding: 20px;
    background-color: white;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.center-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
}

.center-image {
    width: 100%;
    height: 220px;
    object-fit: cover;
    border-radius: 8px;
    margin-bottom: 15px;
    transition: transform 0.3s ease, filter 0.3s ease;
}

.center-image:hover {
    transform: scale(1.05);
    filter: brightness(0.9);
}

.service-tag {
    background-color: #17a2b8;
    color: white;
    padding: 6px 12px;
    border-radius: 20px;
    margin: 4px;
    display: inline-block;
    font-size: 0.9em;
    font-weight: bold;
    text-transform: uppercase;
    transition: background 0.3s ease, transform 0.2s ease;
}

.service-tag:hover {
    background-color: #138496;
    transform: scale(1.1);
}

    </style>
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

        <div class="container mt-4">
            <h1 class="text-center mb-4">Grooming & Training Centers</h2>
            
            <div class="row">
                <asp:Repeater ID="rptCenters" runat="server">
                    <ItemTemplate>
                        <div class="col-md-4">
                            <div class="center-card">
                                <img src='<%# "Images/Centers/" + Eval("ImagePath") %>' 
                                     alt='<%# Eval("CenterName") %>' 
                                     class="center-image" 
                                     onerror="this.src='Images/Centers/default.jpg'" />
                                
                                <h3><%# Eval("CenterName") %></h3>
                                <p><strong>Address:</strong> <%# Eval("Address") %></p>
                                <p><strong>Contact:</strong> <%# Eval("Contact") %></p>
                                <p><strong>Description:</strong> <%# Eval("Description") %></p>
                                <p><strong>Services:</strong> <%# Eval("Services") %></p>
                                
                               
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>