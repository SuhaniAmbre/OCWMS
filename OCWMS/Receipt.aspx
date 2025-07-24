<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Receipt.aspx.cs" Inherits="OCWMS.Receipt" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Salary Receipt</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Employee Salary Details</h2>
            <asp:TextBox ID="txtSearch" runat="server" Placeholder="Enter Employee ID or Name"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
            <br /><br />
            <asp:GridView ID="gvEmployeeSalary" runat="server" AutoGenerateColumns="False" BorderColor="Black" BorderWidth="1px">
                <Columns>
                    <asp:BoundField DataField="EmployeeID" HeaderText="Employee ID" />
                    <asp:BoundField DataField="EmployeeName" HeaderText="Employee Name" />
                    <asp:BoundField DataField="AccountNo" HeaderText="Account No" />
                    <asp:BoundField DataField="BankName" HeaderText="Bank Name" />
                    <asp:BoundField DataField="BranchName" HeaderText="Branch Name" />
                    <asp:BoundField DataField="BasicSalary" HeaderText="Basic Salary" />
                    <asp:BoundField DataField="PaymentDate" HeaderText="Payment Date" />
                    <asp:BoundField DataField="PaymentMethod" HeaderText="Payment Method" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:Button ID="btnGeneratePDF" runat="server" Text="Generate PDF" OnClick="btnGeneratePDF_Click" />
        </div>
    </form>
</body>
</html>
