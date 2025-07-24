using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace OCWMS
{
    public partial class AllowanceAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadMediclaimData();
            }
        }

        protected void btnCalculate_Click(object sender, EventArgs e)
        {
            double rate = Convert.ToDouble(txtAllowanceRate.Text);
            double salary = Convert.ToDouble(txtBasicSalary.Text);
            txtAllowanceAmount.Text = (rate * salary / 100).ToString();
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO Allowances (EmpID, EmpName, AllowanceType, AllowanceRate, BasicSalary, AllowanceAmount, Status) VALUES (@EmpID, @EmpName, @AllowanceType, @AllowanceRate, @BasicSalary, @AllowanceAmount, @Status)", con);
                cmd.Parameters.AddWithValue("@EmpID", txtEmpID.Text);
                cmd.Parameters.AddWithValue("@EmpName", txtEmpName.Text);
                cmd.Parameters.AddWithValue("@AllowanceType", ddlAllowanceType.SelectedValue);
                cmd.Parameters.AddWithValue("@AllowanceRate", txtAllowanceRate.Text);
                cmd.Parameters.AddWithValue("@BasicSalary", txtBasicSalary.Text);
                cmd.Parameters.AddWithValue("@AllowanceAmount", txtAllowanceAmount.Text);
                cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Your Data Has Been Inserted Successfully');</script>");
                ClearFields();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                SqlCommand cmd = new SqlCommand("UPDATE Allowances SET EmpName=@EmpName, AllowanceType=@AllowanceType, AllowanceRate=@AllowanceRate, BasicSalary=@BasicSalary, AllowanceAmount=@AllowanceAmount, Status=@Status WHERE EmpID=@EmpID", con);
                cmd.Parameters.AddWithValue("@EmpID", txtEmpID.Text);
                cmd.Parameters.AddWithValue("@EmpName", txtEmpName.Text);
                cmd.Parameters.AddWithValue("@AllowanceType", ddlAllowanceType.SelectedValue);
                cmd.Parameters.AddWithValue("@AllowanceRate", txtAllowanceRate.Text);
                cmd.Parameters.AddWithValue("@BasicSalary", txtBasicSalary.Text);
                cmd.Parameters.AddWithValue("@AllowanceAmount", txtAllowanceAmount.Text);
                cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Your Data Has Been Updated Successfully');</script>");
                ClearFields();
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Allowances WHERE EmpID=@EmpID", con);
                cmd.Parameters.AddWithValue("@EmpID", txtEmpID.Text);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Your Data Has Been Deleted Successfully');</script>");
                ClearFields();
            }
        }


        protected void btnSearch_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))

            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Allowances WHERE EmpID=@EmpID OR EmpName=@EmpName", con);
                da.SelectCommand.Parameters.AddWithValue("@EmpID", txtSearch.Text);
                da.SelectCommand.Parameters.AddWithValue("@EmpName", txtSearch.Text);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void btnViewAll_Click(object sender, EventArgs e)
        {
            LoadMediclaimData();
        }
        private void LoadMediclaimData()
        {
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                string query = "SELECT * FROM Allowances";
                using (SqlDataAdapter da = new SqlDataAdapter(query, con))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
        }
        

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "YourCommandName") // Replace with your actual CommandName
            {
                int index = Convert.ToInt32(e.CommandArgument);
                // Your code logic here
            }
        }
        private void ClearFields()
        {
            txtEmpID.Text = string.Empty;
            txtEmpName.Text = string.Empty;
            ddlAllowanceType.SelectedIndex = 0;
            txtAllowanceRate.Text = string.Empty;
            txtBasicSalary.Text = string.Empty;
            txtAllowanceAmount.Text = string.Empty;
            ddlStatus.SelectedIndex = 0;
            txtSearch.Text = string.Empty;
        }

    }
}
