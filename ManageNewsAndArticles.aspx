<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageNewsAndArticles.aspx.cs" Inherits="Faunaa.ManageNewsAndArticles" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Admin - Animal Welfare Content</title>
<style>
/* File: styles.css */
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

    /* Layout Structure */
    .admin-panel {
        display: flex;
        min-height: 100vh;
    }

    /* Sidebar Styling */
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

.container {
        max-width: 1150px;
        margin-left: 550px; /* Space for sidebar */
        margin-right: 20px;
        margin-top: 80px; /* Space for header */
        margin-bottom: 60px; /* Space for footer */
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

h2 {
    color: #081963; /* Teal color for headings */
    text-align: center;
    margin-bottom: 20px;
    text-align:center;
}

.tabs {
    display: flex;
    justify-content: center;
    margin-bottom: 20px;
    border-bottom: 2px solid var(--accent-color);
    padding-bottom: 10px;
}

.tab {
    padding: 12px 25px;
    background-color: #081963;
    margin: 0 5px;
    border-radius: 8px 8px 0 0;
    cursor: pointer;
    color: white;
    font-weight: bold;
    transition: all 0.3s ease;
    box-shadow: 0 3px 6px rgba(0, 0, 0, 0.2);
}

.tab.active {
    background-color: #00796b;
    color: white;
    transform: translateY(-3px);
}

.tab:hover {
    background-color: #a7ffeb;
    color: #081963;
    transform: translateY(-2px);
}

/* Form Controls */
.form-control {
    width: 90%;
    padding: 12px;
    margin: 10px 0;
    border: 2px solid var(--accent-color);
    border-radius: 6px;
    font-size: 1srem;
    transition: all 0.3s ease;
    box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.1);
}

.form-control:focus {
    border-color: var(--light-color);
    outline: none;
    box-shadow: 0 0 8px rgba(246, 177, 122, 0.6);
}

/* Buttons */
.btn {
    display: inline-block;
    padding: 12px 20px;
    font-size: 1rem;
    font-weight: bold;
    text-transform: uppercase;
    border-radius: 6px;
    transition: all 0.3s ease;
    cursor: pointer;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
    background-color: #081963;
    color:White;
}

.btn:hover {
    transform: scale(1.05);
    box-shadow: 0 6px 10px rgba(0, 0, 0, 0.3);
}

.view-button-container {
    text-align: center;
    margin-top: 20px;
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

    
 .header {
            background: var(--primary-color);
            color: var(--white);
            padding: 15px;
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

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

</style>
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            $(".tab").click(function () {
                var tabId = $(this).data("tab");
                $(".tab-content").hide();
                $("#" + tabId).show();
                $(".tab").removeClass("active");
                $(this).addClass("active");
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
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
        <div class="container">
            <h2>Animal Welfare Content</h2>
            <div class="tabs">
                <div class="tab active" data-tab="newsTab">News</div>
                <div class="tab" data-tab="mediaTab">Media</div>
                <div class="tab" data-tab="factsTab">Facts</div>
                <div class="tab" data-tab="articlesTab">Articles</div>
            </div>

            <div id="newsTab" class="tab-content">
                <h3>Add News</h3>
                <asp:TextBox ID="txtNewsTitle" runat="server" placeholder="Title" CssClass="form-control"></asp:TextBox>
                <asp:TextBox ID="txtNewsContent" runat="server" TextMode="MultiLine" Rows="5" placeholder="Content" CssClass="form-control"></asp:TextBox>
                <asp:FileUpload ID="fileUploadNews" runat="server" CssClass="form-control" />
                <asp:Button ID="btnAddNews" runat="server" Text="Add News" OnClick="btnAddNews_Click" CssClass="btn btn-primary" />
                <asp:Label ID="lblNewsMessage" runat="server" CssClass="message" />
            </div>

            <div id="mediaTab" class="tab-content" style="display:none;">
                <h3>Add Media</h3>
                <asp:TextBox ID="txtMediaTitle" runat="server" placeholder="Title" CssClass="form-control"></asp:TextBox>
                <asp:TextBox ID="txtMediaContent" runat="server" TextMode="MultiLine" Rows="5" placeholder="Content" CssClass="form-control"></asp:TextBox>
                <asp:FileUpload ID="fileUploadMedia" runat="server" CssClass="form-control" />
                <asp:Button ID="btnAddMedia" runat="server" Text="Add Media" OnClick="btnAddMedia_Click" CssClass="btn btn-primary" />
                <asp:Label ID="lblMediaMessage" runat="server" CssClass="message" />
            </div>

            <div id="factsTab" class="tab-content" style="display:none; font-size:larger">
                <h3>Add Facts</h3>
                <asp:TextBox ID="txtFactTitle" runat="server" placeholder="Title" CssClass="form-control"></asp:TextBox>
                <asp:TextBox ID="txtFactContent" runat="server" TextMode="MultiLine" Rows="5" placeholder="Content" CssClass="form-control"></asp:TextBox>
                <asp:Button ID="btnAddFact" runat="server" Text="Add Fact" OnClick="btnAddFact_Click" CssClass="btn btn-primary" />
                <asp:Label ID="lblFactMessage" runat="server" CssClass="message" />
            </div>

            <div id="articlesTab" class="tab-content" style="display:none;">
                <h3>Add Articles</h3>
                <asp:TextBox ID="txtArticleTitle" runat="server" placeholder="Title" CssClass="form-control"></asp:TextBox>
                <asp:TextBox ID="txtArticleContent" runat="server" TextMode="MultiLine" Rows="5" placeholder="Content" CssClass="form-control"></asp:TextBox>
                <asp:FileUpload ID="fileUploadArticle" runat="server" CssClass="form-control" />
                <asp:Button ID="btnAddArticle" runat="server" Text="Add Article" OnClick="btnAddArticle_Click" CssClass="btn btn-primary" />
                <asp:Label ID="lblArticleMessage" runat="server" CssClass="message" />
            </div>
            <div class="view-button-container">
                 <a href="NewsAndArticles.aspx" class="view-button">View</a>
              </div>
        </div>
         <div class="footer">&copy; 2025 Faunaa | Admin Panel</div>
    </form>
</body>
</html>
