<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllowanceAdmin.aspx.cs" Inherits="OCWMS.AllowanceAdmin" %>
<!DOCTYPE html>
<html>
<head>
    <title>Allowance Management</title>
    <style>
/* 🌟 Gradient Background */
/* 🌟 Gradient Background */
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
    <form id="form1" runat="server" class="auto-style1">
        <div>
                        <nav>
                <ul>
                    <li><a href="HomeAd.aspx">Home</a></li>
</ul></nav>
            <h2>Allowance Management</h2>
                        
            Search Employee:
&nbsp;<asp:TextBox ID="txtSearch" runat="server" CssClass="auto-style3" Width="470px" Height="30px"></asp:TextBox>
            &nbsp;&nbsp;
            <asp:Button ID="btnSearch" runat="server"  CssClass="button" Text="Search" OnClick="btnSearch_Click" Height="39px" Width="167px" />
            <br />
            <br/>


            Employee ID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtEmpID" runat="server" Required="true" Height="36px" Width="277px"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="txtEmpID" ErrorMessage="Employee ID is required*" runat="server" ForeColor="Red" />
            <br />
            <br/>
            
            Employee Name:&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtEmpName" runat="server" Required="true" Height="35px" Width="272px"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="txtEmpName" ErrorMessage="Employee  Full Name is required*" runat="server" ForeColor="Red" />
            <br />
            <br />
            <br/>
            
            Allowance Type:&nbsp;&nbsp;&nbsp;&nbsp; <asp:DropDownList ID="ddlAllowanceType" runat="server" Height="37px" Width="146px">
                <asp:ListItem Text="Select" Value=""></asp:ListItem>
                <asp:ListItem Text="Transport" Value="Transport"></asp:ListItem>
                <asp:ListItem Text="Housing" Value="Housing"></asp:ListItem>
                <asp:ListItem Text="Medical" Value="Medical"></asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:RequiredFieldValidator ControlToValidate="ddlAllowanceType" InitialValue="" ErrorMessage="Select Allowance Type*" runat="server" ForeColor="Red" />
            <br />
            <br/>
            
            Allowance Rate:&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtAllowanceRate" runat="server" Height="33px" Width="268px"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="txtAllowanceRate" ErrorMessage="Allowance Rate is required" runat="server" ForeColor="Red" />
            &nbsp;<asp:RegularExpressionValidator ControlToValidate="txtAllowanceRate" ValidationExpression="^\d+(\.\d{1,2})?$" ErrorMessage="Enter valid numeric value*" runat="server" ForeColor="Red" /><br />            <br />
            <br/>
            
            Basic Salary:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtBasicSalary" runat="server" Height="35px" Width="264px"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="txtBasicSalary" ErrorMessage="Basic Salary is required" runat="server" ForeColor="Red" />
            &nbsp;<asp:RegularExpressionValidator ControlToValidate="txtBasicSalary" ValidationExpression="^\d+(\.\d{1,2})?$" ErrorMessage="Enter valid numeric value*" runat="server" ForeColor="Red" /><br />            <br />
            <br/>
            
            Allowance Amount:&nbsp; <asp:TextBox ID="txtAllowanceAmount" runat="server" ReadOnly="true" Height="32px" Width="170px"></asp:TextBox>
            <br />
            <br/>
            
            Status:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:DropDownList ID="ddlStatus" runat="server" Width="124px" Height="32px">
                <asp:ListItem Text="Select" Value=""></asp:ListItem>
                <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
                <asp:ListItem Text="Inactive" Value="Inactive"></asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:RequiredFieldValidator ControlToValidate="ddlStatus" InitialValue="" ErrorMessage="Select Status*" runat="server" ForeColor="Red" /><br/>
            
            <asp:Button ID="btnCalculate" runat="server" Text="Calculate Allowance" CssClass="button" OnClick="btnCalculate_Click" Width="201px" /><br/>
            <asp:Button ID="btnInsert" runat="server" Text="Insert" CssClass="button" OnClick="btnInsert_Click" Width="113px" />
            &nbsp;<asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="button" OnClick="btnUpdate_Click" Width="134px" />
            &nbsp;<asp:Button ID="btnDelete" runat="server" Text="Delete"  CssClass="button" OnClick="btnDelete_Click" Width="132px" />
            &nbsp;<asp:Button ID="btnViewAll" runat="server" Text="View All" CssClass="button" OnClick="btnViewAll_Click" Width="135px" />
            <br />
            <br/>
            
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:BoundField DataField="EmpID" HeaderText="Employee ID" />
                    <asp:BoundField DataField="EmpName" HeaderText="Employee Name" />
                    <asp:BoundField DataField="AllowanceType" HeaderText="Allowance Type" />
                    <asp:BoundField DataField="AllowanceRate" HeaderText="Allowance Rate" />
                    <asp:BoundField DataField="BasicSalary" HeaderText="Basic Salary" />
                    <asp:BoundField DataField="AllowanceAmount" HeaderText="Allowance Amount" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>