<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Food.aspx.cs" Inherits="Faunaa.Food" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Food Page</title>
    <style>
     * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: linear-gradient(to right,#d3d3d3,#ff9f43);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            position: relative;
            overflow-x: hidden;
            background-size: 400% 400%;
            animation: gradientAnimation 8s ease infinite;
        }
        
        .container {
            width: 80%;
            margin: 1000px auto; /* Increased top margin to shift container down */
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
        }
        
        .navbar-container {
            display: flex;
            align-items: center;
            background: linear-gradient(45deg, #1a1a1a, #2c2c2c);
            padding: 15px 15px;
            max-width: 100%;
            box-sizing: border-box;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1000;
            height: 180px;
        }

        .navbar-container img {
            width: 300px;
            height: auto;
            padding: 5px;
            transition: transform 0.3s ease;
        }

        .navbar {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            width: 100%;
        }

        .navbar a {
            display: block;
            color: #ffffff;
            text-align: center;
            padding: 15px 25px;
            text-decoration: none;
            font-size: 20px;
            margin: 0 5px;
            font-weight: 600;
            letter-spacing: 0.5px;
            border-radius: 25px;
            transition: all 0.3s ease;
            text-transform: uppercase;
            position: relative;
            margin-left: 40px;
        }

        .navbar a::after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            background: #ff8c00;
            bottom: 8px;
            left: 50%;
            transform: translateX(-50%);
            transition: width 0.3s ease;
        }

        .navbar a:hover::after {
            width: 70%;
        }

        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-toggle {
            color: #ffffff;
            text-decoration: none;
            padding: 15px 25px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
        }

        .dropdown-toggle:hover {
            color: #ff8c00;
        }

        .dropdown-menu {
            display: none;
            position: absolute;
            background: rgba(51, 51, 51, 0.95);
            min-width: 350px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            z-index: 1;
            border-radius: 12px;
            backdrop-filter: blur(10px);
            transform: translateY(20px);
            transition: all 0.3s ease;
            overflow: hidden;
        }

        .dropdown-menu a {
            color: #ffffff;
            padding: 12px 20px;
            text-decoration: none;
            display: block;
            font-size: 20px;
            transition: all 0.3s ease;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .dropdown-menu a:last-child {
            border-bottom: none;
        }

        .dropdown-menu a:hover {
            background: rgba(255, 140, 0, 0.1);
            padding-left: 25px;
            color: #ff8c00;
        }

        .dropdown:hover .dropdown-menu {
            display: block;
            transform: translateY(0);
            animation: fadeIn 0.3s ease;
        }

 .container {
    width: 60%;
    height:90%;
    margin: 250px auto; /* Adjusted top margin */
    padding: 20px;
    background-color: rgba(255, 255, 255, 0.9);
    border-radius: 10px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
}


        h1 {
            text-align: center;
            color: #ff8c00;
            margin-bottom: 25px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .tab {
            overflow: hidden;
            background-color: #e9ecef;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .tab button {
            background-color: inherit;
            float: left;
            border: none;
            outline: none;
            cursor: pointer;
            padding: 14px 25px;
            transition: 0.3s;
            font-size: 16px;
            font-weight: 600;
            color: black;
        }

        .tab button:hover {
            background-color: #dee2e6;
        }

        .tab button.active {
            background-color: #ff8c00;
            color: white;
        }

        .tabcontent {
            display: none;
            padding: 30px;
            border: 1px solid #dee2e6;
            border-top: none;
            border-bottom-left-radius: 12px;
            border-bottom-right-radius: 12px;
        }

        .grid-view {
            width: 100%;
            border-collapse: collapse;
            margin-top: 25px;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.08);
        }

        .grid-view th, .grid-view td {
            padding: 15px;
            border-bottom: 1px solid #dee2e6;
            text-align: left;
        }

        .grid-view th {
            background-color: #ff8c00;
            color: white;
            font-weight: 600;
            text-transform: uppercase;
        }

        .grid-view tr:nth-child(even) {
            background-color: #f8f9fa;
        }

        .buy-button {
    background-color: #ff8c00;
    color: white;
    border: none;
    padding: 12px 20px; /* Increased padding for larger size */
    border-radius: 6px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    width: 180px; /* Increased width */
    font-size: 16px; /* Increased font size */
    display: block; /* Center the button */
    margin: 20px auto; /* Centers horizontally */
    text-align: center;
}


        .buy-button:hover {
             transition: background-color 0.3s ease;
        }

        .grid-view img {
            max-width: 100px;
            height: auto;
            display: block;
            margin: 0 auto;
            border-radius: 4px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
          <div class="navbar-container">
            <asp:Image ID="Image2" runat="server" Width="200px" ImageUrl="~/faunaa.jpg.png" />
            <div class="navbar">
                <a href="home.aspx">Home</a>
                <a href="AboutUs.aspx">About Us</a>
                <div class="dropdown">
                    <a class="dropdown-toggle">Pages</a>
                    <div class="dropdown-menu">
                    <a href="BuyPets.aspx">Buy Pets</a>
       <a href="Donation.aspx">Donation</a>
       <a href="Adoption.aspx">Adoption</a>
       <a href="Food.aspx">Paw Mart</a>
       <a href="GroomingTraining.aspx">Grooming & Training</a>
       <a href="VeterinaryServices.aspx">VeterinaryServices</a>
        <a href="PetCareTips.aspx">Pet HealthTips</a>
       <a href="NewsAndArticles.aspx">News & Articles</a>
       <a href="AnimalDeathInfo.aspx">AnimalDeath Information</a>
       <a href="ApplicationStatus.aspx">ApplicationStatus</a>
       <a href="Logout.aspx">Logout</a> 
                    </div>
                </div>
             
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Cart.aspx" CssClass="go-to-cart">Go to Cart</asp:HyperLink>
            </div>
        </div>
        <div class="container">
            <h1>🐾 Paw Mart</h1>
            <div class="tab">
                <button type="button" class="tablinks" onclick="openTab(event, 'Food')">Food</button>
                <button type="button" class="tablinks" onclick="openTab(event, 'Medicine')">Medicine</button>
                <button type="button" class="tablinks" onclick="openTab(event, 'Clothes')">Clothes</button>
                <button type="button" class="tablinks" onclick="openTab(event, 'Toys')">Toys</button>
            </div>

            <!-- Food Tab -->
            <div id="Food" class="tabcontent">
                <h2>Food</h2>
                <asp:GridView ID="gvFood" runat="server" CssClass="grid-view" AutoGenerateColumns="false" OnRowCommand="gvFood_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Name" />
                        <asp:BoundField DataField="Description" HeaderText="Description" />
                        <asp:BoundField DataField="Price" HeaderText="Price" />
                        <asp:ImageField DataImageUrlField="Image" HeaderText="Image" DataImageUrlFormatString="~/uploads/{0}" ControlStyle-Width="100" />
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:Button ID="btnBuy" runat="server" Text="Buy" CssClass="buy-button" CommandName="Buy" CommandArgument='<%# Eval("Id") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

            <!-- Medicine Tab -->
            <div id="Medicine" class="tabcontent">
                <h2>Medicine</h2>
                <asp:GridView ID="gvMedicine" runat="server" CssClass="grid-view" AutoGenerateColumns="false" OnRowCommand="gvMedicine_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Name" />
                        <asp:BoundField DataField="Description" HeaderText="Description" />
                        <asp:BoundField DataField="Price" HeaderText="Price" />
                        <asp:ImageField DataImageUrlField="Image" HeaderText="Image" DataImageUrlFormatString="~/uploads/{0}" ControlStyle-Width="100" />
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:Button ID="btnBuy" runat="server" Text="Buy" CssClass="buy-button" CommandName="Buy" CommandArgument='<%# Eval("Id") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

            <!-- Clothes Tab -->
            <div id="Clothes" class="tabcontent">
                <h2>Clothes</h2>
                <asp:GridView ID="gvClothes" runat="server" CssClass="grid-view" AutoGenerateColumns="false" OnRowCommand="gvClothes_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Name" />
                        <asp:BoundField DataField="Description" HeaderText="Description" />
                        <asp:BoundField DataField="Price" HeaderText="Price" />
                        <asp:ImageField DataImageUrlField="Image" HeaderText="Image" DataImageUrlFormatString="~/uploads/{0}" ControlStyle-Width="100" />
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:Button ID="btnBuy" runat="server" Text="Buy" CssClass="buy-button" CommandName="Buy" CommandArgument='<%# Eval("Id") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

            <!-- Toys Tab -->
            <div id="Toys" class="tabcontent">
                <h2>Toys</h2>
                <asp:GridView ID="gvToys" runat="server" CssClass="grid-view" AutoGenerateColumns="false" OnRowCommand="gvToys_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Name" />
                        <asp:BoundField DataField="Description" HeaderText="Description" />
                        <asp:BoundField DataField="Price" HeaderText="Price" />
                        <asp:ImageField DataImageUrlField="Image" HeaderText="Image" DataImageUrlFormatString="~/uploads/{0}" ControlStyle-Width="100" />
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:Button ID="btnBuy" runat="server" Text="Buy" CssClass="buy-button" CommandName="Buy" CommandArgument='<%# Eval("Id") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>

        <script>
            function openTab(evt, tabName) {
                var i, tabcontent, tablinks;
                tabcontent = document.getElementsByClassName("tabcontent");
                for (i = 0; i < tabcontent.length; i++) {
                    tabcontent[i].style.display = "none";
                }
                tablinks = document.getElementsByClassName("tablinks");
                for (i = 0; i < tablinks.length; i++) {
                    tablinks[i].className = tablinks[i].className.replace(" active", "");
                }
                document.getElementById(tabName).style.display = "block";
                evt.currentTarget.className += " active";
            }

            // Open the default tab
            document.getElementById("Food").style.display = "block";
            document.getElementsByClassName("tablinks")[0].className += " active";
        </script>
    </form>
</body>
</html>