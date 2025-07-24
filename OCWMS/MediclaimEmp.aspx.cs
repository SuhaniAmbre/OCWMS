using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OCWMS
{
    public partial class MediclaimEmp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnFetchBalance_Click(object sender, EventArgs e)
        {
            string empID = txtEmployeeID.Text;
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                string query = "SELECT CurrentBalance FROM Mediclaim WHERE EmpID = @EmpID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@EmpID", empID);
                con.Open();
                object balance = cmd.ExecuteScalar();
                txtCurrBalance.Text = balance != null ? balance.ToString() : "0";
            }
        }
        protected void btnRequest_Click(object sender, EventArgs e)
        {
            string empID = txtEmployeeID.Text;
            string empName = txtEmployeeName.Text;
            string requestedAmount = txtReqAmount.Text;
            string reason = txtMedReason.Text;
            string totalBill = txtTotalAmount.Text;
            string status = "Pending";

            // Ensure the requested amount is numeric before proceeding
            decimal requestedAmountDecimal;
            if (!decimal.TryParse(requestedAmount, out requestedAmountDecimal) || requestedAmountDecimal <= 0)
            {
                Response.Write("<script>alert('Please enter a valid requested amount.');</script>");
                return;
            }

            // Fetch current balance of the employee
            decimal currentBalance = 0;
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                string balanceQuery = "SELECT CurrentBalance FROM Mediclaim WHERE EmpID = @EmpID";
                SqlCommand balanceCmd = new SqlCommand(balanceQuery, con);
                balanceCmd.Parameters.AddWithValue("@EmpID", empID);
                con.Open();
                object balance = balanceCmd.ExecuteScalar();
                currentBalance = balance != null ? Convert.ToDecimal(balance) : 0;
            }

            // Check if the requested amount is greater than the current balance
            if (requestedAmountDecimal > currentBalance)
            {
                Response.Write("<script>alert('Insufficient balance to make the request.');</script>");
                return;
            }

            // Subtract the requested amount from the current balance
            decimal newBalance = currentBalance - requestedAmountDecimal;

            // Update the balance for the employee in the Mediclaim table
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                string updateQuery = "UPDATE Mediclaim SET CurrentBalance = @NewBalance WHERE EmpID = @EmpID";
                SqlCommand updateCmd = new SqlCommand(updateQuery, con);
                updateCmd.Parameters.AddWithValue("@NewBalance", newBalance);
                updateCmd.Parameters.AddWithValue("@EmpID", empID);
                con.Open();
                updateCmd.ExecuteNonQuery();
            }

            // Insert the request details into the MediclaimRequests table
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                string query = "INSERT INTO MediclaimRequests (EmpID, EmpName, RequestedAmount, MediclaimReason, TotalBill, Status) VALUES (@EmpID, @EmpName, @RequestedAmount, @MediclaimReason, @TotalBill, @Status)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@EmpID", empID);
                cmd.Parameters.AddWithValue("@EmpName", empName);
                cmd.Parameters.AddWithValue("@RequestedAmount", requestedAmount);
                cmd.Parameters.AddWithValue("@MediclaimReason", reason);
                cmd.Parameters.AddWithValue("@TotalBill", totalBill);
                cmd.Parameters.AddWithValue("@Status", status);
                con.Open();
                cmd.ExecuteNonQuery();
            }

            // Inform the user that the request has been successfully sent
            Response.Write("<script>alert('Your Request Has Been Sent Successfully. Your new balance is ₹" + newBalance + "');</script>");
        }
    }
}
