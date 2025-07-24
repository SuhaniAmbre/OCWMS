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
    public partial class EPFAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadEPFData();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                string query = "SELECT * FROM EPF WHERE EmpID = @EmpID OR EmpName LIKE '%' + @EmpName + '%'";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@EmpID", txtSearch.Text.Trim());
                    cmd.Parameters.AddWithValue("@EmpName", txtSearch.Text.Trim());

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    // If data is found, bind to GridView and populate form fields
                    if (dt.Rows.Count > 0)
                    {
                        gvEPF.DataSource = dt;
                        gvEPF.DataBind();

                        // Fill the form fields with the first matched record
                        DataRow row = dt.Rows[0];
                        txtEmpID.Text = row["EmpID"].ToString();
                        txtEmpName.Text = row["EmpName"].ToString();
                        txtBasicSalary.Text = row["BasicSalary"].ToString();
                        ddlPosition.SelectedValue = row["Position"].ToString();
                        txtAge.Text = row["Age"].ToString();
                        txtEmail.Text = row["Email"].ToString();
                        txtAccountNumber.Text = row["AccountNumber"].ToString();
                        txtDateOfJoining.Text = Convert.ToDateTime(row["DateOfJoining"]).ToString("yyyy-MM-dd"); // Format date
                        txtUANNumber.Text = row["UANNumber"].ToString();
                        txtCurrentBalance.Text = row["CurrentBalance"].ToString();
                    }
                    else
                    {
                        // If no record is found, clear form fields and show message
                        ClearFields();
                        Response.Write("<script>alert('No matching record found.');</script>");
                    }
                }
            }
        }
        protected void btnInsert_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                string query = "INSERT INTO EPF (EmpID, EmpName, BasicSalary, Position, Age, Email, AccountNumber,  DateOfJoining, UANNumber, CurrentBalance) " +
                               "VALUES (@EmpID, @EmpName, @BasicSalary, @Position, @Age, @Email, @AccountNumber,  @DateOfJoining, @UANNumber, @CurrentBalance)";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@EmpID", txtEmpID.Text);
                    cmd.Parameters.AddWithValue("@EmpName", txtEmpName.Text);
                    cmd.Parameters.AddWithValue("@BasicSalary", txtBasicSalary.Text);
                    cmd.Parameters.AddWithValue("@Position", ddlPosition.SelectedValue);
                    cmd.Parameters.AddWithValue("@Age", txtAge.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@AccountNumber", txtAccountNumber.Text);
                    cmd.Parameters.AddWithValue("@DateOfJoining", txtDateOfJoining.Text);
                    cmd.Parameters.AddWithValue("@UANNumber", txtUANNumber.Text);
                    cmd.Parameters.AddWithValue("@CurrentBalance", txtCurrentBalance.Text);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            LoadEPFData();
            ClearFields();
            Response.Write("<script>alert('Your Data Has Been Inserted Successfully');</script>");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                string query = "UPDATE EPF SET EmpName=@EmpName, BasicSalary=@BasicSalary, Position=@Position, Age=@Age, Email=@Email, AccountNumber=@AccountNumber, DateOfJoining=@DateOfJoining, UANNumber=@UANNumber, CurrentBalance=@CurrentBalance WHERE EmpID=@EmpID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@EmpID", txtEmpID.Text);
                    cmd.Parameters.AddWithValue("@EmpName", txtEmpName.Text);
                    cmd.Parameters.AddWithValue("@BasicSalary", txtBasicSalary.Text);
                    cmd.Parameters.AddWithValue("@Position", ddlPosition.SelectedValue);
                    cmd.Parameters.AddWithValue("@Age", Convert.ToInt32(txtAge.Text));
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@AccountNumber", txtAccountNumber.Text);
                    cmd.Parameters.AddWithValue("@DateOfJoining", txtDateOfJoining.Text);
                    cmd.Parameters.AddWithValue("@UANNumber", txtUANNumber.Text);
                    cmd.Parameters.AddWithValue("@CurrentBalance", txtCurrentBalance.Text);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            LoadEPFData();
            ClearFields();
            Response.Write("<script>alert('Your Data Has Been Updated Successfully');</script>");
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {

            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                string query = "DELETE FROM EPF WHERE EmpID=@EmpID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@EmpID", txtEmpID.Text);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            LoadEPFData();
            ClearFields();
            Response.Write("<script>alert('Your Data Has Been Deleted Successfully');</script>");
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            LoadEPFData();
        }
        private void LoadEPFData()
        {
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                string query = "SELECT * FROM EPF";
                using (SqlDataAdapter da = new SqlDataAdapter(query, con))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    gvEPF.DataSource = dt;
                    gvEPF.DataBind();
                }
            }
        }
        private void ClearFields()
        {
            txtEmpID.Text = "";
            txtEmpName.Text = "";
            txtBasicSalary.Text = "";
            ddlPosition.SelectedIndex = 0; // Reset dropdown to default
            txtAge.Text = "";
            txtEmail.Text = "";
            txtAccountNumber.Text = "";
            txtDateOfJoining.Text = "";
            txtUANNumber.Text = "";
            txtCurrentBalance.Text = "";
            txtSearch.Text = "";
        }
        protected void gvEPF_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}