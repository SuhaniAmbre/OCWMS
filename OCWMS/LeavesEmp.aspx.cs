using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OCWMS
{
    public partial class LeavesEmp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))

            {
                con.Open();
                string query = "SELECT EmpID, EmpName, LeaveBalance FROM Leaves WHERE EmpID=@EmpID OR EmpName=@EmpName";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@EmpID", txtSearch.Text.Trim());
                cmd.Parameters.AddWithValue("@EmpName", txtSearch.Text.Trim());

                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    txtEmpID.Text = dr["EmpID"].ToString();
                    txtEmpName.Text = dr["EmpName"].ToString();
                    txtLeaveBalance.Text = dr["LeaveBalance"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Employee Not Found');</script>");
                }
                con.Close();
            }
        }

        protected void btnRequest_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtEmpID.Text) || string.IsNullOrWhiteSpace(txtEmpName.Text) || string.IsNullOrWhiteSpace(txtLeaveBalance.Text))
            {
                Response.Write("<script>alert('Please search for an employee first!');</script>");
                return;
            }

            int leaveBalance = Convert.ToInt32(txtLeaveBalance.Text);
            DateTime leaveFrom = Convert.ToDateTime(txtLeaveFrom.Text);
            DateTime leaveTo = Convert.ToDateTime(txtLeaveTo.Text);
            int requestedDays = (leaveTo - leaveFrom).Days + 1;

            if (requestedDays > leaveBalance)
            {
                Response.Write("<script>alert('Insufficient Leave Balance!');</script>");
                return;
            }

            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                con.Open();
                string query = "INSERT INTO LeaveRequests (EmpID, EmpName, LeaveType, LeaveReason, LeaveFrom, LeaveTo, Status) VALUES (@EmpID, @EmpName, @LeaveType, @LeaveReason, @LeaveFrom, @LeaveTo, 'Pending')";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@EmpID", txtEmpID.Text);
                cmd.Parameters.AddWithValue("@EmpName", txtEmpName.Text);
                cmd.Parameters.AddWithValue("@LeaveType", ddlLeaveType.SelectedValue);
                cmd.Parameters.AddWithValue("@LeaveReason", txtLeaveReason.Text);
                cmd.Parameters.AddWithValue("@LeaveFrom", leaveFrom);
                cmd.Parameters.AddWithValue("@LeaveTo", leaveTo);
                cmd.ExecuteNonQuery();

                // Deduct Leave Balance in Employees Table
                string updateQuery = "UPDATE Leaves SET LeaveBalance = LeaveBalance - @Days WHERE EmpID=@EmpID";
                SqlCommand updateCmd = new SqlCommand(updateQuery, con);
                updateCmd.Parameters.AddWithValue("@Days", requestedDays);
                updateCmd.Parameters.AddWithValue("@EmpID", txtEmpID.Text);
                updateCmd.ExecuteNonQuery();

                Response.Write("<script>alert('Leave Request Submitted!');</script>");
                con.Close();
            }
        }

        protected void btnFetchBalance_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                string query = "SELECT LeaveBalance FROM Leaves WHERE EmpID = @EmpID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@EmpID", txtEmpID.Text);

                con.Open();
                object result = cmd.ExecuteScalar();
                con.Close();

                if (result != null && int.TryParse(result.ToString(), out int leaveBalance))
                {
                    txtLeaveBalance.Text = leaveBalance.ToString(); // Set exact integer value
                }
                else
                {
                    txtLeaveBalance.Text = "0"; // Default value when no balance is found
                }
            }
        }

    }
}

