﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EPFEmp.aspx.cs" Inherits="OCWMS.EPFEmp" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <title>Employee EPF Request</title>
    <style>
/* General Page Styling */
       body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(120deg, #D3E0EA, #BFD7EA, #C9CBA3, #F2D7B6, #D6E6F2, #F3D1F4, #E4C1F9, #D0BDF4,
                #B8C0FF, #A3D8F4, #C3E2DD, #D6F8B8, #C2F0FC, #A9DEF9, #D4A5A5, #F7C5CC, #F6D6AD, #FFBCBC, #F7B267, #A8D8EA,
                #B1B2FF, #B4D4FF, #D9D7F1, #FFC3A0, #FEC8D8, #D5AAFF, #A9A9F5, #C2E0F9, #E6A4B4, #B5B5F2, #A3C9A8);
            background-size: 400% 400%;
            animation: gradientBG 10s infinite alternate;
            text-align: center;
            padding: 20px;
        }

        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            100% { background-position: 100% 50%; }
        }

        form {
            width: 60%;
            padding: 30px;
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease-in-out;
            margin: auto;
            text-align: left;
        }

        form:hover {
            transform: scale(1.02);
        }

        h2 {
            font-size: 28px;
            font-weight: bold;
            color: black;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
            text-align: center;
        }

        label {
            display: block;
            font-size: 16px;
            font-weight: 500;
            margin-bottom: 5px;
            color: black;
            text-align: left;
        }

        .textbox {
            width: 80%;
            padding: 12px;
            margin-bottom: 15px;
            border-radius: 8px;
            border: none;
            font-size: 16px;
            outline: none;
            background: rgba(255, 255, 255, 0.2);
            color: black;
            box-shadow: inset 2px 2px 5px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease-in-out;
        }

        .textbox::placeholder {
            color: rgba(0, 0, 0, 0.7);
        }

        .textbox:focus {
            background: rgba(255, 255, 255, 0.4);
            box-shadow: 0px 0px 10px rgba(255, 255, 255, 0.5);
        }

        .button {
            padding: 12px 20px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            background: linear-gradient(45deg, #ff5733, #ff8d1a);
            color: white;
            box-shadow: 3px 3px 10px rgba(255, 87, 51, 0.4);
            transition: all 0.3s ease-in-out;
            margin-top: 10px;
        }

        .button:hover {
            background: linear-gradient(45deg, #e74c3c, #ff5733);
            box-shadow: 0px 5px 15px rgba(255, 87, 51, 0.6);
            transform: translateY(-2px);
        }
                    nav {
            background: #2C3E50;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
        }

        nav ul {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
        }

        nav ul li {
            position: relative;
        }

        nav ul li a {
            display: block;
            color: #FFD700;
            text-align: center;
            padding: 16px 22px;
            text-decoration: none;
            font-size: 18px;
            font-weight: 600;
            transition: all 0.3s ease-in-out;
        }

        nav ul li a:hover {
            background: #E74C3C;
            color: white;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
                                        <nav>
                <ul>
                    <li><a href="HomeEmp.aspx">Home</a></li>
</ul></nav>

        <h2>Employee Provident Fund (EPF) Request</h2>

        <div class="search-container">
        <label>Search by Employee ID or Name:</label><asp:TextBox ID="txtSearch" runat="server" Width="600px" Height="30px"></asp:TextBox>
        &nbsp; <asp:Button ID="btnSearch" runat="server" CssClass="button" Text="Search" OnClick="btnSearch_Click" Height="42px" Width="170px" />
            </div>
        <br /><br />

        <label>Employee ID:</label>
        <asp:TextBox ID="txtEmpID" runat="server" Height="30px" Width="600px" ></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ControlToValidate="txtEmpID" runat="server" ErrorMessage="Required" ForeColor="Red" />

        <br />

        <label>Employee Name:</label>
        <asp:TextBox ID="txtEmpName" runat="server" Height="30px" Width="600px" ></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ControlToValidate="txtEmpName" runat="server" ErrorMessage="Required" ForeColor="Red" />

        <br />

        <label>UAN Number:</label>
        <asp:TextBox ID="txtUAN" runat="server" Height="30px" Width="600px"></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ControlToValidate="txtUAN" runat="server" ErrorMessage="Required" ForeColor="Red" />
        &nbsp;<asp:RegularExpressionValidator ControlToValidate="txtUAN" runat="server" ValidationExpression="^\d+$" ErrorMessage="Only Numbers Allowed" ForeColor="Red" />

        <br />
                <label>Current Balance:</label>
        <asp:TextBox ID="txtBalance" runat="server" Height="30px" Width="600px"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnFetchBalance" runat="server" CssClass="button" Text="Fetch Balance" OnClick="btnFetchBalance_Click" />


        <label>Requested Amount:</label>
        <asp:TextBox ID="txtAmount" runat="server" Height="30px" Width="600px"></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ControlToValidate="txtAmount" runat="server" ErrorMessage="Required" ForeColor="Red" />
        <br />
        <asp:RegularExpressionValidator ControlToValidate="txtAmount" runat="server" ValidationExpression="^\d+$" ErrorMessage="Only Numbers Allowed" ForeColor="Red" />

        <br />

        <label>Request Date:</label>
        <asp:TextBox ID="txtRequestDate" runat="server" TextMode="Date" Height="30px" Width="600px"></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ControlToValidate="txtRequestDate" runat="server" ErrorMessage="Required" ForeColor="Red" />

        <br />


        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        <asp:Button ID="btnClaim" runat="server"  Text="Claim EPF" OnClick="btnClaim_Click"  CssClass="button"/>


        <br /><br />

    </form>
</body>
</html>
