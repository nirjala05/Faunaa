<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="Faunaa.ForgotPassword" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>Forgot Password</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
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

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 12px;
            font-size: 1.1em;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #fff;
            box-sizing: border-box;
            transition: all 0.3s ease;
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
        .toggle-password {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            font-size: 1.2em;
            color: #555;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
       <asp:Panel ID="pnlReset" runat="server" Visible="true">
            <h2>Forgot Password</h2>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblMessage" runat="server" CssClass="error-message" 
                ForeColor="#000099"></asp:Label>
            
              <div class="form-group">
            <label for="txtEmail">Enter Email:</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter Email"></asp:TextBox><br /><br />
           <asp:Button ID="btnemail" runat="server" Text="Send Email" CssClass="btn" 
                onclick="btnemail_Click1" /><br /><br />
                </div>


              <div class="form-group">
            <label for="lblcode">Enter Code:</label>
            <div style="position: relative;">
                <asp:TextBox ID="txtcode" runat="server"  CssClass="form-control" placeholder="Enter Code"></asp:TextBox>
                     </div><br />
            </div>

              <div class="form-group">
             <asp:Label ID="Label1" runat="server" ForeColor="Green"></asp:Label>
            <asp:Button ID="btnReset" runat="server" Text="Verify Code" OnClick="btnReset_Click" CssClass="btn"/><br /><br />
            </div>

              <div class="form-group">
            <asp:HyperLink ID="lnkForgotPassword" runat="server" NavigateUrl="login.aspx" CssClass="forgot-password">
                Back To Login
            </asp:HyperLink><br /><br />
            </div>

          </asp:Panel>
        </div>
    </form>

</body>
</html>
