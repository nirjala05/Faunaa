<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SetAlerts.aspx.cs" Inherits="Faunaa.SetAlerts" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Set Festive Alerts</title>
    <style>
        /* Basic styles for the calendar and form */
        .calendar {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 20px;
        }

        .event-form {
            margin-top: 20px;
            background: #f9f9f9;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .event-form input, .event-form textarea {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .event-form button {
            background: #3498db;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
        }

        .event-form button:hover {
            background: #2980b9;
        }
       :root {
            --primary-color: #2D3250;
            --secondary-color: #424769;
            --accent-color: #7077A1;
            --light-color: #F6B17A;
            --white: #ffffff;
            --gray-100: #f8f9fa;
            --gray-200: #e9ecef;
            --shadow: 0 5px 15px rgba(0,0,0,0.08);
        }

        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
            background: var(--gray-100);
            color: var(--primary-color);
            line-height: 1.6;
        }
     .header {
            background: var(--primary-color);
            color: var(--white);
            padding: 15px;
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

       /* Update the footer class */
.footer {
    background: var(--secondary-color);
    color: var(--white);
    text-align: center;
    padding: 10px;
    position: fixed; /* Change to fixed */
    bottom: 0;
    width: 100%;
    font-size: 14px;
    z-index: 1000; /* Ensure footer stays on top */
}
  .sidebar {
            width: 300px;
            background: var(--primary-color);
            padding: 2rem 1.5rem;
            position: fixed;
            height: 100vh;
            left: 0;
            top: 0;
            overflow-y: auto;
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
            display: block;
            border-radius: 8px;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .sidebar ul li a:hover {
            background: var(--secondary-color);
            padding-left: 2rem;
        }

        .sidebar ul li a::before {
            content: '';
            position: absolute;
            left: 0;
            top: 0;
            height: 100%;
            width: 4px;
            background: var(--light-color);
            transform: scaleY(0);
            transition: transform 0.2s ease;
        }

        .sidebar ul li a:hover::before {
            transform: scaleY(1);
        }
        
 .view-button-container {
    text-align: center;
    margin-top: 25px;
}

.view-button {
    padding: 14px 35px;
    background: var(--accent-color);
    color: white;
    text-decoration: none;
    border-radius: 8px;
    font-weight: bold;
    transition: all 0.3s ease;
    box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
}

.view-button:hover {
    background: var(--secondary-color);
    transform: scale(1.1);
}
    </style>
</head>
<body>
 <div class="header">
    <span>Admin Panel</span>
</div>
            <div class="sidebar">
    <ul>
        <li><a href="adminpanel.aspx">&#8962; Home</a></li> <!-- House symbol -->
        <li><a href="manageuser.aspx">&#128100; Users</a></li> <!-- User symbol -->
        <li><a href="ManageAdmin.aspx">&#128274; Admin</a></li> <!-- Shield symbol -->
        <li><a href="ManageNGO.aspx">&#127968; NGO</a></li> <!-- Globe symbol -->
        <li><a href="ManageBuyPets.aspx">&#128024; Pets</a></li> <!-- Dog symbol -->
        <li><a href="AddPets.aspx">&#128049; Adoptions</a></li> <!-- Cat symbol -->
        <li><a href="AdminReview.aspx">&#128218; Adoptions Applications</a></li> <!-- Document symbol -->
        <li><a href="AdminDonations.aspx">&#128176; Donations</a></li> <!-- Money bag symbol -->
        <li><a href="AdminFood.aspx">&#128138; Food & Medicine</a></li> <!-- Pill Emoji -->
        <li><a href="ManageVeterinary.aspx">&#128021; Veterinary & Services</a></li> <!-- Vet symbol -->
        <li><a href="ManageNewsAndArticles.aspx">&#128196; Article & Facts</a></li> <!-- Newspaper symbol -->
        <li><a href="AddGrommingTraining.aspx">&#128218; Grooming & Training</a></li> <!-- Document symbol -->
        <li><a href="AnimalDeathAdmin.aspx">&#128128; PetDeath Information</a></li> <!-- Pet symbol -->
        <li><a href="SetAlerts.aspx">&#9888; Set Alerts</a></li>
        <li><a href="login.aspx">&#10060; Logout</a></li><!-- Cross mark symbol -->
        
    </ul>
</div>
    <div class="calendar">
        <h1>Set Festive Alerts</h1>
        <input type="date" id="eventDate" />
        <div class="event-form">
            <h3>Event Details</h3>
            <input type="text" id="eventTitle" placeholder="Event Title" required />
            <textarea id="eventDescription" placeholder="Event Description" rows="4" required></textarea>
            <button onclick="saveEvent()">Save Event</button>
        </div>
    </div>

     <div class="view-button-container">
    <a href="NGOPanel.aspx" class="view-button">View</a>
</div>

    <script>
        function saveEvent() {
            const date = document.getElementById('eventDate').value;
            const title = document.getElementById('eventTitle').value;
            const description = document.getElementById('eventDescription').value;

            if (date && title && description) {
                // Make an AJAX call to save the event
                const xhr = new XMLHttpRequest();
                xhr.open("POST", "SetAlerts.aspx/SaveEvent", true);
                xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        alert("Event saved successfully!");
                        // Optionally, clear the form
                        document.getElementById('eventDate').value = '';
                        document.getElementById('eventTitle').value = '';
                        document.getElementById('eventDescription').value = '';
                    }
                };
                xhr.send(JSON.stringify({ date: date, title: title, description: description }));
            } else {
                alert("Please fill in all fields.");
            }
        }
    </script>
</body>
</html>