<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NGOPanel.aspx.cs" Inherits="Faunaa.NGOPanel" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NGO Panel</title>
    <link rel="stylesheet" href="Styles/styles.css" />
    <style>
        /* Basic CSS styling for the NGO Panel */
        :root {
            --primary-color: #4682B4; /* Blue for trust and care */
            --secondary-color: #2980b9; /* Darker blue for hover/active */
            --accent-color: #2ecc71; /* Green for growth and health */
            --light-color: #f39c12; /* Orange for warmth and energy */
            --white: #ffffff;
            --gray-100: #f8f9fa;
            --gray-200: #e9ecef;
            --shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; /* Modern font */
            background: var(--gray-100);
            color: var(--primary-color);
            line-height: 1.6;
        }

        .admin-panel {
            display: flex;
            min-height: 100vh;
            flex-direction: column;
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

        .container {
            max-width: 1490px;
            margin-left: 550px; /* Space for sidebar */
            margin-right: 20px;
            margin-top: 80px; /* Space for header */
            margin-bottom: 60px; /* Space for footer */
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .main-content h1 {
            color: var(--primary-color);
            font-size: 2.5rem;
            margin-bottom: 20px;
        }

            /* Metrics Section */
        .metrics {
            display: flex;
            justify-content: space-around;
            margin-top: 20px;
        }

        .metric-box {
            width: 200px;
            padding: 20px;
            background-color: #f0f0f0;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        .metric-box p {
            font-size: 20px;
            color: #555;
            font-weight: bold;
        }

        .metric-box h2 {
            font-size: 0;
            animation: countUp 0.8s ease-in-out forwards;
        }

        @keyframes countUp {
            from {
                font-size: 0;
            }
            to {
                font-size: 24px;
            }
        }


        .festive-alerts {
            margin-top: 20px;
        }

        .festive-alerts h2 {
            color: var(--primary-color);
        }

        /* GridView Styles */
        .grid-view {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .grid-view th, .grid-view td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        .grid-view th {
            background-color: var(--accent-color);
            color: white;
        }

        .grid-view tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .grid-view tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
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

        <div class="container">
            <div class="main-content">
                <h1>Welcome to Animal Welfare System</h1>
                <p>Your go-to platform for managing animal welfare!</p>
                
                <!-- Metrics Section -->
                <div class="metrics">
                    <div class="metric-box">
                        <h2 id="H2"><%= AdoptionApplicationsCount %></h2>
                        <p>Total Adoptions</p>
                    </div>
                    <div class="metric-box">
                        <h2 id="H3"><%= GetDonationCount() %></h2>
                        <p>Total Donations</p>
                    </div>
                </div>

                <!-- Festive Alerts Section -->
                <div class="festive-alerts">
                    <h2>Festive Alerts</h2>
                    <asp:GridView ID="GridViewAlerts" runat="server" CssClass="grid-view" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="EventDate" HeaderText="Event Date" />
                            <asp:BoundField DataField="Title" HeaderText="Title" />
                            <asp:BoundField DataField="Description" HeaderText="Description" />
                        </Columns>
                    </asp:GridView>
                </div>

            </div>
        </div>
    </form>
</body>
</html>