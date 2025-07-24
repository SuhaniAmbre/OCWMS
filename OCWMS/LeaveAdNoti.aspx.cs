using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OCWMS
{
    public partial class LeaveAdNoti : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRequests();
                ShowNotifications();
            }
        }

        protected void gvRequests_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedIndex = gvRequests.SelectedIndex;
            string selectedEmpID = gvRequests.SelectedRow.Cells[0].Text;

        }
        private void ShowNotifications()
        {
            string empid = Session["EmpID"]?.ToString(); // Employee email from session

            if (!string.IsNullOrEmpty(empid))
            {
                string query = "SELECT * FROM Leaves WHERE EmpID = @EmpID";

                using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@EmpID", empid);

                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        gvRequests.DataSource = reader;
                        gvRequests.DataBind();
                        con.Close();
                    }
                }
            }
        }

        private void LoadRequests()
        {
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM LeaveRequests WHERE Status = 'Pending'", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvRequests.DataSource = dt;
                gvRequests.DataBind();
            }
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int requestId = Convert.ToInt32(btn.CommandArgument);

            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                con.Open();

                // Fetch Employee Details
                string selectQuery = "SELECT EmpID, EmpName, LeaveFrom, LeaveTo FROM LeaveRequests WHERE RequestID = @RequestID";
                SqlCommand selectCmd = new SqlCommand(selectQuery, con);
                selectCmd.Parameters.AddWithValue("@RequestID", requestId);
                SqlDataReader reader = selectCmd.ExecuteReader();

                string empID = "";
                string empName = "";
                DateTime leaveFrom = DateTime.Now;
                DateTime leaveTo = DateTime.Now;

                if (reader.Read())
                {
                    empID = reader["EmpID"].ToString();
                    empName = reader["EmpName"].ToString();
                    leaveFrom = Convert.ToDateTime(reader["LeaveFrom"]);
                    leaveTo = Convert.ToDateTime(reader["LeaveTo"]);
                }
                reader.Close();

                // Update LeaveRequests Table to "Approved"
                string updateQuery = "UPDATE LeaveRequests SET Status = 'Approved' WHERE RequestID = @RequestID";
                SqlCommand updateCmd = new SqlCommand(updateQuery, con);
                updateCmd.Parameters.AddWithValue("@RequestID", requestId);
                updateCmd.ExecuteNonQuery();

                // Insert into Employee Notification Table
                string insertQuery = "INSERT INTO Leave_Notifications (EmpID, EmpName, LeaveFrom, LeaveTo, Status, Message) " +
                                     "VALUES (@EmpID, @EmpName, @LeaveFrom, @LeaveTo, @Status, @Message)";
                SqlCommand insertCmd = new SqlCommand(insertQuery, con);
                insertCmd.Parameters.AddWithValue("@EmpID", empID);
                insertCmd.Parameters.AddWithValue("@EmpName", empName);
                insertCmd.Parameters.AddWithValue("@LeaveFrom", leaveFrom);
                insertCmd.Parameters.AddWithValue("@LeaveTo", leaveTo);
                insertCmd.Parameters.AddWithValue("@Status", "Approved");
                insertCmd.Parameters.AddWithValue("@Message", "Your leave request has been Approved.");
                insertCmd.ExecuteNonQuery();
            }

            LoadRequests();
            Response.Write("<script>alert('Your Response Has Been Sent Successfully');</script>");
        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int requestId = Convert.ToInt32(btn.CommandArgument);

            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                con.Open();

                // Fetch Employee Details
                string selectQuery = "SELECT EmpID, EmpName, LeaveFrom, LeaveTo FROM LeaveRequests WHERE RequestID = @RequestID";
                SqlCommand selectCmd = new SqlCommand(selectQuery, con);
                selectCmd.Parameters.AddWithValue("@RequestID", requestId);
                SqlDataReader reader = selectCmd.ExecuteReader();

                string empID = "";
                string empName = "";
                DateTime leaveFrom = DateTime.Now;
                DateTime leaveTo = DateTime.Now;

                if (reader.Read())
                {
                    empID = reader["EmpID"].ToString();
                    empName = reader["EmpName"].ToString();
                    leaveFrom = Convert.ToDateTime(reader["LeaveFrom"]);
                    leaveTo = Convert.ToDateTime(reader["LeaveTo"]);
                }
                reader.Close();

                // Update LeaveRequests Table to "Rejected"
                string updateQuery = "UPDATE LeaveRequests SET Status = 'Rejected' WHERE RequestID = @RequestID";
                SqlCommand updateCmd = new SqlCommand(updateQuery, con);
                updateCmd.Parameters.AddWithValue("@RequestID", requestId);
                updateCmd.ExecuteNonQuery();

                // Insert into Employee Notification Table
                string insertQuery = "INSERT INTO Leave_Notifications (EmpID, EmpName, LeaveFrom, LeaveTo, Status, Message) " +
                                     "VALUES (@EmpID, @EmpName, @LeaveFrom, @LeaveTo, @Status, @Message)";
                SqlCommand insertCmd = new SqlCommand(insertQuery, con);
                insertCmd.Parameters.AddWithValue("@EmpID", empID);
                insertCmd.Parameters.AddWithValue("@EmpName", empName);
                insertCmd.Parameters.AddWithValue("@LeaveFrom", leaveFrom);
                insertCmd.Parameters.AddWithValue("@LeaveTo", leaveTo);
                insertCmd.Parameters.AddWithValue("@Status", "Rejected");
                insertCmd.Parameters.AddWithValue("@Message", "Your leave request has been Rejected.");
                insertCmd.ExecuteNonQuery();
            }

            LoadRequests();
            Response.Write("<script>alert('Your Response Has Been Sent Successfully');</script>");

        }
    }
}