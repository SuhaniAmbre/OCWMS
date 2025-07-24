using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OCWMS
{
    public partial class PPFEmp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                string query = "SELECT EmpID, EmpName, AccountNumber, CurrentBalance FROM PPF WHERE EmpID=@Search OR EmpName=@Search";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Search", txtSearch.Text);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    txtEmpID.Text = reader["EmpID"].ToString();
                    txtEmpName.Text = reader["EmpName"].ToString();
                    txtAccountNumber.Text = reader["AccountNumber"].ToString();
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
                string query = "SELECT CurrentBalance FROM PPF WHERE EmpID = @EmpID";
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
            decimal currentBalance = 0;
            decimal requestAmount = Convert.ToDecimal(txtAmount.Text);

            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                try
                {
                    con.Open();

                    // **Step 1: Fetch Current Balance**
                    string balanceQuery = "SELECT CurrentBalance FROM PPF WHERE EmpID = @EmpID";
                    SqlCommand balanceCmd = new SqlCommand(balanceQuery, con);
                    balanceCmd.Parameters.AddWithValue("@EmpID", txtEmpID.Text);

                    object result = balanceCmd.ExecuteScalar();

                    if (result != null)
                    {
                        currentBalance = Convert.ToDecimal(result);
                    }
                    else
                    {
                        Response.Write("<script>alert('Error fetching balance');</script>");
                        return;
                    }

                    // **Step 2: Check if the request amount is valid**
                    if (requestAmount > currentBalance)
                    {
                        Response.Write("<script>alert('Insufficient balance!');</script>");
                        return;
                    }

                    // **Step 3: Deduct Request Amount from Current Balance**
                    decimal updatedBalance = currentBalance - requestAmount;

                    // **Step 4: Insert Claim Request into PPFRequests Table**
                    string insertQuery = "INSERT INTO PPFRequests (EmpID, EmpName, RequestAmount, RequestDate, Status) VALUES (@EmpID, @EmpName, @RequestAmount, @RequestDate, 'Pending')";

                    SqlCommand insertCmd = new SqlCommand(insertQuery, con);
                    insertCmd.Parameters.AddWithValue("@EmpID", txtEmpID.Text);
                    insertCmd.Parameters.AddWithValue("@EmpName", txtEmpName.Text);
                    insertCmd.Parameters.AddWithValue("@RequestAmount", requestAmount);
                    insertCmd.Parameters.AddWithValue("@RequestDate", DateTime.Now);

                    insertCmd.ExecuteNonQuery();

                    // **Step 5: Update Current Balance in PPF Table**
                    string updateQuery = "UPDATE PPF SET CurrentBalance = @UpdatedBalance WHERE EmpID = @EmpID";
                    SqlCommand updateCmd = new SqlCommand(updateQuery, con);
                    updateCmd.Parameters.AddWithValue("@UpdatedBalance", updatedBalance);
                    updateCmd.Parameters.AddWithValue("@EmpID", txtEmpID.Text);

                    updateCmd.ExecuteNonQuery();

                    // **Step 6: Update UI on Employee Side**
                    txtBalance.Text = "₹" + updatedBalance.ToString();

                    // **Step 7: Show Success Message**
                    Response.Write("<script>alert('Your Request Has Been Sent Successfully. Your new balance is ₹" + updatedBalance + "');</script>");
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }
                finally
                {
                    con.Close();
                }
            }
        }
    }
}