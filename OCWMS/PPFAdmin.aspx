<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PPFAdmin.aspx.cs" Inherits="OCWMS.PPFAdmin" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>PPF Management - Admin</title>
    <style>
body {
    font-family: 'Poppins', sans-serif;
    background: linear-gradient(120deg, 
        #D3E0EA, #BFD7EA, #C9CBA3, #F2D7B6, #D6E6F2, #F3D1F4, #E4C1F9, #D0BDF4,
        #B8C0FF, #A3D8F4, #C3E2DD, #D6F8B8, #C2F0FC, #A9DEF9, #D4A5A5, #F7C5CC, 
        #F6D6AD, #FFBCBC, #F7B267, #A8D8EA, #B1B2FF, #B4D4FF, #D9D7F1, #FFC3A0, 
        #FEC8D8, #D5AAFF, #A9A9F5, #C2E0F9, #E6A4B4, #B5B5F2, #A3C9A8);
    background-size: 400% 400%;
    animation: gradientBG 10s infinite alternate;
    text-align: center;
    padding: 20px;
}

/* 🌐 Keyframe Animation */
@keyframes gradientBG {
    0% { background-position: 0% 50%; }
    100% { background-position: 100% 50%; }
}

/* 📌 Form Glassmorphic Effect */
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

form:hover {
    transform: scale(1.02);
}

/* 🎯 Header Style */
h2 {
    font-size: 28px;
    font-weight: bold;
    color: black;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
    text-align: center;
}

/* ✅ Label Styles */
label {
    display: block;
    font-size: 16px;
    font-weight: 500;
    margin-bottom: 5px;
    color: black;
    text-align: left;
}

/* 📌 Input Fields with Textbox Style */
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

asp\:TextBox {
    margin-bottom: 10px;
    display: block;
}

/* 🚀 Buttons */
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

/* 📊 Stylish GridView */
.gridview {
    margin-top: 20px;
    width: 100%;
    border-collapse: collapse;
    background: rgba(255, 255, 255, 0.2);
    backdrop-filter: blur(8px);
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.3);
}

.gridview th {
    background: rgba(255, 87, 51, 0.8);
    color: white;
    padding: 12px;
    font-size: 16px;
}

.gridview td {
    padding: 10px;
    color: white;
    border-bottom: 1px solid rgba(255, 255, 255, 0.2);
}

.gridview tr:nth-child(even) {
    background: rgba(255, 255, 255, 0.1);
}

.gridview tr:hover {
    background: rgba(255, 255, 255, 0.3);
    cursor: pointer;
    transform: scale(1.01);
}

/* 📱 Responsive Design */
        @media screen and (max-width: 768px) {
            form {
                width: 90%;
            }

            .textbox {
                width: 100%;
            }
        }

        </style>
</head>
<body>
    <form id="form1" runat="server" class="auto-style2">
        <div class="auto-style5">
                                                        <nav>
                <ul>
                    <li><a href="HomeAd.aspx">Home</a></li>
</ul></nav>

            <h2>PPF Catelog</h2>

            <label>Search by Emp ID or Name:</label>
            <asp:TextBox ID="txtSearch" runat="server"  CssClass="auto-style3" Width="500px" Height="30px"></asp:TextBox>
            &nbsp; <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="button" OnClick="btnSearch_Click" Height="37px" Width="173px" />
            <br /><br />

            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />

            <label>Employee ID:</label>
            <asp:TextBox ID="txtEmpID" runat="server" Height="30px" Width="745px"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ControlToValidate="txtEmpID" ErrorMessage="Employee ID is required!" CssClass="error" runat="server" ForeColor="Red" />
            <br />

            <label>Employee Name:</label>
            <asp:TextBox ID="txtEmpName" runat="server" Height="30px" Width="745px"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ControlToValidate="txtEmpName" ErrorMessage="Employee Name is required!" CssClass="error" runat="server" ForeColor="Red" />
            <br />

            <label>Basic Salary:</label>
            <asp:TextBox ID="txtBasicSalary" runat="server" Height="30px" Width="745px"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ControlToValidate="txtBasicSalary" ErrorMessage="Basic Salary is required!" CssClass="error" runat="server" ForeColor="Red" />
            &nbsp;<asp:RegularExpressionValidator ControlToValidate="txtBasicSalary" ValidationExpression="^\d+(\.\d{1,2})?$" ErrorMessage="Enter a valid salary (Numbers only)!" CssClass="error" runat="server" ForeColor="Red" />
            <br />

            <label>Age:</label>
            <asp:TextBox ID="txtAge" runat="server" Height="30px" Width="745px"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ControlToValidate="txtAge" ErrorMessage="Age is required!" CssClass="error" runat="server" ForeColor="Red" />
            &nbsp;<asp:RegularExpressionValidator ControlToValidate="txtAge" ValidationExpression="^\d+$" ErrorMessage="Enter a valid age (Numbers only)!" CssClass="error" runat="server" ForeColor="Red" />
            <br />

            <label>Email:</label>
            <asp:TextBox ID="txtEmail" runat="server" Height="30px" Width="745px"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ControlToValidate="txtEmail" ErrorMessage="Email is required!" CssClass="error" runat="server" ForeColor="Red" />
            &nbsp;<asp:RegularExpressionValidator ControlToValidate="txtEmail" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" ErrorMessage="Enter a valid email address!" CssClass="error" runat="server" ForeColor="Red" />
            <br />

            <label>Account Number:</label>
            <asp:TextBox ID="txtAccountNumber" runat="server" Height="30px" Width="745px"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ControlToValidate="txtAccountNumber" ErrorMessage="Account Number is required!" CssClass="error" runat="server" ForeColor="Red" > </asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ControlToValidate="txtAccountNumber" ValidationExpression="^\d+$" ErrorMessage="Enter a valid Account Number (Numbers only)!" CssClass="error" runat="server" ForeColor="Red" />
            <br />


            <label>Current Balance:</label>
            <asp:TextBox ID="txtCurrentBalance" runat="server" Height="30px" Width="745px"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ControlToValidate="txtCurrentBalance" ErrorMessage="Current Balance is required!" CssClass="error" runat="server" ForeColor="Red" />
            &nbsp;<asp:RegularExpressionValidator ControlToValidate="txtCurrentBalance" ValidationExpression="^\d+(\.\d{1,2})?$" ErrorMessage="Enter a valid balance!" CssClass="error" runat="server" ForeColor="Red" />
            <br />
            <br />

            <asp:Button ID="btnInsert" runat="server" Text="Insert"  CssClass="button" OnClick="btnInsert_Click" Width="116px" Height="44px" />
            &nbsp;<asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="button"  OnClick="btnUpdate_Click" Height="44px" Width="115px" />
            &nbsp;<asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="button"  OnClick="btnDelete_Click" Height="43px" Width="133px" />
            &nbsp;<asp:Button ID="btnViewAll" runat="server" Text="View All" CssClass="button" OnClick="btnViewAll_Click" Height="43px" Width="139px" />
            <br />
            <br />
        </div>

               <asp:GridView ID="gvPPF" runat="server" AutoGenerateColumns="true"></asp:GridView>
    </form>
</body>
</html>


