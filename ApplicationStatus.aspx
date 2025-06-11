<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApplicationStatus.aspx.cs" Inherits="Faunaa.ApplicationStatus" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Application Status</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            width: 100%;
            text-align: center;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        .status-message {
            font-size: 18px;
            font-weight: bold;
            color: #4CAF50; /* Green color for positive status */
            margin-bottom: 10px;
            display: block;
        }

        .reason-message {
            font-size: 16px;
            color: #555;
            margin-top: 10px;
            display: block;
        }

        /* Additional styles for different statuses */
        .status-message.rejected {
            color: #f44336; /* Red color for rejected status */
        }

        .status-message.pending {
            color: #FFA500; /* Orange color for pending status */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Your Application Status</h2>
            <asp:Label ID="lblStatus" runat="server" CssClass="status-message" />
            <asp:Label ID="lblReason" runat="server" CssClass="reason-message" />
        </div>
    </form>
</body>
</html>