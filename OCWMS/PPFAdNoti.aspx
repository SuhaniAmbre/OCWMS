<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PPFAdNoti.aspx.cs" Inherits="OCWMS.PPFAdNoti" %>
<!DOCTYPE html>
<html>
<head>
    <title>PPF Requests - Admin</title>
    <style>
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(120deg, #ff9a9e, #fad0c4, #fad0c4, #ffdde1);
    text-align: center;
    margin: 0;
    padding: 20px;
}

/* Heading Style */
h2 {
    color: #333;
    margin-bottom: 20px;
    text-transform: uppercase;
    letter-spacing: 1px;
    font-size: 26px;
    font-weight: bold;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
}

/* GridView Container */
#gvRequests {
    width: 90%;
    margin: 20px auto;
    border-collapse: collapse;
    box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.3);
    border-radius: 12px;
    overflow: hidden;
    background-color: rgba(255, 255, 255, 0.95);
    text-align: center;
}

/* Header Row */
#gvRequests th {
    background: linear-gradient(45deg, #ff4e50, #fc913a);
    color: #ffffff;
    padding: 14px;
    font-size: 16px;
    text-transform: uppercase;
    letter-spacing: 1px;
    text-align: center;
    border-bottom: 2px solid #ff7043;
}

/* Data Rows */
#gvRequests td {
    padding: 12px;
    border-bottom: 1px solid #ddd;
    font-size: 15px;
    color: #333;
    background: rgba(255, 255, 255, 0.8);
    transition: background 0.3s ease;
}

/* Alternating Row Color */
#gvRequests tr:nth-child(even) td {
    background-color: rgba(255, 224, 230, 0.5);
}

/* Hover Effect */
#gvRequests tr:hover td {
    background-color: #ffe0e6;
    cursor: pointer;
    color: #ff3d00;
    font-weight: bold;
    transition: background 0.3s ease, color 0.3s ease;
}

/* Action Buttons */
#gvRequests .aspNetButton {
    padding: 10px 18px;
    margin: 5px;
    border: none;
    cursor: pointer;
    border-radius: 8px;
    font-size: 15px;
    font-weight: bold;
    transition: background 0.3s ease, transform 0.2s ease;
}

/* Approve Button */
#gvRequests #btnApprove {
    background: linear-gradient(45deg, #28a745, #70db70);
    color: white;
    box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
}

#gvRequests #btnApprove:hover {
    background: #218838;
    transform: scale(1.05);
}

/* Reject Button */
#gvRequests #btnReject {
    background: linear-gradient(45deg, #dc3545, #ff4d4d);
    color: white;
    box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
}

#gvRequests #btnReject:hover {
    background: #c82333;
    transform: scale(1.05);
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
                                                    <nav>
                <ul>
                    <li><a href="HomeAd.aspx">Home</a></li>
</ul></nav>

        <h2>PPF Requests</h2>
       
      

        <asp:GridView ID="gvRequests" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="gvRequests_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="EmpID" HeaderText="Employee ID" />
                <asp:BoundField DataField="EmpName" HeaderText="Employee Name" />
                <asp:BoundField DataField="RequestDate" HeaderText="Request Date" />
                <asp:BoundField DataField="RequestAmount" HeaderText="Request Amount" />
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:Button ID="btnApprove" runat="server" Text="Approve" CommandArgument='<%# Eval("RequestID") %>' OnClick="btnApprove_Click" />
                        <asp:Button ID="btnReject" runat="server" Text="Reject" CommandArgument='<%# Eval("RequestID") %>' OnClick="btnReject_Click" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
