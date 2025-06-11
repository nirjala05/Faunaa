<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminpanel.aspx.cs" Inherits="Faunaa.adminpanel" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Admin Panel</title>
    <style>
        :root {
            --primary-color: #2D3250;
            --secondary-color: #424769;
            --accent-color: #7077A1;
            --light-color: #F6B17A;
            --white: #ffffff;
            --gray-100: #f8f9fa;
            --gray-200: #e9ecef;
            --shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
            background: var(--gray-100);
            color: var(--primary-color);
            line-height: 1.6;
        }

        .admin-panel {
            display: flex;
            min-height: 100vh;
        }

        .sidebar {
            width: 300px;
            background: var(--primary-color);
            padding: 2rem 1.5rem;
            position: fixed;
            height: 95vh;
            left: 0;
            top: 0;
            overflow-y: auto;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        }

        .sidebar h2 {
            color: var(--white);
            font-size: 1.75rem;
            margin-bottom: 2.5rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid var(--accent-color);
            font-weight: 600;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .sidebar ul li {
            margin: 0.5rem 0;
        }

        .sidebar ul li a {
            color: var(--white);
            text-decoration: none;
            font-size: 1.1rem;
            padding: 1rem 1.5rem;
            display: flex;
            align-items: center;
            border-radius: 8px;
            transition: background 0.3s ease, padding-left 0.3s ease;
        }

        .sidebar ul li a:hover {
            background: var(--secondary-color);
            padding-left: 2rem;
        }

        .content {
            flex: 1;
            padding: 20px;
            margin-left: 300px;
            background-color: #ecf0f1;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            margin-left:350px;
            margin-top:10px;
        }

        .header {
            font-size: 24px;
            margin-bottom: 20px;
            color: var(--primary-color);
            border-bottom: 2px solid var(--secondary-color);
            padding-bottom: 10px;
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


        .bar-chart {
            display: flex;
            justify-content: center; /* Center the bar chart */
            margin-top: 40px;
        }

        .bar {
            width: 80px;
            text-align: center;
            margin: 0 5px; /* Reduced margin for less gap */
        }

        .bar svg {
            width: 80px;
            height: 200px;
        }

        .recent-activity {
            margin-top: 40px;
            background: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .recent-activity h3 {
            margin-bottom: 15px;
        }

        .activity-item {
            padding: 10px;
            border-bottom: 1px solid #e0e0e0;
        }

        .activity-item:last-child {
            border-bottom: none;
        }

        .footer {
            background: var(--secondary-color);
            color: var(--white);
            text-align: center;
            padding: 10px;
            position: fixed;
            bottom: 0;
            width: 100%;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="sidebar">
            <ul>
                <li><a href="adminpanel.aspx">&#8962; Home</a></li>
                <li><a href="manageuser.aspx">&#128100; Users</a></li>
                <li><a href="ManageAdmin.aspx">&#128274; Admin</a></li>
                <li><a href="ManageNGO.aspx">&#127968; NGO</a></li>
                <li><a href="ManageBuyPets.aspx">&#128024; Pets</a></li>
                <li><a href="AddPets.aspx">&#128049; Adoptions</a></li>
                <li><a href="AdminReview.aspx">&#128218; Adoptions Applications</a></li>
                <li><a href="AdminDonations.aspx">&#128176; Donations</a></li>
               <li><a href="AdminFood.aspx">&#128138; Food & Medicine</a></li> 
                <li><a href="ManageVeterinary.aspx">&#128021; Veterinary & Services</a></li>
                <li><a href="ManageNewsAndArticles.aspx">&#128196; Article & Facts</a></li>
                <li><a href="AddGrommingTraining.aspx">&#128218; Grooming & Training</a></li>
                <li><a href="AnimalDeathAdmin.aspx">&#128128; PetDeath Information</a></li>
                <li><a href="SetAlerts.aspx">&#9888; Set Alerts</a></li>
                <li><a href="login.aspx">&#10060; Logout</a></li>
            </ul>
        </div>

        <main class="content">
            <header class="header">
                <h1>Welcome, Admin!</h1>
                <p>This is your admin panel where you can manage users, adoptions, pets, and more.</p>
            </header>

            <div class="metrics">
                <div class="metric-box">
                    <h2 id="H1"><%= Convert.ToInt32(VisitorsCount) %></h2>
                    <p>Total Visitors</p>
                </div>
                <div class="metric-box">
                    <h2 id="H2"><%= Convert.ToInt32(AdoptionApplicationsCount) %></h2>
                    <p>Total Adoptions</p>
                </div>
                <div class="metric-box">
                    <h2 id="H3"><%= Convert.ToInt32(GetDonationCount()) %></h2>
                    <p>Total Donations</p>
                </div>
            </div>

            <section>
                <h2>Statistics Overview</h2>
                <div class="bar-chart">
                    <div class="bar">
                        <svg>
                            <rect x="0" y="<%= 200 - (Convert.ToInt32(VisitorsCount) * 2) %>" width="80" height="<%= Convert.ToInt32(VisitorsCount) * 2 %>" fill="#3498db" />
                        </svg>
                        <p>Visitors</p>
                        <p><%= Convert.ToInt32(VisitorsCount) %></p>
                    </div>
                    <div class="bar">
                        <svg>
                            <rect x="0" y="<%= 200 - (Convert.ToInt32(AdoptionApplicationsCount) * 2) %>" width="80" height="<%= Convert.ToInt32(AdoptionApplicationsCount) * 2 %>" fill="#2ecc71" />
                        </svg>
                        <p>Adoptions</p>
                        <p><%= Convert.ToInt32(AdoptionApplicationsCount) %></p>
                    </div>
                    <div class="bar">
                        <svg>
                            <rect x="0" y="<%= 200 - (Convert.ToInt32(GetDonationCount()) * 2) %>" width="80" height="<%= Convert.ToInt32(GetDonationCount()) * 2 %>" fill="#e74c3c" />
                        </svg>
                        <p>Donations</p>
                        <p><%= Convert.ToInt32(GetDonationCount()) %></p>
                    </div>
                </div>
            </section>

            <div class="recent-activity">
                <h3>Recent Activity</h3>
                <asp:Repeater ID="rptRecentActivity" runat="server">
                    <ItemTemplate>
                        <div class="activity-item">
                            <%# Eval("ActivityDescription") %>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </main>
    </form>
    <div class="footer">&copy; 2025 Faunaa | Admin Panel</div>
</body>
</html>