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
    public partial class MediclaimAdmin : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            ViewAllData();
        }

        

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            ExecuteQuery("INSERT INTO Mediclaim VALUES(@EmpID, @EmpName, @EmpAddress, @EmpSalary, @AccountNumber, @Status, @CurrentBalance)");
            ViewAllData();
            Response.Write("<script>alert('Your Data Has Been Inserted Successfully');</script>");


        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            ExecuteQuery("UPDATE Mediclaim SET EmpName=@EmpName, EmpAddress=@EmpAddress, EmpSalary=@EmpSalary, AccountNumber=@AccountNumber, Status=@Status, CurrentBalance=@CurrentBalance WHERE EmpID=@EmpID");
            ViewAllData();
            Response.Write("<script>alert('Your Data Has Been Updated Successfully');</script>");


        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            ExecuteQuery("DELETE FROM Mediclaim WHERE EmpID=@EmpID");
            ViewAllData();
            Response.Write("<script>alert('Your Data Has Been Deleted Successfully');</script>");


        }

        protected void btnViewAll_Click(object sender, EventArgs e)
        {
            ViewAllData();
        }
        private void ExecuteQuery(string query)
        {
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@EmpID", txtEmpID.Text);
                cmd.Parameters.AddWithValue("@EmpName", txtEmpName.Text);
                cmd.Parameters.AddWithValue("@EmpAddress", txtEmpAddress.Text);
                cmd.Parameters.AddWithValue("@EmpSalary", txtEmpSalary.Text);
                cmd.Parameters.AddWithValue("@AccountNumber", txtAccountNumber.Text);
                cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);
                cmd.Parameters.AddWithValue("@CurrentBalance", txtCurrentBalance.Text);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        private void ViewAllData()
        {
            SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True");
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Mediclaim", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvMediclaim.DataSource = dt;
            gvMediclaim.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
                {
                    con.Open();
                    string searchValue = txtSearch.Text.Trim();

                    string query = "SELECT * FROM Mediclaim WHERE EmpName LIKE @EmpName";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@EmpName", "%" + searchValue + "%");

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        gvMediclaim.DataSource = dt;
                        gvMediclaim.DataBind();
                    }
                    else
                    {
                        ViewAllData(); // Keep existing data if no search results are found
                        Response.Write("<script>alert('No records found');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
    }
    }


