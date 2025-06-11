<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="Faunaa.AboutUs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
<title>About Us - Faunaa</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <style>
        :root {
            --primary-color: #FF6B35;
            --secondary-color: #2c2c2c;
            --accent-color: #4CAF50;
            --text-color: #333;
            --light-bg: #f8f9fa;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: var(--text-color);
            overflow-x: hidden;
        }

        .hero-section {
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)),
                        url('Images/hero-bg.jpg') center/cover;
            height: 60vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: white;
            padding: 0 20px;
        }

        .hero-content h1 {
            font-size: 3.5rem;
            font-weight: 700;
            margin-bottom: 20px;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        .hero-content p {
            font-size: 1.2rem;
            max-width: 800px;
            margin: 0 auto;
        }

        .mission-section {
            padding: 80px 0;
            background-color: var(--light-bg);
        }

        .mission-card {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
            height: 100%;
        }

        .mission-card:hover {
            transform: translateY(-5px);
        }

        .mission-icon {
            font-size: 2.5rem;
            color: var(--primary-color);
            margin-bottom: 20px;
        }

        .stats-section {
            background: var(--primary-color);
            color: white;
            padding: 60px 0;
        }

        .stat-item {
            text-align: center;
            padding: 20px;
        }

        .stat-number {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 10px;
        }

        .team-section {
            padding: 80px 0;
        }

        .team-member {
            text-align: center;
            margin-bottom: 30px;
        }

        .team-member img {
            width: 200px;
            height: 200px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 20px;
            border: 5px solid var(--primary-color);
        }

        .social-links a {
            color: var(--primary-color);
            margin: 0 10px;
            font-size: 1.2rem;
            transition: color 0.3s ease;
        }

        .social-links a:hover {
            color: var(--secondary-color);
        }

        .values-section {
            background: var(--secondary-color);
            color: white;
            padding: 80px 0;
        }

        .value-item {
            text-align: center;
            padding: 20px;
        }

        .value-icon {
            font-size: 2rem;
            color: var(--primary-color);
            margin-bottom: 15px;
        }

        .cta-section {
            background: linear-gradient(rgba(0, 0, 0, 0.8), rgba(0, 0, 0, 0.8)),
                        url('Images/cta-bg.jpg') center/cover;
            padding: 100px 0;
            text-align: center;
            color: white;
        }

        .cta-button {
            background: var(--primary-color);
            color: white;
            padding: 15px 40px;
            border-radius: 30px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            display: inline-block;
            margin-top: 20px;
        }

        .cta-button:hover {
            background: white;
            color: var(--primary-color);
            transform: translateY(-3px);
        }

        @media (max-width: 768px) {
            .hero-content h1 {
                font-size: 2.5rem;
            }
            
            .stat-item {
                margin-bottom: 30px;
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
            height: 180px;
        }

        .navbar-container img {
            width: 300px;
            height: 200px;
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Include your navbar here -->
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
       <a href="Logout.aspx">Logout</a> 
    </div>
    
</div>
<a href="Login.aspx">Login</a>
</div>
        </div>
        <section class="hero-section">
            <div class="hero-content">
                <h1>Welcome to Faunaa</h1>
                <p>Dedicated to protecting and caring for animals in need through rescue, rehabilitation, and education.</p>
            </div>
        </section>

        <section class="mission-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 mb-4">
                        <div class="mission-card">
                            <i class="fas fa-heart mission-icon"></i>
                            <h3>Our Mission</h3>
                            <p>To provide care, shelter, and love to animals in need while working towards a future where every animal has a loving home.</p>
                        </div>
                    </div>
                    <div class="col-md-4 mb-4">
                        <div class="mission-card">
                            <i class="fas fa-eye mission-icon"></i>
                            <h3>Our Vision</h3>
                            <p>Creating a world where animals are treated with compassion, respect, and understanding.</p>
                        </div>
                    </div>
                    <div class="col-md-4 mb-4">
                        <div class="mission-card">
                            <i class="fas fa-hands-helping mission-icon"></i>
                            <h3>Our Approach</h3>
                            <p>Combining modern animal welfare practices with community engagement to make lasting positive change.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="stats-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-6">
                        <div class="stat-item">
                            <div class="stat-number">5000+</div>
                            <div class="stat-label">Animals Rescued</div>
                        </div>
                    </div>
                    <div class="col-md-3 col-6">
                        <div class="stat-item">
                            <div class="stat-number">3000+</div>
                            <div class="stat-label">Successful Adoptions</div>
                        </div>
                    </div>
                    <div class="col-md-3 col-6">
                        <div class="stat-item">
                            <div class="stat-number">200+</div>
                            <div class="stat-label">Volunteers</div>
                        </div>
                    </div>
                    <div class="col-md-3 col-6">
                        <div class="stat-item">
                            <div class="stat-number">10+</div>
                            <div class="stat-label">Years Experience</div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="values-section">
            <div class="container">
                <h2 class="text-center mb-5">Our Core Values</h2>
                <div class="row">
                    <div class="col-md-3 col-6">
                        <div class="value-item">
                            <i class="fas fa-heart value-icon"></i>
                            <h4>Compassion</h4>
                        </div>
                    </div>
                    <div class="col-md-3 col-6">
                        <div class="value-item">
                            <i class="fas fa-hand-holding-heart value-icon"></i>
                            <h4>Care</h4>
                        </div>
                    </div>
                    <div class="col-md-3 col-6">
                        <div class="value-item">
                            <i class="fas fa-shield-alt value-icon"></i>
                            <h4>Protection</h4>
                        </div>
                    </div>
                    <div class="col-md-3 col-6">
                        <div class="value-item">
                            <i class="fas fa-users value-icon"></i>
                            <h4>Community</h4>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="cta-section">
            <div class="container">
                <h2>Make a Difference Today</h2>
                <p>Join us in our mission to protect and care for animals in need.</p>
                <a href="Donation.aspx" class="cta-button">Donate Now</a>
            </div>
        </section>

        <!-- Include your footer here -->
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
    
