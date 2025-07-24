<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MediclaimAdmin.aspx.cs" Inherits="OCWMS.MediclaimAdmin" %>

<!DOCTYPE html>
<html>
<head>
    <title>Mediclaim Admin Panel</title>
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
        </style>
</head>
<body>
    <form id="form1" runat="server" class="auto-style1">
        <div>
                                            <nav>
                <ul>
                    <li><a href="HomeAd.aspx">Home</a></li>
</ul></nav>

            <h2>Mediclaim Catelog</h2>

                        Search Employee Name or Employee ID: 
            <br />
            <asp:TextBox ID="txtSearch" runat="server" CssClass="auto-style3" Width="536px" Height="33px"></asp:TextBox>
            &nbsp;&nbsp;<asp:Button ID="btnSearch" Text="Search" runat="server"  CssClass="button"  OnClick="btnSearch_Click" Height="41px" Width="206px" />
                                            <br />
                                            <asp:Label ID="lblMessage" runat="server"></asp:Label>
            <br />
            <br />

            Employee ID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtEmpID" runat="server" Height="30px" Width="572px"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ControlToValidate="txtEmpID" ErrorMessage="Employee ID is required" runat="server" ForeColor="Red" />
            <br />
            <br />

            Employee Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtEmpName" runat="server" Height="30px" Width="572px"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ControlToValidate="txtEmpName" ErrorMessage="Employee Name is required" runat="server" ForeColor="Red" />
            <br />
            <br />

            Employee Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtEmpAddress" runat="server" Height="30px" Width="572px"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="txtEmpAddress" ErrorMessage="Address is required" runat="server" ForeColor="Red" />
            <br />
            <br />

            Employee Salary:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtEmpSalary" runat="server" Height="30px" Width="572px"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ControlToValidate="txtEmpSalary" ErrorMessage="Salary is required" runat="server" ForeColor="Red" />
            &nbsp;<asp:RegularExpressionValidator ControlToValidate="txtEmpSalary" ValidationExpression="\d+" ErrorMessage="Enter valid numeric salary" runat="server" ForeColor="Red" />
            <br />
            <br />

            Account Number:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtAccountNumber" runat="server" Height="30px" Width="572px"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="txtAccountNumber" ErrorMessage="Account Number is required" runat="server" ForeColor="Red" />
            <br />
            <br />

            Status:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddlStatus" runat="server" Width="144px" Height="30px">
                <asp:ListItem>Select Status</asp:ListItem>
                <asp:ListItem>Active</asp:ListItem>
                <asp:ListItem>Closed</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:RequiredFieldValidator ControlToValidate="ddlStatus" ErrorMessage="Status is required" runat="server" ForeColor="Red" />
            <br />
            <br />

            Current Balance:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtCurrentBalance" runat="server" Height="30px" Width="572px"></asp:TextBox>
            <asp:RequiredFieldValidator ControlToValidate="txtCurrentBalance" ErrorMessage="Current Balance is required" runat="server" ForeColor="Red" />
            <br />
            <br />

            <asp:Button ID="btnInsert" Text="Insert" runat="server" CssClass="button"  OnClick="btnInsert_Click" Width="161px" />
            &nbsp;<asp:Button ID="btnUpdate" Text="Update" runat="server"  CssClass="button"  OnClick="btnUpdate_Click" Width="160px" />
            &nbsp;<asp:Button ID="btnDelete" Text="Delete" runat="server" CssClass="button"  OnClick="btnDelete_Click" Width="160px" />
            &nbsp;<asp:Button ID="btnViewAll" Text="View All" runat="server" CssClass="button"  OnClick="btnViewAll_Click" Width="161px" />


            <br />
            <br />


            <asp:GridView ID="gvMediclaim" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="EmpID" HeaderText="Employee ID" />
                    <asp:BoundField DataField="EmpName" HeaderText="Employee Name" />
                    <asp:BoundField DataField="EmpAddress" HeaderText="Employee Address" />
                    <asp:BoundField DataField="EmpSalary" HeaderText="Salary" />
                    <asp:BoundField DataField="AccountNumber" HeaderText="Account Number" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                    <asp:BoundField DataField="CurrentBalance" HeaderText="Current Balance" />
                </Columns>
            </asp:GridView>

        </div>
    </form>
</body>
</html>