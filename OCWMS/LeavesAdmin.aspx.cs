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
    public partial class LeavesAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadGridView();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                string query = "SELECT * FROM Leaves WHERE EmpID=@Search OR EmpName LIKE '%' + @Search + '%'";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Search", txtSearch.Text);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvLeave.DataSource = dt;
                gvLeave.DataBind();

            }
            }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                string query = "INSERT INTO Leaves (EmpID, EmpName, TotalLeaves, LeaveBalance) VALUES (@EmpID, @EmpName, @TotalLeaves, @LeaveBalance)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@EmpID", txtEmpID.Text);
                cmd.Parameters.AddWithValue("@EmpName", txtEmpName.Text);
                cmd.Parameters.AddWithValue("@TotalLeaves", txtTotalLeaves.Text);
                cmd.Parameters.AddWithValue("@LeaveBalance", txtLeaveBalance.Text);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            LoadGridView();
            Response.Write("<script>alert('Your Data Has Been Inserted Successfully');</script>");

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                string query = "UPDATE Leaves SET EmpName=@EmpName, TotalLeaves=@TotalLeaves, LeaveBalance=@LeaveBalance WHERE EmpID=@EmpID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@EmpID", txtEmpID.Text);
                cmd.Parameters.AddWithValue("@EmpName", txtEmpName.Text);
                cmd.Parameters.AddWithValue("@TotalLeaves", txtTotalLeaves.Text);
                cmd.Parameters.AddWithValue("@LeaveBalance", txtLeaveBalance.Text);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            LoadGridView();
            Response.Write("<script>alert('Your Data Has Been Updated Successfully');</script>");


        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                string query = "DELETE FROM Leaves WHERE EmpID=@EmpID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@EmpID", txtEmpID.Text);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            LoadGridView();
            Response.Write("<script>alert('Your Data Has Been Deleted Successfully');</script>");


        }

        protected void btnViewAll_Click(object sender, EventArgs e)
        {
            LoadGridView();
        }
        private void LoadGridView()
        {
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                string query = "SELECT * FROM Leaves";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvLeave.DataSource = dt;
                gvLeave.DataBind();
            }
        }
    }
}