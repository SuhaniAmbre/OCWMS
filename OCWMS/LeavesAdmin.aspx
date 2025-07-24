<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LeavesAdmin.aspx.cs" Inherits="OCWMS.LeavesAdmin" %>

<!DOCTYPE html>
<html>
<head>
    <title>Leave </title>
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
}

form:hover {
    transform: scale(1.02);
}

h2 {
    font-size: 26px;
    font-weight: bold;
    color: black;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
}

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

@media screen and (max-width: 768px) {
    form {
        width: 90%;
    }
    .textbox {
        width: 100%;
    }
}

.search-container {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 20px;
}

.search-container input {
    width: 300px;
    padding: 10px;
    border: 2px solid #007bff;
    border-radius: 25px;
    font-size: 16px;
    outline: none;
    transition: 0.3s;
}

.search-container input:focus {
    border-color: #0056b3;
    box-shadow: 0px 0px 5px rgba(0, 91, 187, 0.5);
}

.search-container button {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 10px 15px;
    margin-left: 10px;
    cursor: pointer;
    border-radius: 25px;
    font-size: 16px;
    transition: 0.3s;
}

.search-container button:hover {
    background-color: #0056b3;
}

.title-container {
    text-align: center;
    padding-bottom: 20px;
}

.title-container h2 {
    color: #333;
    text-transform: uppercase;
    letter-spacing: 2px;
    font-weight: 700;
    margin-bottom: 10px;
    text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
}

.title-container p {
    color: #555;
    font-size: 18px;
    letter-spacing: 1px;
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
        <div>
                                                            <nav>
                <ul>
                    <li><a href="HomeAd.aspx">Home</a></li>
</ul></nav>

            <h2> Employee Leave Record </h2>
            <label>Search by Employee ID or Name:&nbsp;&nbsp;
            <asp:TextBox ID="txtSearch" runat="server"   Width="390px" Height="29px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="btnSearch" runat="server" CssClass="button" Text="Search" OnClick="btnSearch_Click" Height="43px" Width="186px" />

            </label>
            &nbsp;&nbsp;<br /><br />


            <label>Employee ID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtEmpID"  runat="server" Height="35px" Width="319px"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ControlToValidate="txtEmpID" runat="server" ErrorMessage="Required" ForeColor="Red" Display="Dynamic" />

            </label>
&nbsp;<br />

            <label>Employee Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtEmpName"  runat="server" Height="34px" Width="319px"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ControlToValidate="txtEmpName" runat="server" ErrorMessage="Employee Full Name Is Required" ForeColor="Red" Display="Dynamic" />

            </label>
            &nbsp;<br />

            <label>Total Leaves:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtTotalLeaves"  runat="server" Height="35px" Width="319px"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ControlToValidate="txtTotalLeaves" runat="server" ErrorMessage="Required" ForeColor="Red" Display="Dynamic" />
            &nbsp;<asp:RangeValidator ID="RangeValidator1" runat="server"
             ControlToValidate="txtTotalLeaves"
             MinimumValue="1" MaximumValue="27"
             Type="Integer"
             ErrorMessage="Total Leaves must be between 1 and 27."
             ForeColor="Red">
            </asp:RangeValidator>
            </label>
            &nbsp;&nbsp;<br />

            <label>Leave Balance:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtLeaveBalance"   runat="server" Height="35px" Width="319px" ></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ControlToValidate="txtLeaveBalance" runat="server" ErrorMessage="Required" ForeColor="Red" Display="Dynamic" />
            &nbsp;<asp:RangeValidator ID="RangeValidator2" runat="server"
            ControlToValidate="txtLeaveBalance"
            MinimumValue="0" MaximumValue="27"
            Type="Integer"
            ErrorMessage="Leave Balance must be between 0 and 27."
            ForeColor="Red">
           </asp:RangeValidator>
            </label>&nbsp;&nbsp;<br />

            <asp:Button ID="btnInsert" runat="server" Text="Insert" CssClass="button"  OnClick="btnInsert_Click" Width="142px" />
            &nbsp;&nbsp;<asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" CssClass="button" Width="142px" />
            &nbsp;
            <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="button" OnClick="btnDelete_Click" Width="141px" />
            &nbsp;
            &nbsp;<asp:Button ID="btnViewAll" runat="server" Text="View All"  CssClass="button" OnClick="btnViewAll_Click" Width="140px" />

            <br /><br />

        <asp:GridView ID="gvLeave" runat="server" AutoGenerateColumns="true" Width="887px"></asp:GridView>
        </div>
    </form>
</body>
</html>
