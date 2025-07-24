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
    public partial class PPFAdNoti : System.Web.UI.Page
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

            string email = Session["Email"]?.ToString(); // Employee ID from session

            if (!string.IsNullOrEmpty(email))
            {
                string query = "SELECT * FROM UserRegister WHERE EmpID = @EmpID";

                using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Email", email);

                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        gvRequests.DataSource = reader;  // Assuming you are using a GridView
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
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM PPFRequests WHERE Status = 'Pending'", con);
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
                string selectQuery = "SELECT EmpID, EmpName, RequestAmount, RequestDate FROM PPFRequests WHERE RequestID = @RequestID";
                SqlCommand selectCmd = new SqlCommand(selectQuery, con);
                selectCmd.Parameters.AddWithValue("@RequestID", requestId);
                SqlDataReader reader = selectCmd.ExecuteReader();

                string empID = "";
                string empName = "";
                decimal requestAmount = 0;
                DateTime requestDate = DateTime.Now;

                if (reader.Read())
                {
                    empID = reader["EmpID"].ToString();
                    empName = reader["EmpName"].ToString();
                    requestAmount = Convert.ToDecimal(reader["RequestAmount"]);
                    requestDate = Convert.ToDateTime(reader["RequestDate"]);
                }
                reader.Close();

                // Update EPFRequest Table to "Approved"
                string updateQuery = "UPDATE PPFRequests SET Status = 'Approved' WHERE RequestID = @RequestID";
                SqlCommand updateCmd = new SqlCommand(updateQuery, con);
                updateCmd.Parameters.AddWithValue("@RequestID", requestId);
                updateCmd.ExecuteNonQuery();

                // Insert into Employee Notification Table
                string insertQuery = "INSERT INTO PPF_Notifications (EmpID, EmpName, RequestAmount, RequestDate, Status, Message) " +
                                     "VALUES (@EmpID, @EmpName, @RequestAmount, @RequestDate, @Status, @Message)";
                SqlCommand insertCmd = new SqlCommand(insertQuery, con);
                insertCmd.Parameters.AddWithValue("@EmpID", empID);
                insertCmd.Parameters.AddWithValue("@EmpName", empName);
                insertCmd.Parameters.AddWithValue("@RequestAmount", requestAmount);
                insertCmd.Parameters.AddWithValue("@RequestDate", requestDate);
                insertCmd.Parameters.AddWithValue("@Status", "Approved");
                insertCmd.Parameters.AddWithValue("@Message", "Your PPF request has been Approved.");
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
                string selectQuery = "SELECT EmpID, EmpName, RequestAmount, RequestDate FROM PPFRequests WHERE RequestID = @RequestID";
                SqlCommand selectCmd = new SqlCommand(selectQuery, con);
                selectCmd.Parameters.AddWithValue("@RequestID", requestId);
                SqlDataReader reader = selectCmd.ExecuteReader();

                string empID = "";
                string empName = "";
                decimal requestAmount = 0;
                DateTime requestDate = DateTime.Now;

                if (reader.Read())
                {
                    empID = reader["EmpID"].ToString();
                    empName = reader["EmpName"].ToString();
                    requestAmount = Convert.ToDecimal(reader["RequestAmount"]);
                    requestDate = Convert.ToDateTime(reader["RequestDate"]);
                }
                reader.Close();

                // Update EPFRequest Table to "Rejected"
                string updateQuery = "UPDATE PPFRequests SET Status = 'Rejected' WHERE RequestID = @RequestID";
                SqlCommand updateCmd = new SqlCommand(updateQuery, con);
                updateCmd.Parameters.AddWithValue("@RequestID", requestId);
                updateCmd.ExecuteNonQuery();

                // Insert into Employee Notification Table
                string insertQuery = "INSERT INTO PPF_Notifications (EmpID, EmpName, RequestAmount, RequestDate, Status, Message) " +
                                     "VALUES (@EmpID, @EmpName, @RequestAmount, @RequestDate, @Status, @Message)";
                SqlCommand insertCmd = new SqlCommand(insertQuery, con);
                insertCmd.Parameters.AddWithValue("@EmpID", empID);
                insertCmd.Parameters.AddWithValue("@EmpName", empName);
                insertCmd.Parameters.AddWithValue("@RequestAmount", requestAmount);
                insertCmd.Parameters.AddWithValue("@RequestDate", requestDate);
                insertCmd.Parameters.AddWithValue("@Status", "Rejected");
                insertCmd.Parameters.AddWithValue("@Message", "Your PPF request has been Rejected.");
                insertCmd.ExecuteNonQuery();
            }

            LoadRequests();
            Response.Write("<script>alert('Your Response Has Been Sent Successfully');</script>");
        }

    }
}



