<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PensionAdmin.aspx.cs" Inherits="OCWMS.PensionAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
/* 🌟 Gradient Animation */
@keyframes gradientBG {
    0% { background-position: 0% 50%; }
    100% { background-position: 100% 50%; }
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

/* ✨ Glassmorphic Card */
form {
    width: 60%;
    padding: 30px;
    background: rgba(255, 255, 255, 0.2);
    backdrop-filter: blur(10px);
    border-radius: 15px;
    box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.2);
    transition: transform 0.3s ease-in-out;
    margin: auto;
}

form:hover {
    transform: scale(1.02);
}

/* 🎨 Header */
h2 {
    font-size: 26px;
    font-weight: bold;
    color: black;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
}

/* 🌐 Input Fields */
.textbox {
    width: 80%;
    padding: 12px;
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

/* 🚀 Buttons */
.button {
    padding: 12px 20px;
    border: none;
    border-radius: 8px;
    font-size: 16px;
    cursor: pointer;
    transition: all 0.3s ease-in-out;
    background: linear-gradient(45deg, #ff5733, #ff8d1a);
    color: white;
    box-shadow: 3px 3px 10px rgba(255, 87, 51, 0.4);
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
        .auto-style2 {
            margin-top: 20px;
            border-collapse: collapse;
            backdrop-filter: blur(8px);
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.3);
        }
        .auto-style3 {
            border-radius: 8px;
            font-size: 16px;
            outline-width: medium;
            outline-style: none;
            outline-color: invert;
            color: black;
            box-shadow: inset 2px 2px 5px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease-in-out;
            border-style: none;
            border-color: inherit;
            border-width: medium;
            padding: 12px;
        }   

        .auto-style4 {
            width: 67%;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server" class="auto-style4">
        <div>
                                                                        <nav>
                <ul>
                    <li><a href="HomeAd.aspx">Home</a></li>
</ul></nav>
<h2>
    Pension Catelog
</h2>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label Text="Search Employee ID or Name:" runat="server" />
<asp:TextBox ID="txtSearch" CssClass="auto-style3" runat="server" />
&nbsp;<asp:Button ID="btnSearch" Text="Search" CssClass="button" OnClick="btnSearch_Click" runat="server" />

                        <asp:GridView ID="GridView1" AutoGenerateColumns="False" CssClass="auto-style2" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Height="100px" Width="995px">
                <Columns>
                    <asp:BoundField DataField="EmpID" HeaderText="Employee ID" />
                    <asp:BoundField DataField="EmpName" HeaderText="Employee Name" />
                    <asp:BoundField DataField="BankName" HeaderText="Bank Name" />
                    <asp:BoundField DataField="AccountNumber" HeaderText="Account Number" />
                    <asp:BoundField DataField="AccountStatus" HeaderText="Account Status" />
                    <asp:BoundField DataField="TransactionType" HeaderText="Transaction Type" />
                    <asp:BoundField DataField="NomineeName" HeaderText="Nominee Name" />
                </Columns>
            </asp:GridView>

        </div>
    </form>
</body>
</html>
