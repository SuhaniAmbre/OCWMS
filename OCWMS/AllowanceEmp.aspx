<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllowanceEmp.aspx.cs" Inherits="OCWMS.AllowanceEmp" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Employee Allowance Request</title>
   <style>
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
                <nav>
                <ul>
                    <li><a href="HomeEmp.aspx">Home</a></li>
                </ul>
</nav>
            <h2>&nbsp;Allowance Request</h2>

            Employee ID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <asp:TextBox ID="txtEmpID" runat="server" Required="true" Height="30px" Width="600px"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ControlToValidate="txtEmpID" ErrorMessage="Employee ID is required*" runat="server" ForeColor="Red" />
            <br />
            <br/>
            
            Employee Name:&nbsp;&nbsp;&nbsp;
            <br />
            <asp:TextBox ID="txtEmpName" runat="server" Required="true" Height="30px" Width="600px"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ControlToValidate="txtEmpName" ErrorMessage="Employee Name is required*" runat="server" ForeColor="Red" />
            <br />
            <br/>

            Allowance Type:&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <asp:DropDownList ID="ddlAllowanceType" runat="server" Height="30px" Width="500px">
                <asp:ListItem Text="Select" Value=""></asp:ListItem>
                <asp:ListItem Text="Transport" Value="Transport"></asp:ListItem>
                <asp:ListItem Text="Housing" Value="Housing"></asp:ListItem>
                <asp:ListItem Text="Medical" Value="Medical"></asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:RequiredFieldValidator ControlToValidate="ddlAllowanceType" InitialValue="" ErrorMessage="Select Allowance Type*" runat="server" ForeColor="Red" />
            <br />
            <br/>

            <br/>
            
            Basic Salary:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <asp:TextBox ID="txtBasicSalary" runat="server" ReadOnly="true" Height="30px" Width="600px"></asp:TextBox>
            <br />
            <br/>
            Allowance Rate:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <asp:TextBox ID="txtAllowanceRate" runat="server" ReadOnly="true" Height="30px" Width="600px"></asp:TextBox>
            <br />
            <br/>
            Allowance Amount:&nbsp;
            <br />
            <asp:TextBox ID="txtAllowanceAmount" runat="server" ReadOnly="true" Height="30px" Width="600px"></asp:TextBox>
            <br />
            <br/>
            Status:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <asp:TextBox ID="txtStatus" runat="server" ReadOnly="true" Height="30px" Width="600px"></asp:TextBox>
            <br />
            <br/>
            Month:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <asp:DropDownList ID="ddlMonth" runat="server" Height="30px" Width="500px">
                <asp:ListItem Text="Select Month" Value="" Selected="True"></asp:ListItem>
                <asp:ListItem Text="January" Value="January"></asp:ListItem>
                <asp:ListItem Text="February" Value="February"></asp:ListItem>
                <asp:ListItem Text="March" Value="March"></asp:ListItem>
                <asp:ListItem Text="April" Value="April"></asp:ListItem>
                <asp:ListItem Text="May" Value="May"></asp:ListItem>
                <asp:ListItem Text="June" Value="June"></asp:ListItem>
                <asp:ListItem Text="July" Value="July"></asp:ListItem>
                <asp:ListItem Text="August" Value="August"></asp:ListItem>
                <asp:ListItem Text="September" Value="September"></asp:ListItem>
                <asp:ListItem Text="October" Value="October"></asp:ListItem>
                <asp:ListItem Text="November" Value="November"></asp:ListItem>
                <asp:ListItem Text="December" Value="December"></asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnFetch" runat="server" CssClass="button" Text="Fetch" OnClick="btnFetch_Click" Width="267px" />&nbsp;
            <asp:Button ID="btnRequest" runat="server" Text="Request" CssClass="button" OnClick="btnRequest_Click" Width="267px" /><br/>
        </div>
    </form>
</body>
</html>