using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OCWMS
{
    public partial class EPFEmp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtRequestDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                string query = "SELECT EmpID, EmpName, UANNumber, CurrentBalance FROM EPF WHERE EmpID=@Search OR EmpName=@Search";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Search", txtSearch.Text);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    txtEmpID.Text = reader["EmpID"].ToString();
                    txtEmpName.Text = reader["EmpName"].ToString();
                    txtUAN.Text = reader["UANNumber"].ToString();
                    txtBalance.Text = reader["CurrentBalance"].ToString();
                }
                else
                {
                    // Show message if not found
                }
                con.Close();
            }
        }

        protected void btnFetchBalance_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                string query = "SELECT CurrentBalance FROM EPF WHERE EmpID = @EmpID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@EmpID", txtEmpID.Text);

                con.Open();
                object result = cmd.ExecuteScalar();
                con.Close();

                if (result != null)
                {
                    txtBalance.Text = "₹" + result.ToString();
                }
                else
                {
                    txtBalance.Text = "No balance found!";
                }
            }
        }

        protected void btnClaim_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                con.Open();

                // 1️⃣ Fetch the current balance from EPF table
                string querySelect = "SELECT CurrentBalance FROM EPF WHERE EmpID = @EmpID";
                SqlCommand cmdSelect = new SqlCommand(querySelect, con);
                cmdSelect.Parameters.AddWithValue("@EmpID", txtEmpID.Text);
                object result = cmdSelect.ExecuteScalar();

                if (result != null)
                {
                    decimal currentBalance = Convert.ToDecimal(result); // Existing balance
                    decimal requestedAmount = Convert.ToDecimal(txtAmount.Text); // Amount requested by employee

                    if (requestedAmount > 0 && requestedAmount <= currentBalance) // Check valid request
                    {
                        decimal newBalance = currentBalance - requestedAmount; // Deduct amount

                        // 2️⃣ Update the new balance in EPF table (affects both Employee and Admin views)
                        string queryUpdate = "UPDATE EPF SET CurrentBalance = @NewBalance WHERE EmpID = @EmpID";
                        SqlCommand cmdUpdate = new SqlCommand(queryUpdate, con);
                        cmdUpdate.Parameters.AddWithValue("@NewBalance", newBalance);
                        cmdUpdate.Parameters.AddWithValue("@EmpID", txtEmpID.Text);
                        cmdUpdate.ExecuteNonQuery();

                        // 3️⃣ Insert request into EPFRequests table
                        string insertQuery = "INSERT INTO EPFRequests (EmpID, EmpName, UANNumber, RequestAmount, RequestDate, Status) VALUES (@EmpID, @EmpName, @UANNumber, @RequestAmount, @RequestDate, 'Pending')";
                        SqlCommand cmdInsert = new SqlCommand(insertQuery, con);
                        cmdInsert.Parameters.AddWithValue("@EmpID", txtEmpID.Text);
                        cmdInsert.Parameters.AddWithValue("@EmpName", txtEmpName.Text);
                        cmdInsert.Parameters.AddWithValue("@UANNumber", txtUAN.Text);
                        cmdInsert.Parameters.AddWithValue("@RequestAmount", requestedAmount);
                        cmdInsert.Parameters.AddWithValue("@RequestDate", txtRequestDate.Text);
                        cmdInsert.ExecuteNonQuery();

                        // 4️⃣ Update the balance textbox on Employee Side
                        txtBalance.Text = newBalance.ToString(); // Updated balance

                        // 5️⃣ Store Updated Balance in Session (for Admin Page)
                        Session["UpdatedBalance_" + txtEmpID.Text] = newBalance;

                        Response.Write("<script>alert('Your Request Has Been Sent Successfully! Updated Balance: ₹" + newBalance + "');</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid Request! Enter an amount within your balance.');</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Employee ID not found!');</script>");
                }
            }
        }
    }
}