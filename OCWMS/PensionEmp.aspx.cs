using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OCWMS
{
    public partial class PensionEmp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO Pension VALUES (@EmpID, @EmpName, @BankName, @AccountNumber, @AccountStatus, @TransactionType, @NomineeName)", con);
                cmd.Parameters.AddWithValue("@EmpID", txtEmpID.Text);
                cmd.Parameters.AddWithValue("@EmpName", txtEmpName.Text);
                cmd.Parameters.AddWithValue("@BankName", txtBankName.Text);
                cmd.Parameters.AddWithValue("@AccountNumber", txtAccountNumber.Text);
                cmd.Parameters.AddWithValue("@AccountStatus", ddlAccountStatus.SelectedValue);
                cmd.Parameters.AddWithValue("@TransactionType", ddlTransactionType.SelectedValue);
                cmd.Parameters.AddWithValue("@NomineeName", txtNomineeName.Text);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Your Data Has Been Inserted Successfully');</script>");
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                SqlCommand cmd = new SqlCommand("UPDATE Pension SET EmpName=@EmpName, BankName=@BankName, AccountNumber=@AccountNumber, AccountStatus=@AccountStatus, TransactionType=@TransactionType, NomineeName=@NomineeName WHERE EmpID=@EmpID", con);
                cmd.Parameters.AddWithValue("@EmpID", txtEmpID.Text);
                cmd.Parameters.AddWithValue("@EmpName", txtEmpName.Text);
                cmd.Parameters.AddWithValue("@BankName", txtBankName.Text);
                cmd.Parameters.AddWithValue("@AccountNumber", txtAccountNumber.Text);
                cmd.Parameters.AddWithValue("@AccountStatus", ddlAccountStatus.SelectedValue);
                cmd.Parameters.AddWithValue("@TransactionType", ddlTransactionType.SelectedValue);
                cmd.Parameters.AddWithValue("@NomineeName", txtNomineeName.Text);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Your Data Has Been Updated Successfully');</script>");
            }
        }

    }
}