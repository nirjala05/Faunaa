<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdoptionForm.aspx.cs" Inherits="Faunaa.AdoptionForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Adoption Application Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background: linear-gradient(to right,#d3d3d3,#ff9f43);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 20px 0;
        }

        .container {
            background-color: white;
            border-radius: 15px;
            padding: 30px;
            margin-top: 20px;
            margin-bottom: 20px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            max-width: 1000px;
        }

        h2 {
            color: #FF6B35;
            text-align: center;
            margin-bottom: 30px;
            font-weight: 600;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            font-weight: 500;
            color: #333;
            margin-bottom: 5px;
        }

        .form-control {
            border-radius: 8px;
            padding: 10px;
            border: 1px solid #ddd;
        }

        .form-control:focus {
            border-color: #FF6B35;
            box-shadow: 0 0 0 0.2rem rgba(255, 107, 53, 0.25);
        }

        .btn-submit {
            background-color: #FF6B35;
            color: white;
            padding: 12px 30px;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            width: 100%;
            margin-top: 20px;
            transition: background-color 0.3s ease;
        }

        .btn-submit:hover {
            background-color: #ff5722;
        }

        .pet-details {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 30px;
            border: 1px solid #dee2e6;
        }

        .pet-details h3 {
            color: #FF6B35;
            margin-bottom: 15px;
        }

        .validation-error {
            color: red;
            margin-top: 10px;
            display: block;
            text-align: center;
        }

        .radio-group {
            display: flex;
            gap: 20px;
            margin-top: 5px;
        }

        .required::after {
            content: " *";
            color: red;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Pet Adoption Application</h2>
            
            <asp:Label ID="lblPetDetails" runat="server" CssClass="pet-details"></asp:Label>
            <asp:Label ID="lblMessage" runat="server" CssClass="validation-error"></asp:Label>

            <div class="form-group">
                <asp:Label ID="Label1" runat="server" CssClass="form-label required">Full Name</asp:Label>
                <asp:TextBox ID="txtAdopterName" runat="server" CssClass="form-control" placeholder="Enter your full name"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="Label2" runat="server" CssClass="form-label required">Email</asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="Enter your email"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="Label3" runat="server" CssClass="form-label required">Address</asp:Label>
                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter your street address"></asp:TextBox>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <asp:Label ID="Label4" runat="server" CssClass="form-label required">City</asp:Label>
                        <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" placeholder="City"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <asp:Label ID="Label5" runat="server" CssClass="form-label required">State</asp:Label>
                        <asp:TextBox ID="txtState" runat="server" CssClass="form-control" placeholder="State"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <asp:Label ID="Label6" runat="server" CssClass="form-label required">Zip Code</asp:Label>
                        <asp:TextBox ID="txtZipCode" runat="server" CssClass="form-control" placeholder="Zip Code"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <asp:Label ID="Label7" runat="server" CssClass="form-label required">Primary Contact</asp:Label>
                        <asp:TextBox ID="txtPrimaryContact" runat="server" CssClass="form-control" placeholder="Primary phone number"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <asp:Label ID="Label8" runat="server" CssClass="form-label">Secondary Contact</asp:Label>
                        <asp:TextBox ID="txtSecondaryContact" runat="server" CssClass="form-control" placeholder="Secondary phone number (optional)"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <asp:Label ID="Label9" runat="server" CssClass="form-label">Names and Ages of Permanent Residents</asp:Label>
                <asp:TextBox ID="txtHomeResidents" runat="server" CssClass="form-control" TextMode="MultiLine" 
                    Rows="3" placeholder="List all permanent residents and their ages"></asp:TextBox>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <asp:Label ID="Label10" runat="server" CssClass="form-label required">Number of Adults</asp:Label>
                        <asp:TextBox ID="txtTotalAdults" runat="server" CssClass="form-control" TextMode="Number" 
                            placeholder="Number of adults"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <asp:Label ID="Label11" runat="server" CssClass="form-label required">Number of Children</asp:Label>
                        <asp:TextBox ID="txtTotalChildren" runat="server" CssClass="form-control" TextMode="Number" 
                            min="0" placeholder="Number of children"></asp:TextBox>
                    </div>
                </div>

            </div>
            <div class="form-group">
    <asp:Label ID="Label21" runat="server" CssClass="form-label required">Total Annual Income</asp:Label>
    <div class="input-group">
        <span class="input-group-text">₹</span>
        <asp:TextBox ID="txtAnnualIncome" runat="server" CssClass="form-control" 
            placeholder="Enter your annual income" TextMode="Number" min="0" 
            step="1000"></asp:TextBox>
    </div>
</div>

            <div class="form-group">
                <asp:Label ID="Label12" runat="server" CssClass="form-label required">Do you currently have any pets?</asp:Label>
                <div class="radio-group">
                    <asp:RadioButton ID="rbHasPetsYes" runat="server" GroupName="HasPets" Text="Yes" />
                    <asp:RadioButton ID="rbHasPetsNo" runat="server" GroupName="HasPets" Text="No" />
                </div>
            </div>

            <div class="form-group">
                <asp:Label ID="Label13" runat="server" CssClass="form-label">If yes, list current pets</asp:Label>
                <asp:TextBox ID="txtCurrentPets" runat="server" CssClass="form-control" TextMode="MultiLine" 
                    Rows="3" placeholder="List your current pets, including type, breed, and age"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="Label14" runat="server" CssClass="form-label">Previous Pet Experience</asp:Label>
                <asp:TextBox ID="txtPreviousPets" runat="server" CssClass="form-control" TextMode="MultiLine" 
                    Rows="3" placeholder="Describe your previous experience with pets"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="Label15" runat="server" CssClass="form-label required">Residence Type</asp:Label>
                <asp:DropDownList ID="ddlResidenceType" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Select Type" Value="" />
                    <asp:ListItem Text="House" Value="House" />
                    <asp:ListItem Text="Apartment" Value="Apartment" />
                    <asp:ListItem Text="Condo" Value="Condo" />
                    <asp:ListItem Text="Other" Value="Other" />
                </asp:DropDownList>
            </div>


            <div class="form-group">
                <asp:Label ID="Label16" runat="server" CssClass="form-label required">Do you own or rent?</asp:Label>
                <div class="radio-group">
                    <asp:RadioButton ID="rbOwn" runat="server" GroupName="Ownership" Text="Own" />
                    <asp:RadioButton ID="rbRent" runat="server" GroupName="Ownership" Text="Rent" />
                </div>
            </div>

            <div class="form-group">
                <asp:Label ID="Label17" runat="server" CssClass="form-label required">How long have you lived here? (years)</asp:Label>
                <asp:TextBox ID="txtResidenceYears" runat="server" CssClass="form-control" TextMode="Number" 
                    min="0" placeholder="Number of years"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="Label18" runat="server" CssClass="form-label required">Do you have a nearby veterinarian?</asp:Label>
                <div class="radio-group">
                    <asp:RadioButton ID="rbVetYes" runat="server" GroupName="HasVet" Text="Yes" />
                    <asp:RadioButton ID="rbVetNo" runat="server" GroupName="HasVet" Text="No" />
                </div>
            </div>

            <div class="form-group">
                <asp:Label ID="Label19" runat="server" CssClass="form-label required">Do you travel frequently?</asp:Label>
                <div class="radio-group">
                    <asp:RadioButton ID="rbTravelYes" runat="server" GroupName="Travel" Text="Yes" />
                    <asp:RadioButton ID="rbTravelNo" runat="server" GroupName="Travel" Text="No" />
                </div>
            </div>

            <asp:Button ID="btnSubmit" runat="server" Text="Submit Application" 
                CssClass="btn-submit" OnClick="btnSubmit_Click" />
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>