<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeAdmin.aspx.cs" Inherits="OCWMS.EmployeeAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Admin</title>
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
        .auto-style1 {
            width: 59%;
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
<div>
    <form id="form1" runat="server" class="auto-style1">
                                <nav>
                <ul>
                    <li><a href="HomeAd.aspx">Home</a></li>
</ul></nav>

        <h2>Search Employee</h2>
        Search Emp ID Or Emp Name:<br />
&nbsp;<asp:TextBox ID="txtSearch" runat="server" CssClass="auto-style3" placeholder="Enter Name or ID" Width="439px"></asp:TextBox>
        &nbsp;&nbsp;<asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="button" OnClick="btnSearch_Click" />
        &nbsp;<asp:Button ID="btnShowAll" runat="server" Text="Show All" CssClass="button" OnClick="btnShowAll_Click" />
        <br /><br />
        <asp:GridView ID="gvEmployees" runat="server" AutoGenerateColumns="false" CssClass="auto-style2" OnSelectedIndexChanged="gvEmployees_SelectedIndexChanged" Width="882px">
            <Columns>
                <asp:BoundField DataField="EmpID" HeaderText="Emp ID" />
                <asp:BoundField DataField="EmpName" HeaderText=" Emp Name" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" />
                <asp:BoundField DataField="DOB" HeaderText="DOB" />
                <asp:BoundField DataField="Age" HeaderText="Age" />
                <asp:BoundField DataField="PhoneNumber" HeaderText="Phone" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="Department" HeaderText="Department" />
                <asp:BoundField DataField="Position" HeaderText="Position" />
                <asp:BoundField DataField="Salary" HeaderText="Salary" />
            </Columns>
        </asp:GridView>
    </form>
</div>
</body>
</html>
