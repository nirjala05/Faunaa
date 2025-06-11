<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Donation.aspx.cs" Inherits="Faunaa.Donation" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Make a Donation - Animal Welfare</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet" />
    <style>
        body {
            background: linear-gradient(to right, #d3d3d3, #ff9f43);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            position: relative;
            overflow-x: hidden;
            background-size: 400% 400%;
            animation: gradientAnimation 5s ease infinite;
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

        .form-section {
            background-color: #fff;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }

        .form-section h4 {
            color: #2c3e50;
            font-weight: 600;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid #eee;
        }

        .form-control {
            border: 2px solid #eee;
            padding: 12px;
            border-radius: 10px;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: #3498db;
            box-shadow: 0 0 0 0.2rem rgba(52, 152, 219, 0.25);
        }

        .validation-error {
            color: #e74c3c;
            font-size: 0.85em;
            margin-top: 5px;
            display: block;
        }

        .btn-donate {
            background: linear-gradient(135deg, #FFAC1C, #FFBF00);
            border: none;
            padding: 15px 40px;
            font-size: 1.2em;
            border-radius: 50px;
            color: white;
            box-shadow: 0 4px 15px rgba(255, 107, 107, 0.3);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .btn-donate:hover {
            background: linear-gradient(135deg, #E49B0F, #FFC000);
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(255, 107, 107, 0.4);
        }

        .donation-container {
            background: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(255, 140, 0, 0.1);
            margin-top: 20px;
            border: 2px solid rgba(255, 140, 0, 0.1);
            backdrop-filter: blur(10px);
        }

        .page-title {
            color: #ff8c00;
            font-size: 2.5em;
            font-weight: bold;
            text-align: center;
            margin-bottom: 30px;
            padding: 20px;
            border-radius: 10px;
            background: linear-gradient(135deg, #ffffff, #fff5e6);
            box-shadow: 0 4px 15px rgba(255, 140, 0, 0.1);
        }

        .ngo-details {
            background: linear-gradient(135deg, #ffffff, #fff5e6);
            border-left: 5px solid #ff8c00;
            padding: 25px;
            border-radius: 10px;
            margin-bottom: 30px;
            box-shadow: 0 4px 15px rgba(255, 140, 0, 0.08);
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
        <div class="side-pattern left"></div>
        <div class="side-pattern right"></div>
        <div class="bg-pattern"></div>

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

        <div class="container donation-container">
            <h2 class="page-title">
                <i class="fas fa-heart"></i>Make a Donation
            </h2>

            <div class="ngo-details">
                <h4><i class="fas fa-paw me-2"></i>About Our Organization</h4>
                <asp:Literal ID="litNgoDetails" runat="server"></asp:Literal>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="form-section">
                        <h4><i class="fas fa-hand-holding-heart me-2"></i>Donation Form</h4>
                        <div class="mb-3">
                            <asp:Label ID="lblName" runat="server" Text="Full Name:" CssClass="form-label"></asp:Label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter your full name"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvName" runat="server"
                                ControlToValidate="txtName"
                                Display="Dynamic"
                                CssClass="validation-error"
                                ErrorMessage="Name is required.">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="mb-3">
                            <asp:Label ID="lblEmail" runat="server" Text="Email:" CssClass="form-label"></asp:Label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter your email"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                                ControlToValidate="txtEmail"
                                Display="Dynamic"
                                CssClass="validation-error"
                                ErrorMessage="Email is required.">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revEmail" runat="server"
                                ControlToValidate="txtEmail"
                                Display="Dynamic"
                                CssClass="validation-error"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                ErrorMessage="Invalid email format."></asp:RegularExpressionValidator>
                        </div>

                        <div class="mb-3">
                            <asp:Label ID="lblPhone" runat="server" Text="Phone:" CssClass="form-label"></asp:Label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-phone"></i></span>
                                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Enter your phone number"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvPhone" runat="server"
                                ControlToValidate="txtPhone"
                                Display="Dynamic"
                                CssClass="validation-error"
                                ErrorMessage="Phone number is required.">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="mb-3">
                            <asp:Label ID="lblAmount" runat="server" Text="Donation Amount (₹):" CssClass="form-label"></asp:Label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-rupee-sign"></i></span>
                                <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control" TextMode="Number" placeholder="Enter amount"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvAmount" runat="server"
                                ControlToValidate="txtAmount"
                                Display="Dynamic"
                                CssClass="validation-error"
                                ErrorMessage="Amount is required.">
                            </asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="rvAmount" runat="server"
                                ControlToValidate="txtAmount"
                                Display="Dynamic"
                                CssClass="validation-error"
                                MinimumValue="100"
                                MaximumValue="1000000"
                                Type="Integer"
                                ErrorMessage="Amount must be between ₹100 and ₹10,00,000">
                            </asp:RangeValidator>
                        </div>
                    </div>
                </div>
            </div>

            <div class="text-center mt-4">
                <asp:Button ID="btnDonate" runat="server" Text="Make Donation"
                    CssClass="btn btn-donate"
                    OnClick="btnDonate_Click" />
            </div>

            <asp:Label ID="lblMessage" runat="server" CssClass="alert alert-success mt-3" Visible="false"></asp:Label>
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