<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EPFAdmin.aspx.cs" Inherits="OCWMS.EPFAdmin" %>
<!DOCTYPE html>
<html>
<head>
    <title>EPF Admin Management</title>
    <style>
        /* General Page Styling */
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

form:hover {
    transform: scale(1.02);
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

        .auto-style1 {
            width: 68%;
        }
        .auto-style2 {
            width: 78%;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server" class="auto-style2">
                                <nav>
                <ul>
                    <li><a href="HomeAd.aspx">Home</a></li>
</ul></nav>

        <h2>EPF Catelog</h2>
        <div class="auto-style5">
        <label>Search Employee ID or Name:</label>
        <asp:TextBox ID="txtSearch" runat="server"  CssClass="auto-style3" Width="592px" Height="36px"></asp:TextBox>
        &nbsp; <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" Width="202px" CssClass="button" Height="44px" />
        <br />
        <br />
            </div>
        
        <div class="auto-style4">
            <label>&nbsp;Employee ID:&nbsp;&nbsp;&nbsp; &nbsp; </label>
            <asp:TextBox ID="txtEmpID" runat="server" Width="833px" Height="33px"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="rfvEmpID" ControlToValidate="txtEmpID" runat="server" ErrorMessage="Employee ID is required." ForeColor="Red" />
            <br />
            <br />
            </div>
             <div class="form-group">
            <label>
            Employee Name:&nbsp;&nbsp;</label><asp:TextBox ID="txtEmpName" runat="server" Width="833px" CssClass="auto-style1" Height="33px"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ControlToValidate="txtEmpName" runat="server" ErrorMessage="Required" ForeColor="Red" />
</div>
                <div class="form-group">

        <label>Basic Salary:</label>
        <asp:TextBox ID="txtBasicSalary" runat="server" Width="833px" Height="33px"></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ControlToValidate="txtBasicSalary" runat="server" ErrorMessage="Required" ForeColor="Red" />
</div>
        <div class="form-group">

            <br />
            <label> Select Position:</label><asp:DropDownList ID="ddlPosition" runat="server" CssClass="dropdown" Height="26px" Width="833px">
    <asp:ListItem Text="Select Position" Value="" Selected="True" />
    <asp:ListItem Text="Professor" Value="Professor" />
    <asp:ListItem Text="Associate Professor" Value="Associate Professor" />
    <asp:ListItem Text="Assistant Professor" Value="Assistant Professor" />
    <asp:ListItem Text="Lab Assistant" Value="Lab Assistant" />
    <asp:ListItem Text="Administrative Officer" Value="Administrative Officer" />
    <asp:ListItem Text="Clerk" Value="Clerk" />
    <asp:ListItem Text="Peon" Value="Peon" />
</asp:DropDownList>
        <br />
     <asp:RequiredFieldValidator ControlToValidate="ddlPosition" InitialValue="" ErrorMessage="Please select a Position." ForeColor="Red" runat="server" />
</div>
                <div class="form-group">

        <label>Age:</label>
        <asp:TextBox ID="txtAge" runat="server" Width="833px" Height="33px"></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ID="rfvAge" ControlToValidate="txtAge" runat="server" ErrorMessage="Age is required." ForeColor="Red" />
        &nbsp;<asp:RangeValidator ID="rvAge" ControlToValidate="txtAge" runat="server" MinimumValue="18" MaximumValue="70"
        Type="Integer" ErrorMessage="Age must be between 18 and 70." ForeColor="Red" />
</div>
                <div class="form-group">

        <label>Email:</label>
        <asp:TextBox ID="txtEmail" runat="server" Width="833px" Height="33px"></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ID="rfvEmail" ControlToValidate="txtEmail" runat="server" ErrorMessage="Email is required." ForeColor="Red" />
        &nbsp;<asp:RegularExpressionValidator ID="revEmail" ControlToValidate="txtEmail" runat="server" 
        ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" ErrorMessage="Enter a valid email address." ForeColor="Red" />
</div>
                <div class="form-group">

        <label>Account Number:</label>
        <asp:TextBox ID="txtAccountNumber" runat="server" Width="833px" Height="33px"></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ID="rfvAccountNumber" ControlToValidate="txtAccountNumber" runat="server" ErrorMessage="Account Number is required." ForeColor="Red" />
        &nbsp;<asp:RegularExpressionValidator ID="revAccountNumber" ControlToValidate="txtAccountNumber" runat="server"
        ValidationExpression="^\d+$" ErrorMessage="Account Number must be numeric." ForeColor="Red" />
</div>
       

                <div class="form-group">


        <label>Date of Joining:</label>
        <asp:TextBox ID="txtDateOfJoining" runat="server" TextMode="Date" Width="833px" Height="33px"></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ID="rfvDateOfJoining" ControlToValidate="txtDateOfJoining" runat="server" ErrorMessage="Date of Joining is required." ForeColor="Red" />
</div>
                <div class="form-group">


        <label>UAN Number:</label>
        <asp:TextBox ID="txtUANNumber" runat="server" CssClass="auto-style3" Width="833px" Height="33px"></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ID="rfvUANNumber" ControlToValidate="txtUANNumber" runat="server" ErrorMessage="UAN Number is required." ForeColor="Red" />
        &nbsp;<asp:RegularExpressionValidator ID="revUANNumber" ControlToValidate="txtUANNumber" runat="server"
         ValidationExpression="^\d{12}$" ErrorMessage="UAN Number must be 12 digits." ForeColor="Red" />
</div>
                <div class="form-group">

        <label>Current Balance:</label>
        <asp:TextBox ID="txtCurrentBalance" runat="server" Width="833px" Height="33px"></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ID="rfvCurrentBalance" ControlToValidate="txtCurrentBalance" runat="server" ErrorMessage="Current Balance is required." ForeColor="Red" />
        &nbsp;<asp:RegularExpressionValidator ID="revCurrentBalance" ControlToValidate="txtCurrentBalance" runat="server"
         ValidationExpression="^\d+(\.\d{1,2})?$" ErrorMessage="Enter a valid numeric balance." ForeColor="Red" />
</div>
        <br />

        <!-- Buttons -->
        <asp:Button ID="btnInsert" runat="server" Text="Insert" OnClick="btnInsert_Click" CssClass="button" Width="157px" />
        &nbsp;&nbsp; <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" CssClass="button" Width="154px"/>
        &nbsp;
        &nbsp;<asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" CssClass="button" Width="159px" />
        &nbsp;
        &nbsp;<asp:Button ID="btnView" runat="server" Text="View All" OnClick="btnView_Click" CssClass="button" Width="135px" />

        <br />

        <br />

        <!-- GridView -->
        <asp:GridView ID="gvEPF" runat="server" AutoGenerateColumns="true" OnSelectedIndexChanged="gvEPF_SelectedIndexChanged" Width="1129px"></asp:GridView>
    </form>
</body>
</html>
