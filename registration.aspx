<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="Faunaa.registration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Register</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
           body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('reg.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            background-blend-mode: overlay;
        }

        .container {
            width: 100%;
            max-width: 600px;
            background-color: White;
            margin: 150px auto;
            padding: 30px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
            border-radius: 12px;
            min-height: 500px;
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease;
        }

        h2 {
            text-align: center;
            color: #ff8c00;
            font-size: 2.5em;
            margin-bottom: 20px;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-size: 1.2em;
            margin-bottom: 8px;
            color: #333;
            font-weight: bold;
        }

        .form-group input {
            width: 100%;
            padding: 12px;
            font-size: 1.1em;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #fff;
            box-sizing: border-box;
            transition: all 0.3s ease;
        }

        .form-group input:focus {
            border-color: #ff8c00;
            outline: none;
            box-shadow: 0 0 8px rgba(255, 140, 0, 0.8);
        }

        .register-btn {
            width: 100%;
            padding: 12px;
            background-color: #ff8c00;
            color: white;
            font-size: 1.2em;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease-in-out;
            background-image: linear-gradient(45deg, #ff8c00, #e07a00);
        }

        .register-btn:hover {
            background-color: #e07a00;
            background-image: linear-gradient(45deg, #e07a00, #ff8c00);
            transform: scale(1.05);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }

        .register-btn:active {
            background-color: #cc6d00;
            background-image: linear-gradient(45deg, #cc6d00, #e07a00);
            transform: scale(0.98);
        }

        .register-btn:focus {
            outline: none;
            box-shadow: 0 0 8px rgba(255, 140, 0, 0.8);
        }

        .login-link {
            text-align: center;
            margin-top: 30px;
        }

        .login-link a {
            color: #333;
            font-size: 1.1em;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        .login-link a:hover {
            color: #ff8c00;
            text-decoration: underline;
        }

        .password-field {
            position: relative;
            width: 100%;
        }

        .password-toggle {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #666;
            padding: 5px;
            z-index: 1;
        }

        .password-toggle:hover {
            color: #ff8c00;
        }

        #txtpwd, #txtcpwd {
            padding-right: 35px;
            width: 100%;
            padding: 12px;
            font-size: 1.1em;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #fff;
            box-sizing: border-box;
            transition: all 0.3s ease;
        }

        .auto-style4 {
            width: 267px;
        }
        .auto-style5 {
            width: 440px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Register</h2>
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" Text="Name"></asp:Label>
                <asp:TextBox ID="txtusername" runat="server" CssClass="form-control" placeholder="Enter username" required/>
            </div>

            <div class="form-group">
                <strong>Email Id</strong>
                <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" placeholder="Enter Email Id" required/>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtemail" ErrorMessage="enter valid email id!" 
                    ForeColor="Red" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </div>

            <div class="form-group">
                <strong>Address</strong>
                <asp:TextBox ID="txtadd" runat="server" CssClass="form-control" placeholder="Enter Address" required/>
            </div>

             <div class="form-group">
                <strong>Phone No</strong>
                <asp:TextBox ID="txtphone" runat="server" CssClass="form-control" placeholder="Enter Phone No" required/>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtphone" ErrorMessage="Enter phone number!" ForeColor="Red">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                    ControlToValidate="txtphone" 
                    ErrorMessage="enter valid phone no. with country code i.e, +91" ForeColor="Red" 
                    ValidationExpression="^\+?[1-9]\d{1,3}\s?\d{7,14}$">
                </asp:RegularExpressionValidator>
            </div>

            <div class="form-group">
                <asp:Label ID="Label2" runat="server" style="font-weight: 700" Text="Password"></asp:Label>
                <div class="password-field">
                  <asp:TextBox ID="txtpwd" runat="server" TextMode="Password" placeholder="Enter Password" required />
                    <i id="togglePassword1" class="fa-solid fa-eye password-toggle"></i>
                </div>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="txtpwd" 
                    ErrorMessage="Any lowercase, uppercase, digit, special character eg.,aA1@" 
                    ForeColor="Red" ValidationExpression="([a-z][A-Z][0-9][!@#$%^&amp;_*])">
                </asp:RegularExpressionValidator>
            </div>

            <div class="form-group">
                <asp:Label ID="Label3" runat="server" style="font-weight: 700" Text="Confirm Password"></asp:Label>
                <div class="password-field">
                  <asp:TextBox ID="txtcpwd" runat="server" TextMode="Password" placeholder="Re-enter Password" required />
                    <i id="togglePassword2" class="fa-solid fa-eye password-toggle"></i>
                </div>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="txtpwd" ControlToValidate="txtcpwd" 
                    ErrorMessage="Wrong password " ForeColor="Red">
                </asp:CompareValidator>
            </div>

            <div class="form-group">
                <asp:Button ID="Button1" runat="server" Text="Send OTP" CssClass="register-btn" 
                    onclick="Button1_Click" Font-Bold="True" />
            </div>

             <div class="form-group">
                <strong>Enter OTP</strong>
                <asp:TextBox ID="txtOtp" runat="server" CssClass="form-control" placeholder="Enter OTP"/>
            </div>

            <div class="form-group">
                <asp:Image ID="Image2" runat="server" Height="55px" ImageUrl="~/Captcha.aspx" Width="186px" />
                <asp:Label runat="server" ID="lblCaptchaMessage" Font-Size="large"></asp:Label><br /><br />
                <asp:TextBox runat="server" ID="txtVerificationCode" placeholder="Enter captcha above"></asp:TextBox>
            </div>

            <div class="login-link">
                <p>
                    <asp:Button ID="btnRegister" runat="server"
                        Text="Register" CssClass="register-btn" onclick="btnRegister_Click" Font-Bold="True"/><br /><br />
                    Already have an account? <a href="login.aspx">Login here</a></p>
            </div>
        </div>
    </form>

    <script>
        // Function for the first password field
        document.getElementById('togglePassword1').addEventListener('click', function (e) {
            const password = document.getElementById('<%= txtpwd.ClientID %>');
            const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
            password.setAttribute('type', type);
            this.classList.toggle('fa-eye');
            this.classList.toggle('fa-eye-slash');
            e.preventDefault(); // Prevent form submission
        });

        // Function for the confirm password field
        document.getElementById('togglePassword2').addEventListener('click', function (e) {
            const password = document.getElementById('<%= txtcpwd.ClientID %>');
            const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
            password.setAttribute('type', type);
            this.classList.toggle('fa-eye');
            this.classList.toggle('fa-eye-slash');
            e.preventDefault(); // Prevent form submission
        });
    </script>
</body>
</html>