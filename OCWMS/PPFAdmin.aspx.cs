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
    public partial class PPFAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPPFData();
            }
        }
        private void LoadPPFData()
        {
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                string query = "SELECT * FROM PPF";
                using (SqlDataAdapter da = new SqlDataAdapter(query, con))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    gvPPF.DataSource = dt;
                    gvPPF.DataBind();
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                string query = "SELECT * FROM PPF WHERE EmpID=@Search OR EmpName LIKE @SearchName";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Search", txtSearch.Text);
                cmd.Parameters.AddWithValue("@SearchName", "%" + txtSearch.Text + "%");

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                gvPPF.DataSource = dt;
                gvPPF.DataBind();
            }
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                string query = "INSERT INTO PPF (EmpID, EmpName, BasicSalary, Age, Email, AccountNumber,CurrentBalance) " +
                               "VALUES (@EmpID, @EmpName, @BasicSalary, @Age, @Email, @AccountNumber, @CurrentBalance)";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@EmpID", txtEmpID.Text);
                cmd.Parameters.AddWithValue("@EmpName", txtEmpName.Text);
                cmd.Parameters.AddWithValue("@BasicSalary", Convert.ToDecimal(txtBasicSalary.Text));
                cmd.Parameters.AddWithValue("@Age", Convert.ToInt32(txtAge.Text));
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@AccountNumber", txtAccountNumber.Text);
                cmd.Parameters.AddWithValue("@CurrentBalance", Convert.ToDecimal(txtCurrentBalance.Text));

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                LoadPPFData();
                Response.Write("<script>alert('Your Data Has Been Inserted Successfully');</script>");
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                string query = "UPDATE PPF SET EmpName=@EmpName, BasicSalary=@BasicSalary, Age=@Age, Email=@Email, AccountNumber=@AccountNumber, " +
                              " CurrentBalance=@CurrentBalance " +
                               "WHERE EmpID=@EmpID";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@EmpID", txtEmpID.Text);
                cmd.Parameters.AddWithValue("@EmpName", txtEmpName.Text);
                cmd.Parameters.AddWithValue("@BasicSalary", Convert.ToDecimal(txtBasicSalary.Text));
                cmd.Parameters.AddWithValue("@Age", Convert.ToInt32(txtAge.Text));
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@AccountNumber", txtAccountNumber.Text);
                cmd.Parameters.AddWithValue("@CurrentBalance", Convert.ToDecimal(txtCurrentBalance.Text));

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                LoadPPFData();
                Response.Write("<script>alert('Your Data Has Been Updated Successfully');</script>");
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                string query = "DELETE FROM PPF WHERE EmpID=@EmpID";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@EmpID", txtEmpID.Text);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                LoadPPFData();
                Response.Write("<script>alert('Your Data Has Been Deleted Successfully');</script>");
            }
        }

        protected void btnViewAll_Click(object sender, EventArgs e)
        {
            LoadPPFData();
        }
    }
}