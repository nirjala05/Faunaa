<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Faunaa.login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<style>
    
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-image: url('reg.jpg'); /* Add your own animal-related background image URL */
    background-size: cover; /* Ensures the image covers the entire screen */
    background-position: center;
    background-attachment: fixed; /* Keeps the background fixed during scrolling */
    background-blend-mode: overlay; /* Blends the image with the background color */
}

.container {
    width: 100%;
    max-width: 600px;
    margin: 150px auto; /* Reduced margin for better vertical alignment */
    padding: 20px;
    background-color: rgba(255, 255, 255, 0.8); /* White background with slight transparency */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Slightly stronger shadow for more contrast */
    border-radius: 8px;
    min-height: 300px;
}

h2 {
    text-align: center;
    color: #ff8c00; /* Orange text color */
    font-size: 2.5em;
    margin-bottom: 20px;
    text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2); /* Shadow effect for depth */
}

/* Form group styling */
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
    border-color: #ff8c00; /* Orange border on focus */
    outline: none;
    box-shadow: 0 0 8px rgba(255, 140, 0, 0.8); /* Glow effect */
}

.register-link {
            text-align: center;
            margin-top: 10px;
        }

.register-link a {
     color: #333;
    font-size: 1.1em;
    text-decoration: none;
    font-weight: bold;
    transition: color 0.3s ease;
}

.register-link a:hover {
    color: #ff8c00;
    text-decoration: underline;
}
        /* Button Styling */
        .btn-login {
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
            background-image: linear-gradient(45deg, #ff8c00, #e07a00); /* Gradient effect */
        }

        .btn-login:hover {
            background-color: #e07a00;
            background-image: linear-gradient(45deg, #e07a00, #ff8c00);
            transform: scale(1.05);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }

        .btn-login:active {
            background-color: #cc6d00;
            background-image: linear-gradient(45deg, #cc6d00, #e07a00);
            transform: scale(0.98);
        }

        .btn-login:focus {
            outline: none;
            box-shadow: 0 0 8px rgba(255, 140, 0, 0.8);
        }
        
/* Radio Button Group */
.radio-group {
    display: flex;
    justify-content: center;
    gap: 20px;
    margin-bottom: 20px;
}

/* Radio Button Wrapper */
.radio-input {
    display: flex;
    align-items: center;
    gap: 8px;
    position: relative;
}

/* Hide Default Radio Button */
.radio-input input[type="radio"] {
    appearance: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    width: 18px;
    height: 18px;
    border: 2px solid #ff8c00;
    border-radius: 50%;
    background-color: white;
    display: inline-block;
    position: relative;
    cursor: pointer;
    transition: 0.3s ease-in-out;
}

/* Custom Radio Button - Checked State */
.radio-input input[type="radio"]:checked {
    background-color: #ff8c00;
    border-color: #ff8c00;
}

/* Inner Dot */
.radio-input input[type="radio"]::before {
    content: "";
    width: 10px;
    height: 10px;
    background-color: white;
    border-radius: 50%;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%) scale(0);
    transition: 0.3s ease-in-out;
}

/* Inner Dot - Checked */
.radio-input input[type="radio"]:checked::before {
    transform: translate(-50%, -50%) scale(1);
}

/* Label Styling */
.radio-input label {
    color: black;
    font-size: 1.1em;
    font-weight: 600;
    cursor: pointer;
    transition: 0.3s;
}

/* Hover Effect */
.radio-input:hover input[type="radio"] {
    border-color: #ff8c00;
}

/* Add these new styles */
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

        #txtpassword {
            padding-right: 35px;
        }

  .forgot-password {
        color: #333;
    font-size: 1.1em;
    text-decoration: none;
    font-weight: bold;
    transition: color 0.3s ease;
    }

    .forgot-password:hover {
        color: #ff8c00;
    text-decoration: underline;
    }

    </style>
</head>
<body>
     <form id="form1" runat="server">
        <div class="container">
            <h2>Login</h2>
            <div class="form-group">
                <label for="txtEmailID">Email Id</label>
                <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" placeholder="Enter email" required/>
            </div>

            <div class="form-group">
                <label for="txtPassword">Password</label>
                <div class="password-field">
                    <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter password" required/>
                    <i id="togglePassword" class="fa-solid fa-eye password-toggle"></i>
                </div>
                <br />
                <asp:Label ID="Label4" runat="server"></asp:Label><br /><br />

                <asp:HyperLink ID="lnkForgotPassword" runat="server" NavigateUrl="ForgotPassword.aspx" CssClass="forgot-password">
                     Forgot Password?
                </asp:HyperLink>

            </div>

            <div class="form-group radio-group">
                <asp:RadioButton ID="rbAdmin" runat="server" GroupName="userType" Text="Admin" Checked="true" CssClass="radio-input" />
                <asp:RadioButton ID="rbUser" runat="server" GroupName="userType" Text="User" CssClass="radio-input" />
                <asp:RadioButton ID="rbNGO" runat="server" GroupName="userType" Text="NGO" CssClass="radio-input" />
            </div>
            
            <div class="form-group">
               <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" CssClass="btn-login" />
            </div>
            <div class="register-link">
                <p>Don't have an account? <a href="registration.aspx">Register here</a></p>
            </div>
        </div>
    </form>

    <script>
        document.getElementById('togglePassword').addEventListener('click', function (e) {
            // Get the password field
            const password = document.getElementById('<%= txtpassword.ClientID %>');
            // Toggle the type attribute
            const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
            password.setAttribute('type', type);
            // Toggle the eye slash icon
            this.classList.toggle('fa-eye');
            this.classList.toggle('fa-eye-slash');
        });
    </script>
</body>
</html>
