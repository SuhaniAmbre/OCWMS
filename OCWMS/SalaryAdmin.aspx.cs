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
    public partial class SalaryAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Salary WHERE EmployeeID=@EmployeeID OR EmployeeName=@EmployeeName", con);
                cmd.Parameters.AddWithValue("@EmployeeID", txtSearch.Text);
                cmd.Parameters.AddWithValue("@EmployeeName", txtSearch.Text);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvSalary.DataSource = dt;
                gvSalary.DataBind();
            }
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO Salary (EmployeeID, EmployeeName, AccountNo, BankName,  BasicSalary, PaymentDate, PaymentMethod) VALUES (@EmployeeID, @EmployeeName, @AccountNo, @BankName,  @BasicSalary, @PaymentDate, @PaymentMethod)", con);
                cmd.Parameters.AddWithValue("@EmployeeID", txtEmpID.Text);
                cmd.Parameters.AddWithValue("@EmployeeName", txtEmpName.Text);
                cmd.Parameters.AddWithValue("@AccountNo", txtAccountNo.Text);
                cmd.Parameters.AddWithValue("@BankName", txtBankName.Text);
                cmd.Parameters.AddWithValue("@BasicSalary", txtBasicSalary.Text);
                cmd.Parameters.AddWithValue("@PaymentDate", txtPaymentDate.Text);
                cmd.Parameters.AddWithValue("@PaymentMethod", ddlPaymentMethod.SelectedValue);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                BindGridView();
                ClearFields();
                Response.Write("<script>alert('Your Data Has Been Inserted Successfully');</script>");
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                SqlCommand cmd = new SqlCommand("UPDATE Salary SET EmployeeName=@EmployeeName, AccountNo=@AccountNo, BankName=@BankName,  BasicSalary=@BasicSalary, PaymentDate=@PaymentDate, PaymentMethod=@PaymentMethod WHERE EmployeeID=@EmployeeID", con);
                cmd.Parameters.AddWithValue("@EmployeeID", txtEmpID.Text);
                cmd.Parameters.AddWithValue("@EmployeeName", txtEmpName.Text);
                cmd.Parameters.AddWithValue("@AccountNo", txtAccountNo.Text);
                cmd.Parameters.AddWithValue("@BankName", txtBankName.Text);
                cmd.Parameters.AddWithValue("@BasicSalary", txtBasicSalary.Text);
                cmd.Parameters.AddWithValue("@PaymentDate", txtPaymentDate.Text);
                cmd.Parameters.AddWithValue("@PaymentMethod", ddlPaymentMethod.SelectedValue);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                BindGridView();
                ClearFields();
                Response.Write("<script>alert('Your Data Has Been Updated Successfully');</script>");
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Salary WHERE EmployeeID=@EmployeeID", con);
                cmd.Parameters.AddWithValue("@EmployeeID", txtEmpID.Text);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                BindGridView();
                ClearFields();
                Response.Write("<script>alert('Your Data Has Been Deleted Successfully');</script>");
            }
        }

        protected void btnViewAll_Click(object sender, EventArgs e)
        {
            BindGridView();
        }

        protected void gvSalary_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvSalary.SelectedRow;
            txtEmpID.Text = row.Cells[1].Text;
            txtEmpName.Text = row.Cells[2].Text;
            txtAccountNo.Text = row.Cells[3].Text;
            txtBankName.Text = row.Cells[4].Text;
            txtBasicSalary.Text = row.Cells[6].Text;
            txtPaymentDate.Text = row.Cells[7].Text;
            ddlPaymentMethod.SelectedValue = row.Cells[8].Text;
        }
        private void BindGridView()
        {
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Salary", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvSalary.DataSource = dt;
                gvSalary.DataBind();
            }
        }

        private void ClearFields()
        {
            txtEmpID.Text = "";
            txtEmpName.Text = "";
            txtAccountNo.Text = "";
            txtBankName.Text = "";
            txtBasicSalary.Text = "";
            txtPaymentDate.Text = "";
            ddlPaymentMethod.SelectedIndex = 0;
        }

        protected void txtEmpID_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
    
