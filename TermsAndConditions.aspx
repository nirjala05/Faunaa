<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TermsAndConditions.aspx.cs" Inherits="Faunaa.TermsAndConditions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Adoption Terms and Conditions</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Poppins', 'Segoe UI', sans-serif;
            background-image: url('pic3.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            background-attachment: fixed;
            background-position: center;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            margin-top: 30px;
            margin-bottom: 30px;
            border-top: 5px solid #FF6B35;
            max-width: 800px !important;
            width: 90%;
            margin-left: auto;
            margin-right: auto;
        }

        h2 {
            text-align: center;
            color: #FF6B35;
            margin-bottom: 35px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 2px;
            position: relative;
            padding-bottom: 15px;
        }

        h2:after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 60px;
            height: 4px;
            background-color: #FF6B35;
            border-radius: 2px;
        }

        .terms-content {
            background-color: #fff;
            padding: 20px;
            border-radius: 12px;
            border: 2px solid #f0f0f0;
            margin-bottom: 25px;
            font-size: 16px;
            line-height: 1.6;
            color: #444;
        }

        .terms-content::-webkit-scrollbar {
            width: 8px;
        }

        .terms-content::-webkit-scrollbar-track {
            background: #f1f1f1;
            border-radius: 4px;
        }

        .terms-content::-webkit-scrollbar-thumb {
            background: #FF6B35;
            border-radius: 4px;
        }

        .terms-content::-webkit-scrollbar-thumb:hover {
            background: #ff5722;
        }

        .form-check {
            margin: 20px 0;
        }

        .form-check-input {
            width: 20px;
            height: 20px;
            margin-right: 10px;
            cursor: pointer;
        }

        .form-check-input:checked {
            background-color: #FF6B35;
            border-color: #FF6B35;
        }

        .form-check-label {
            font-size: 16px;
            font-weight: 500;
            color: #444;
            cursor: pointer;
            padding-left: 10px;
        }

        .btn-primary {
            background-color: #FF6B35;
            border: none;
            padding: 15px 40px;
            border-radius: 12px;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
            text-transform: uppercase;
            font-size: 16px;
            width: 100%;
            margin-top: 20px;
        }

        .btn-primary:hover {
            background-color: #ff5722;
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(255, 107, 53, 0.3);
        }

        .btn-primary:active {
            transform: translateY(0);
        }

        /* Terms content specific styles */
        .terms-content h3 {
            color: #FF6B35;
            margin-bottom: 15px;
            font-size: 20px;
            font-weight: 600;
        }

        .terms-content p {
            margin-bottom: 15px;
        }

        .terms-content ul {
            padding-left: 20px;
            margin-bottom: 15px;
        }

        .terms-content li {
            margin-bottom: 10px;
        }

        /* Animation */
        .container {
            animation: fadeIn 0.5s ease-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Media Queries */
        @media (max-width: 768px) {
            .container {
                width: 95%;
                padding: 20px;
            }

            h2 {
                font-size: 24px;
            }

            .terms-content {
                padding: 15px;
            }

            .btn-primary {
                padding: 12px 30px;
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <h2>Pet Adoption Terms and Conditions</h2>
            <div class="terms-content">
                <h3>1. Adoption Requirements</h3>
                <p>By agreeing to adopt a pet from our organization, you confirm that:</p>
                <ul>
                    <li>You are at least 18 years of age</li>
                    <li>You have the consent of all household members</li>
                    <li>You are financially able to provide for the pet's needs</li>
                    <li>You have adequate time to spend with your new pet</li>
                </ul>

                <h3>2. Pet Care Responsibilities</h3>
                <ul>
                    <li>Provide proper nutrition and fresh water daily</li>
                    <li>Ensure regular veterinary check-ups and vaccinations</li>
                    <li>Maintain proper identification and registration</li>
                    <li>Provide a safe and loving environment</li>
                </ul>

                <h3>3. Return Policy</h3>
                <p>If for any reason you cannot keep the pet, you must return it to our organization rather than giving it away or selling it.</p>

                <h3>4. Follow-up Visits</h3>
                <p>You agree to allow our organization to conduct follow-up visits to ensure the pet's well-being.</p>
            </div>

            <div class="form-check">
                <asp:CheckBox ID="chkAcceptTerms" runat="server" CssClass="form-check-input" />
                <asp:Label ID="lblAcceptTerms" runat="server" CssClass="form-check-label" 
                    Text="I have read and accept the terms and conditions" AssociatedControlID="chkAcceptTerms">
                </asp:Label>
            </div>

            <div class="d-grid">
                <asp:Button ID="btnProceed" runat="server" Text="Proceed to Adoption Form" 
                    CssClass="btn btn-primary" OnClick="btnProceed_Click" />
            </div><br />

            
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>