<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeEmp.aspx.cs" Inherits="OCWMS.EmployeeEmp" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Employee Registration</title>
  <script>
      document.addEventListener("DOMContentLoaded", function () {
          document.getElementById('<%= txtDOB.ClientID %>').addEventListener('change', function () {
            var dob = new Date(this.value);
            var today = new Date();
            var age = today.getFullYear() - dob.getFullYear();
            if (today < new Date(dob.setFullYear(today.getFullYear()))) {
                age--;
            }
            document.getElementById('<%= txtAge.ClientID %>').value = age;
        });
    });
  </script>
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
        </style>

   
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>&nbsp;</h2>
                                    <nav>
                <ul>
                    <li><a href="HomeEmp.aspx">Home</a></li>
</ul></nav>

            <h2>&nbsp;Employee Registration</h2>
            <label>Employee Name:</label>
<asp:TextBox ID="txtEmpName" runat="server" AutoPostBack="true" OnTextChanged="txtEmployeeName_TextChanged" Height="30px" Width="600px"></asp:TextBox>
                     
            <br />
                     
            <asp:RequiredFieldValidator ID="rfvEmpName" runat="server" ControlToValidate="txtEmpName"
                ErrorMessage="Employee Name is required." ForeColor="Red" />

<br />
            <label>Employee ID:</label>
<asp:TextBox ID="txtEmpID" runat="server" ReadOnly="true" Height="30px" Width="600px"></asp:TextBox>

            <br />
                       <label>Gender:</label>
            <asp:DropDownList ID="ddlGender" runat="server" Height="30px" Width="500px" CssClass="auto-style1">
                <asp:ListItem Text="Select Gender" Value="" />
                <asp:ListItem Text="Male" Value="Male" />
                <asp:ListItem Text="Female" Value="Female" />
            </asp:DropDownList>
            <br />
            <asp:RequiredFieldValidator ID="rfvGender" runat="server" ControlToValidate="ddlGender"
                InitialValue="" ErrorMessage="Select a gender." ForeColor="Red" />
            <br />
            <label>Date of Birth:</label>
            <asp:TextBox ID="txtDOB" runat="server" TextMode="Date" Height="30px" Width="600px"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="rfvDOB" runat="server" ControlToValidate="txtDOB"
                ErrorMessage="Date of Birth is required." ForeColor="Red" />
            <br />
            <label>Age:</label>
            <asp:TextBox ID="txtAge" runat="server" ReadOnly="true" Height="30px" Width="600px"></asp:TextBox>
            <label>Phone Number:</label>
            <asp:TextBox ID="txtPhoneNumber" runat="server" Height="30px" Width="600px"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhoneNumber"
                ErrorMessage="Phone Number is required." ForeColor="Red" />
            &nbsp;<asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtPhoneNumber"
                ValidationExpression="^\d{10}$" ErrorMessage="Enter a valid 10-digit phone number." ForeColor="Red" />
            <br />
            <label>Address:</label>
            <asp:TextBox ID="txtAddress" runat="server" Height="30px" TextMode="MultiLine" Width="600px"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress"
                ErrorMessage="Address is required." ForeColor="Red" />
            <br />
            <label>Email:</label>
            <asp:TextBox ID="txtEmail" runat="server" Height="30px" TextMode="Email" Width="600px"></asp:TextBox>
            &nbsp;<br />
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                ErrorMessage="Email is required." ForeColor="Red" />
            &nbsp;<asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
                ErrorMessage="Enter a valid email address." ForeColor="Red" />
            <br />
            <br />

<asp:Label ID="lblDepartment" runat="server" Text="Select Department:"></asp:Label>
            <br />
<asp:DropDownList ID="ddlDepartment" runat="server" CssClass="dropdown" Height="30px" Width="500px">
    <asp:ListItem Text="Select Department" Value="" Selected="True" />
    <asp:ListItem Text="Computer Science" Value="Computer Science" />
    <asp:ListItem Text="Information Technology" Value="Information Technology" />
    <asp:ListItem Text="Physics" Value="Physics" />
    <asp:ListItem Text="Mathematics" Value="Mathematics" />
    <asp:ListItem Text="Chemistry" Value="Chemistry" />
    <asp:ListItem Text="Commerce" Value="Commerce" />
    <asp:ListItem Text="Economics" Value="Economics" />
    <asp:ListItem Text="English" Value="English" />
    <asp:ListItem Text="Management" Value="Management" />
</asp:DropDownList>
            <br />
   <asp:RequiredFieldValidator ControlToValidate="ddlDepartment" InitialValue="" ErrorMessage="Please select a department." ForeColor="Red" runat="server" />
<br />

<asp:Label ID="lblPosition" runat="server" Text="Select Position:"></asp:Label>
            <br />
<asp:DropDownList ID="ddlPosition" runat="server" CssClass="dropdown" Height="30px" Width="500px">
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

            <br />
            <label>Salary:</label>
            <asp:TextBox ID="txtSalary" runat="server" Height="30px" TextMode="Number" Width="600px"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="rfvSalary" runat="server" ControlToValidate="txtSalary"
    ErrorMessage="Salary is required." ForeColor="Red" />
<asp:RegularExpressionValidator ID="revSalary" runat="server" ControlToValidate="txtSalary"
    ValidationExpression="^\d+$" ErrorMessage="Enter a valid numeric salary amount." ForeColor="Red" />
            <br />
<br />
         <br />

            <asp:Button ID="btnInsert" runat="server" Text="Insert" CssClass="button" OnClick="btnInsert_Click" Width="185px" />
            &nbsp;<asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="button" OnClick="btnUpdate_Click" Width="186px" />
            &nbsp;<asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="button" OnClick="btnDelete_Click" Width="186px" />

            <br />

            <br />
            <asp:Label ID="lblMessage" runat="server"></asp:Label>

        </div>
    </form>
</body>
</html>
