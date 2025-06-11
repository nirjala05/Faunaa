<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="Faunaa.ResetPassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Reset Password</title>
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
            margin: 150px auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.8);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
            min-height: 300px;
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
        .btn {
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
        .btn:hover {
            background-color: #e07a00;
            background-image: linear-gradient(45deg, #e07a00, #ff8c00);
            transform: scale(1.05);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }
        .btn:active {
            background-color: #cc6d00;
            background-image: linear-gradient(45deg, #cc6d00, #e07a00);
            transform: scale(0.98);
        }
        .btn:focus {
            outline: none;
            box-shadow: 0 0 8px rgba(255, 140, 0, 0.8);
        }
        .error-message {
            color: red;
            margin-top: 10px;
        }
        .forgot-password {
            display: inline-block;
            color: #333;
            font-size: 15px;
            font-weight: bold;
            text-decoration: none;
            transition: all 0.3s ease-in-out;
            padding: 5px 10px;
            border-radius: 5px;
            position: relative;
        }
        .forgot-password:hover {
            color: #ff4500;
            background-color: #fff3e0;
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
        #txtpassword, #txtcpassword {
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
    </style>
    <!-- Load FontAwesome -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Reset Password</h2>
           
            <div class="form-group">
                <label for="lblnewpassword">Enter New Password:</label>
                <div class="password-field">
                    <asp:TextBox ID="txtpassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter New Password" required></asp:TextBox>
                    <i id="togglePassword1" class="fa-solid fa-eye password-toggle"></i>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="txtpassword" 
                    ErrorMessage="Any lowercase, uppercase, digit, special character eg.,aA1@" 
                    ForeColor="Red" ValidationExpression="([a-z][A-Z][0-9][!@#$%^&amp;_*])">
                </asp:RegularExpressionValidator>
                </div>
            </div>

            <div class="form-group">
                <label for="lblcpassword">Enter Confirm Password:</label>
                <div class="password-field">
                    <asp:TextBox ID="txtcpassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter Confirm Password" required></asp:TextBox>
                    <i id="togglePassword2" class="fa-solid fa-eye password-toggle"></i>
                     <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="txtpassword" ControlToValidate="txtcpassword" 
                    ErrorMessage="Wrong password " ForeColor="Red">
                </asp:CompareValidator>
                </div>
            </div>

            <div class="form-group">
                <asp:Button ID="btnpwd" runat="server" Text="Reset Password" CssClass="btn" OnClick="btnpwd_Click1" />
            </div>

            <div class="form-group">
                <asp:HyperLink ID="lnkForgotPassword" runat="server" NavigateUrl="login.aspx" CssClass="forgot-password">
                    Back To Login
                </asp:HyperLink>
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:Label ID="lblMessage" runat="server" CssClass="error-message" ForeColor="#000099"></asp:Label>
            </div> 
        </div>
    </form>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            // Debugging: Check if the script is running
            console.log("Script loaded!");

            // Toggle password visibility for the first password field
            document.getElementById('togglePassword1').addEventListener('click', function () {
                let password = document.getElementById('<%= txtpassword.ClientID %>');
                console.log("Toggling password visibility for:", password); // Debugging
                let type = password.getAttribute('type') === 'password' ? 'text' : 'password';
                password.setAttribute('type', type);
                this.classList.toggle('fa-eye');
                this.classList.toggle('fa-eye-slash');
            });

            // Toggle password visibility for the second password field
            document.getElementById('togglePassword2').addEventListener('click', function () {
                let password = document.getElementById('<%= txtcpassword.ClientID %>');
                console.log("Toggling password visibility for:", password); // Debugging
                let type = password.getAttribute('type') === 'password' ? 'text' : 'password';
                password.setAttribute('type', type);
                this.classList.toggle('fa-eye');
                this.classList.toggle('fa-eye-slash');
            });
        });
    </script>
</body>
</html> 