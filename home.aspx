<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Faunaa.home" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<title>Home Page</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<style>
body 
{  
    background: linear-gradient(to right,#d3d3d3,#ff9f43);
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    line-height: 1.6;
    position: relative;
    overflow-x: hidden;
    background-size: 400% 400%;
    animation: gradientAnimation 8s ease infinite;
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
    font-size: 20px;
    margin: 0 5px;
    font-weight: 600;
    letter-spacing: 0.5px;
    border-radius: 25px;
    transition: all 0.3s ease;
    text-transform: uppercase;
    position: relative;
    margin-left:40px;
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

/* Slideshow container */
.homepage-container {
    padding-top: 180px; /* Add top padding to push content below navbar */
    padding: 0;
    font-family: Arial, sans-serif;
    max-width: 100%;
    box-sizing: border-box;
}


.homepage-header {
    text-align: center;
    margin-bottom: 20px;
}

/* Slideshow image styles */
#Image1 
{
    margin-top:10%;
    width: 250%; /* Make the image take the full width of its container */
    height: auto; /* Maintain aspect ratio */
    max-width: 220%; /* Prevent the image from exceeding the container's width */
    max-height: 800px; /* Limit the maximum height */
    border-radius: 15px;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
    transition: transform 1s ease-in-out, box-shadow 1s ease-in-out;
}

#Image1:hover {
    transform: scale(1.05);
    box-shadow: 0 12px 24px rgba(0, 0, 0, 0.3);
}

/* Container and service item styles */
.container {
    width: 90%; /* Adjusted for responsiveness */
    max-width: 1500px;
    margin: 50px auto;
    padding: 80px;
    font-family: 'Arial', sans-serif;
    border: 3px solid #ff8c00;
    border-radius: 15px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    text-align: center;
    background-color: #f5f5f5;
}

.main-heading {
    font-size: 3em;
    color: #ff8c00;
    margin-bottom: 20px;
}

.highlight {
    color: #e74c3c;
}

.description {
    font-size: 1.2em;
    color: #666;
    margin-bottom: 40px;
}

.services {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
    gap: 20px;
}

.service-item {
    width: 45%; /* Adjusted for responsiveness */
    padding: 10px;
    text-align: center;
    border-radius: 10px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.service-item:hover {
    transform: translateY(-10px);
    box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2);
}

.service-item h3 {
    margin-bottom: 10px;
}

.service-item p {
    font-size: 1em;
    color: #666;
}

asp:ImageButton {
    border: none;
    border-radius: 10px;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

asp:ImageButton:hover {
    transform: scale(1.1);
    box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2);
}

.scrollable-content {
    height: 500px;
    overflow-y: auto;
    border: 1px solid #ddd;
    padding: 10px;
}

/* Show the dropdown menu on hover or click */
.dropdown:hover .dropdown-menu,
.dropdown:focus-within .dropdown-menu {
    display: block;
}
.dropdown-toggle {
    color: white;
    text-decoration: none;
    padding: 20px 16px;
    font-size: 25px;
    font-weight: bold;
    cursor: pointer;
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

/* Links inside dropdown */
.dropdown-menu a {
    color: white;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    font-size: 18px;
}

/* Change color on hover */
.dropdown-menu a:hover {
    background-color: #575757;
}

/* Show the dropdown menu on hover or click */
.dropdown:hover .dropdown-menu,
.dropdown:focus-within .dropdown-menu {
    display: block;
}


/* Modal Styles */
.modal {
    display: none;
    position: fixed;
    z-index: 9999;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0,0,0,0.5);
}

.modal-content {
    background-color: #fefefe;
    margin: 15% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 300px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0,0,0,0.2);
    position: relative;
}

.modal-header {
    padding: 10px;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

.modal-body {
    padding: 20px;
    text-align: center;
}

.btn-login {
    background-color: #ff8c00;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    margin-top: 15px;
    transition: background-color 0.3s ease;
}

.btn-login:hover {
    background-color: #e67e00;
}

/* Features Section */
.features-section {
    padding: 90px 20px;
    background: #ffffff;
    margin-top: 50px;
    margin-bottom: 100px; /* Added margin bottom for gap */
    position: relative;
}

.section-title {
    text-align: center;
    color: #ff8c00;
    font-size: 2.5em;
    margin-bottom: 50px;
    position: relative;
}

.section-title::after {
    content: '';
    position: absolute;
    bottom: -10px;
    left: 50%;
    transform: translateX(-50%);
    width: 100px;
    height: 3px;
    background: linear-gradient(to right, #ff8c00, #ffa500);
}

.features-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 30px;
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
}

.feature-card {
    background: #ffffff;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    text-align: center;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    border: 1px solid #e0e0e0;
    position: relative;
    overflow: hidden;
}

.feature-card::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: linear-gradient(135deg, rgba(255, 140, 0, 0.1), rgba(255, 165, 0, 0.1));
    opacity: 0;
    transition: opacity 0.3s ease;
}

.feature-card:hover {
    transform: translateY(-10px);
    box-shadow: 0 10px 25px rgba(255, 140, 0, 0.2);
    border-color: #ff8c00;
}

.feature-card:hover::before {
    opacity: 1;
}

.feature-card i {
    font-size: 2.5em;
    color: #ff8c00;
    margin-bottom: 20px;
    transition: transform 0.3s ease;
}

.feature-card:hover i {
    transform: scale(1.1);
}

//* Statistics Section */
.statistics-section {
    background-color: White;
    padding: 100px 0; /* Increased padding */
    margin-top: 90px; /* Increased margin */
    position: relative;
    width: 100%;
}

.stat-container {
    background-color: #ff8c00;
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); /* Increased minmax width */
    gap: 70px; /* Increased gap */
    max-width: 1400px; /* Increased max-width */
    margin: 0 auto;
    padding: 50px 40px; /* Increased padding */
    border-radius: 20px;
    box-shadow: 0 10px 30px rgba(255, 140, 0, 0.2);
}

.stat-item {
    text-align: center;
    color: #ffffff;
    padding: 40px 30px; /* Increased padding */
    border-radius: 15px;
    transition: all 0.3s ease;
    background: rgba(255, 255, 255, 0.1);
    backdrop-filter: blur(5px);
    min-height: 200px; /* Added minimum height */
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.stat-item:hover {
    transform: translateY(-10px); /* Increased transform */
    background: rgba(255, 255, 255, 0.2);
    box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
}

.stat-item h3 {
    font-size: 3.5em; /* Increased font size */
    margin-bottom: 20px;
    transition: all 0.3s ease;
    font-weight: bold;
}

.stat-item p {
    font-size: 1.4em; /* Increased font size */
    margin-top: 10px;
    color: #ffffff;
    font-weight: 500;
}

.stat-item:hover h3 {
    transform: scale(1.15);
    color: #ffffff;
    text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.2);
}

/* Responsive adjustments */
@media (max-width: 768px) {
    .stat-container {
        padding: 30px 20px;
    }
    
    .stat-item {
        padding: 30px 20px;
        min-height: 180px;
    }
    
    .stat-item h3 {
        font-size: 2.8em;
    }
    
    .stat-item p {
        font-size: 1.2em;
    }
}

/* Testimonials Section */
.testimonials-section {
    padding: 80px 20px;
    background: #ffffff;
    margin-top: 50px;
}

.testimonials-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 30px;
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
}

.testimonial-card {
    background: #ffffff;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    transition: all 0.3s ease;
    border: 1px solid #e0e0e0;
    position: relative;
}

.testimonial-card:hover {
    transform: translateY(-5px) scale(1.02);
    box-shadow: 0 15px 30px rgba(255, 140, 0, 0.2);
    border-color: #ff8c00;
}

.testimonial-content {
    position: relative;
    padding: 20px;
}

.testimonial-content i {
    color: #ff8c00;
    font-size: 1.5em;
    margin-bottom: 15px;
    transition: transform 0.3s ease;
}

.testimonial-card:hover .testimonial-content i {
    transform: rotate(360deg);
}

.testimonial-author {
    color: #ff8c00;
    font-style: italic;
    margin-top: 15px;
    text-align: right;
    font-weight: 600;
    transition: color 0.3s ease;
}

.testimonial-card:hover .testimonial-author {
    color: #ff6b00;
}

/* Responsive Design */
@media (max-width: 768px) {
    .features-grid,
    .stat-container,
    .testimonials-grid {
        grid-template-columns: 1fr;
    }
    
    .section-title {
        font-size: 2em;
    }
}
 
  /* Footer Styles */
        .footer {
            background-color: #1a1a1a;
            color: black;
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
 
        h1
        {
            color:#ff8c00;
             text-align: center;
        }
        
     .heading
     {
          text-align:center;
            margin-left:20px;
            margin-right:20px;
            font-size:larger;
             background: linear-gradient(to right,#d3d3d3,#ff9f43);
     }
</style>

</head>

<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

   
    <!-- Rest of your existing content -->
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
    <div class="homepage-container">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" Font-Size="X-Large" 
            style="text-align:center" Font-Bold="True"></asp:Label>
        <br />
      
        <header class="homepage-header">
            <br />
        <br />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Timer ID="Timer1" runat="server" Interval="1300" ontick="Timer1_Tick">
                </asp:Timer>
            <br />
                <asp:Image ID="Image1" runat="server" Height="1000px" Width="2100px" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />
        
        </div>

        <div class="heading">
        <fieldset>
        <legend><h1>Guidelines For Animal Welfare in Summers</h1></legend>
        <p style="text-align:center;"><h3>To ensure animal welfare during Surat's hot summers , prioritize providing access to cool water, shade, and shelter, and avoid leaving animals in parked cars or hot environments.</h3>
         <h4><h3>For Pets:</h3>
<b>Hydration:</b><br />
Ensure constant access to fresh, cool water. Consider adding ice cubes to their water bowls or providing damp towels for them to lie on. <br />
<b>Shade and Cool Spots:</b><br />
Provide access to shaded areas, both indoors and outdoors. Create cool spots with fans or air conditioning. <br />
<b>Grooming:</b><br />
Regularly brush your pet to remove loose fur, which can trap heat. Avoid shaving, as their natural coat helps regulate temperature. <br />
<b>Sun Protection:</b><br />
Apply pet-safe sunscreen to exposed areas like ears, nose, and belly, especially for pets with light-colored fur. <br />
<b>Avoid Hot Surfaces:</b><br />
Be mindful of hot pavements and surfaces, which can burn your pet's paws. Walk them during cooler parts of the day. <br />
<b>Never Leave in Cars:</b><br />
Even with windows cracked, a car can quickly become extremely hot, posing a serious risk of heatstroke. <br />
<b>Recognize Heatstroke:</b><br />
Know the signs of heatstroke (excessive panting, drooling, lethargy, vomiting) and seek immediate veterinary care if you suspect your pet is overheating. 
<b>Diet:</b><br />
Consider reducing portion sizes slightly during hot weather, as pets may be less active. <br />
<b>Parasite Prevention:</b><br />
Summer is a peak time for fleas, ticks, and mosquitoes. Use veterinarian-recommended preventative measures. <br />
<h3>For Community Animals:</h3>
<b>Provide Water:</b><br />
Place bowls of clean, cool water in accessible locations, especially in areas where stray animals congregate. <br />
<b>Shade and Shelter:</b><br />
Create temporary shade spots using cardboard boxes, cloth, or other materials. <br />
<b>Raise Awareness:</b><br />
Encourage others to help by providing water and shade for community animals. <br />
<b>Contact Local Shelters:</b><br />
If you see an animal in distress, contact your local animal shelter or rescue organization. <br />
<b>Be Mindful of Pavement:</b><br />
Be aware that pavement can become extremely hot, potentially burning the paws of stray animals.</h4><br /></p><br /><br />
<h3 style="color:White">Prayas Helpline:- 09825119081</h3>
</fieldset>
         </div>

         <div class="container">
        <h1 class="main-heading">Book For <span class="highlight">Your Pet</span></h1>
        <p class="description">
            A Whole New World for Pets
        </p>
        <div class="services">
            <div class="service-item">
                &nbsp;<h3>
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/s1.jpg" 
                        onclick="ImageButton1_Click"/>
                </h3>
                <h3>Donation</h3>
                <p>"Give a Home, Gain a Heart!"</p>
            </div>
            <div class="service-item">
                &nbsp;<h3>
                    <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/s2.jpg" 
                        onclick="ImageButton2_Click"/>
                </h3>
                 <h3>Pet Adoption</h3>
                <p>"Love is Waiting in a Shelter Near You."</p>
            </div>
            <div class="service-item">
                &nbsp;<h3>
                    <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/images/s3.jpg" 
                        onclick="ImageButton3_Click"/>
                </h3>
                 <h3>Pet Grooming & Training</h3>
                <p>Gentle Grooming, Sparkling Results.</p>
            </div>    

    </div>
        </div>

        <div class="features-section">
    <h2 class="section-title">Why Choose Us?</h2>
    <div class="features-grid">
        <div class="feature-card">
            <i class="fas fa-heart"></i>
            <h3>Dedicated Care</h3>
            <p>Our team of experienced professionals provides 24/7 care and attention to all animals.</p>
        </div>
        <div class="feature-card">
            <i class="fas fa-medal"></i>
            <h3>Quality Service</h3>
            <p>Premium quality services ensuring the best care for your beloved pets.</p>
        </div>
        <div class="feature-card">
            <i class="fas fa-hands-helping"></i>
            <h3>Support Network</h3>
            <p>Strong community of pet lovers and experts to help you with pet care.</p>
        </div>
    </div>
</div>

<div class="statistics-section">
    <div class="stat-container">
        <div class="stat-item">
            <h3>10+</h3>
            <p>Pets Adopted</p>
        </div>
        <div class="stat-item">
            <h3>5+</h3>
            <p>Monthly Donations</p>
        </div>
   
        <div class="stat-item">
            <h3>50+</h3>
            <p>Total Users</p>
        </div>
    </div>
</div>

<div class="testimonials-section">
    <h2 class="section-title">What Pet Parents Say</h2>
    <div class="testimonials-grid">
        <div class="testimonial-card">
            <div class="testimonial-content">
                <i class="fas fa-quote-left"></i>
                <p>"Amazing experience adopting my furry friend. The process was smooth and the staff was very helpful."</p>
                <div class="testimonial-author">- Sarah Johnson</div>
            </div>
        </div>
        <div class="testimonial-card">
            <div class="testimonial-content">
                <i class="fas fa-quote-left"></i>
                <p>"The donation process was transparent and I could see my contribution making a real difference."</p>
                <div class="testimonial-author">- Michael Brown</div>
            </div>
        </div>
    </div>
</div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

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