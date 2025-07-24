using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OCWMS
{
    public partial class AllowanceEmp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnFetch_Click(object sender, EventArgs e)
        {
            string empID = txtEmpID.Text;
            string empName = txtEmpName.Text;
            string allowanceType = ddlAllowanceType.SelectedValue;

            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                con.Open();
                string query = "SELECT BasicSalary, AllowanceRate, AllowanceAmount, Status FROM Allowances WHERE EmpID=@EmpID AND EmpName=@EmpName AND AllowanceType=@AllowanceType";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@EmpID", empID);
                cmd.Parameters.AddWithValue("@EmpName", empName);
                cmd.Parameters.AddWithValue("@AllowanceType", allowanceType);

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    txtBasicSalary.Text = reader["BasicSalary"].ToString();
                    txtAllowanceRate.Text = reader["AllowanceRate"].ToString();
                    txtAllowanceAmount.Text = reader["AllowanceAmount"].ToString();
                    txtStatus.Text = reader["Status"].ToString();
                }
                else
                {
                    txtBasicSalary.Text = "";
                    txtAllowanceRate.Text = "";
                    txtAllowanceAmount.Text = "";
                    txtStatus.Text = "";
                }
            }
        }

        protected void btnRequest_Click(object sender, EventArgs e)
        {
            string empID = txtEmpID.Text;
            string empName = txtEmpName.Text;
            string allowanceType = ddlAllowanceType.SelectedValue;
            string month = ddlMonth.SelectedValue;
            string allowanceAmount = txtAllowanceAmount.Text;

            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                con.Open();
                string query = "INSERT INTO AllowanceRequest (EmpID, EmpName, AllowanceType, Month, AllowanceAmount, Status) VALUES (@EmpID, @EmpName, @AllowanceType, @Month, @AllowanceAmount, 'Pending')";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@EmpID", empID);
                cmd.Parameters.AddWithValue("@EmpName", empName);
                cmd.Parameters.AddWithValue("@AllowanceType", allowanceType);
                cmd.Parameters.AddWithValue("@Month", month);
                cmd.Parameters.AddWithValue("@AllowanceAmount", allowanceAmount);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Your Request Has been Sent Successfully');</script>");


            }

        }
    }
}
