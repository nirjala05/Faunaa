<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NGOPetCare.aspx.cs" Inherits="Faunaa.NGOPetCare" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">

    <title>NGO Pet Care</title>

    <style>

        /* General body styles */

        :root {

            --primary-color: #4682B4; /* Steel Blue */

            --secondary-color: #2980b9; /* Darker blue for hover/active */

            --accent-color: #2ecc71; /* Green for growth and health */

            --light-color: #f39c12; /* Orange for warmth and energy */

            --white: #ffffff;

            --gray-100: #f8f9fa;

            --gray-200: #e9ecef;

            --shadow: 0 5px 15px rgba(0,0,0,0.1);

            --animal-pattern: url('data:image/svg+xml,%3Csvg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20"%3E%3Cpath fill="%23e0e0e0" d="M0 0h20v20H0z"/%3E%3Ccircle cx="5" cy="5" r="2" fill="%23d0d0d0" /%3E%3Ccircle cx="15" cy="15" r="2" fill="%23d0d0d0" /%3E%3C/svg%3E'); /* Subtle animal pattern */

        }

        body {

            margin: 0;

            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; /* Modern font */

            background: var(--gray-100);

            color: var(--primary-color);

            line-height: 1.6;

        }


        /* Heading styles */

        h2 {

            text-align: center;

            color: var(--primary-color); /* Use primary color for heading */

            margin-bottom: 20px;

            font-size: 24px; /* Increased font size */

        }



        /* Input group styles */

        .input-group {

            margin-bottom: 20px;

        }



        /* Label styles */

        .input-group label {

            display: block;

            margin-bottom: 5px;

            color: #333; /* Dark gray for labels */

            font-weight: bold; /* Bold labels */

        }



        /* Input field styles */

        .input-group input {

            width: 98%;

            padding: 12px; /* Increased padding */

            border: 2px solid var(--primary-color); /* Blue border */

            border-radius: 8px; /* Rounded corners */

            transition: border-color 0.3s, box-shadow 0.3s; /* Smooth transition */

        }



        /* Placeholder text color */

        input::placeholder {

            color: #aaa; /* Light gray for placeholder text */

        }



        /* Focus styles for input fields */

        input:focus {

            border-color: #0056b3; /* Darker blue on focus */

            box-shadow: 0 0 5px rgba(0, 91, 187, 0.5); /* Glow effect */

            outline: none; /* Remove default outline */

        }



        /* Button styles */

        button {

            background-color: var(--primary-color); /* Use primary color */

            color: white; /* White text */

            border: none;

            padding: 12px;

            border-radius: 8px; /* Rounded corners */

            cursor: pointer;

            width: 100%;

            font-size: 16px; /* Increased font size */

            transition: background-color 0.3s, transform 0.3s; /* Smooth transition */

        }



        /* Button hover effect */

        button:hover {

            background-color: #0056b3; /* Darker blue on hover */

            transform: translate(-2px); /* Slight lift effect */

        }



        /* Message label styles */

        .lblMessage {

            margin-top: 20px;

            padding: 10px;

            background-color: #d1ecf1; /* Light blue background for messages */

            border-left: 6px solid #0c5460; /* Darker blue border */

            color: #0c5460; /* Darker blue text */

            border-radius: 4px;

            font-weight: bold; /* Bold message text */

        }

        .sidebar {

            width: 300px;

            background: var(--primary-color);

            padding: 2.5rem 2rem;

            position: fixed;

            height: 100vh;

            left: 0;

            top: 0;

            overflow-y: auto;

        }



        .sidebar h2 {

            color: var(--white);

            font-size: 2rem;

            margin-bottom: 3rem;

            padding-bottom: 1.2rem;

            border-bottom: 3px solid var(--accent-color);

            font-weight: 700;

        }



        .sidebar ul {

            list-style: none;

            padding: 0;

            margin: 0;

        }



        .sidebar ul li {

            margin: 0.7rem 0;

        }



        .sidebar ul li a {

            color: var(--white);

            text-decoration: none;

            font-size: 1.2rem;

            padding: 1.2rem 1.8rem;

            display: block;

            border-radius: 10px;

            transition: all 0.3s ease;

            position: relative;

            overflow: hidden;

        }



        .sidebar ul li a:hover {

            background: var(--secondary-color);

            padding-left: 2.5rem;

        }



        .sidebar ul li a::before {

            content: '';

            position: absolute;

            left: 0;

            top: 0;

            height: 100%;

            width: 6px;

            background: #00008B;

            transform: scaleY(0);

            transition: transform 0.2s ease;

        }



        .sidebar ul li a:hover::before {

            transform: scaleY(1);

        }



        .container {

            max-width: 1900px;

            margin-left: 400px; /* Space for sidebar */

            margin-right: 20px;

            margin-top: 80px; /* Space for header */

            margin-bottom: 60px; /* Space for footer */

            background-color: white;

            padding: 20px;

            border-radius: 8px;

            box-shadow: 0 0 10px rgba(0,0,0,0.1);

        }

 .insert {
    background-color: #4682B4;
    color: white;
    font-size: 16px;
    font-weight: bold;
    padding: 10px 20px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    transition: all 0.3s ease-in-out;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.2);
}

.insert:hover {
    background-color:#2980b9;
    transform: scale(1.05);
}

.insert:active {
    background-color:#4682B4;
    transform: scale(0.98);
}


    </style>

</head>

<body>

    <form id="form1" runat="server">

        <div class="container">

            <div class="sidebar">
             <h2>NGO Dashboard</h2>
                <ul>
                <li><a href="NGOPanel.aspx">&#8962; Home</a></li> <!-- House symbol -->
                <li><a href="NGOPetcare.aspx">&#128024; Pets Care</a></li> <!-- Dog symbol -->
                <li><a href="ngodonation.aspx">&#128176; Manage Donations</a></li> <!-- Money bag symbol -->
                <li><a href="ngoadoption.aspx">&#128049; Manage Adoptions</a></li> <!-- Cat symbol -->
                <li><a href="NGOAdoptionApplication.aspx">&#128218; Adoption Applications</a></li> <!-- Document symbol -->
                <li><a href="login.aspx">&#10060; Logout</a></li>

                </ul>

            </div>

            <h2>Insert Pet Data</h2>

            <div class="input-group">

                <label for="txtPetType">Pet Type:</label>

                <asp:TextBox ID="txtPetType" runat="server" placeholder="Enter pet type" required></asp:TextBox>

            </div>

            <div class="input-group">

                <label for="txtBreed">Breed:</label>

                <asp:TextBox ID="txtBreed" runat="server" placeholder="Enter breed" required></asp:TextBox>

            </div>

            <div class="input-group">

                <label for="txtHealthCondition">Health Condition:</label>

                <asp:TextBox ID="txtHealthCondition" runat="server" placeholder="Enter health condition" required></asp:TextBox>

            </div>

            <div class="input-group">

                <label for="txtDiet">Diet:</label>

                <asp:TextBox ID="txtDiet" runat="server" placeholder="Enter diet" required></asp:TextBox>

            </div>

            <div class="input-group">

                <label for="txtMedicine">Medicine:</label>

                <asp:TextBox ID="txtMedicine" runat="server" placeholder="Enter medicine" required></asp:TextBox>

            </div>

            <div class="input-group">

                <label for="txtHealthTips">Health Tips:</label>

                <asp:TextBox ID="txtHealthTips" runat="server" placeholder="Enter health tips" required></asp:TextBox>

            </div>

            <asp:Button ID="btnInsertPet" runat="server" Text="Insert Pet" OnClick="btnInsertPet_Click" CssClass="insert"/>

            <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>

        </div>

    </form>

</body>

</html>