<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AlloEmp.aspx.cs" Inherits="OCWMS.AlloEmp" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Allowance Notifications</title>
    <style>
                body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(120deg, #ff9a9e, #fad0c4, #fad0c4, #ffdde1);
            text-align: center;
            margin: 0;
            padding: 20px;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-size: 26px;
            font-weight: bold;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }

        .grid-style {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.3);
            border-radius: 12px;
            overflow: hidden;
            background-color: rgba(255, 255, 255, 0.95);
            text-align: center;
        }

        .grid-style th {
            background: linear-gradient(45deg, #ff4e50, #fc913a);
            color: #ffffff;
            padding: 14px;
            font-size: 16px;
            text-transform: uppercase;
            letter-spacing: 1px;
            text-align: center;
            border-bottom: 2px solid #ff7043;
        }

        .grid-style td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            font-size: 15px;
            color: #333;
            background: rgba(255, 255, 255, 0.8);
            transition: background 0.3s ease;
        }

        .grid-style tr:nth-child(even) td {
            background-color: rgba(255, 224, 230, 0.5);
        }

        .grid-style tr:hover td {
            background-color: #ffe0e6;
            cursor: pointer;
            color: #ff3d00;
            font-weight: bold;
            transition: background 0.3s ease, color 0.3s ease;
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
        <div class="container">
                                                                    <nav>
                <ul>
                    <li><a href="HomeEmp.aspx">Home</a></li>
</ul></nav>

            <h2>Allowance Notifications</h2>

            <asp:GridView ID="gvNotifications" runat="server" AutoGenerateColumns="False"
                CssClass="grid-style" Width="100%" CellPadding="5" BorderWidth="1">
                <Columns>
                    <asp:BoundField DataField="EmpName" HeaderText="Employee Name" />
                    <asp:BoundField DataField="AllowanceAmount" HeaderText="Allowance Amount" />
                    <asp:BoundField DataField="AllowanceType" HeaderText="Allowance Type" />
                    <asp:BoundField DataField="Month" HeaderText="Month" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                    <asp:BoundField DataField="Message" HeaderText="Message" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>