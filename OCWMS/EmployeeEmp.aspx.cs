using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OCWMS
{
    public partial class EmployeeEmp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

           
            }
        protected void txtEmployeeName_TextChanged(object sender, EventArgs e)
        {
            string name = txtEmpName.Text.Trim();
            if (!string.IsNullOrEmpty(name))
            {
                string empID = GenerateEmployeeID(name);
                txtEmpID.Text = empID;
            }
        }

        private string GenerateEmployeeID(string name)
        {
            // Extract first 3 letters (uppercase)
            string prefix = name.Length >= 3 ? name.Substring(0, 3).ToUpper() : name.ToUpper();

            // Generate a random 4-digit number
            Random random = new Random();
            int randomNumber = random.Next(1000, 9999);

            // Combine to create Employee ID
            return prefix + randomNumber;
        }


        protected void btnInsert_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (!string.IsNullOrEmpty(txtDOB.Text))
                {
                    DateTime dob = Convert.ToDateTime(txtDOB.Text);
                    int age = DateTime.Now.Year - dob.Year;

                    if (DateTime.Now < dob.AddYears(age))
                    {
                        age--;
                    }
                    txtAge.Text = age.ToString(); // Assign Age to the TextBox
                }
            }
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
                {
                    string query = "INSERT INTO Employees (EmpID,EmpName, Gender, DOB, Age, PhoneNumber, Address, Email, Department, Position, Salary) VALUES " +
                                   "(@EmpID,@EmpName, @Gender, @DOB, @Age, @PhoneNumber, @Address, @Email, @Department, @Position, @Salary)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@EmpID", txtEmpID.Text);
                    cmd.Parameters.AddWithValue("@EmpName", txtEmpName.Text);
                    cmd.Parameters.AddWithValue("@Gender", ddlGender.SelectedValue);
                    cmd.Parameters.AddWithValue("@DOB", txtDOB.Text);
                    cmd.Parameters.AddWithValue("@Age", txtAge.Text);
                    cmd.Parameters.AddWithValue("@PhoneNumber", txtPhoneNumber.Text);
                    cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@Department", ddlDepartment.SelectedValue);
                    cmd.Parameters.AddWithValue("@Position", ddlPosition.SelectedValue);
                    cmd.Parameters.AddWithValue("@Salary", txtSalary.Text);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                Response.Write("<script>alert('Your Data Has Been Inserted Successfully');</script>");
            }
            }
        
        

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtEmpID.Text))
            {
                lblMessage.Text = "Please enter Employee ID to update.";
                return;
            }

            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                string query = "UPDATE Employees SET EmpName=@EmpName, Gender=@Gender, DOB=@DOB, Age=@Age, PhoneNumber=@PhoneNumber, " +
                               "Address=@Address, Email=@Email, Department=@Department, Position=@Position, Salary=@Salary WHERE EmpID=@EmpID";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@EmpID", txtEmpID.Text);
                cmd.Parameters.AddWithValue("@EmpName", txtEmpName.Text);
                cmd.Parameters.AddWithValue("@Gender", ddlGender.SelectedValue);
                cmd.Parameters.AddWithValue("@DOB", txtDOB.Text);
                cmd.Parameters.AddWithValue("@Age", txtAge.Text);
                cmd.Parameters.AddWithValue("@PhoneNumber", txtPhoneNumber.Text);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Department", ddlDepartment.SelectedValue);
                cmd.Parameters.AddWithValue("@Position", ddlPosition.SelectedValue);
                cmd.Parameters.AddWithValue("@Salary", txtSalary.Text);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            ClearFields();
            Response.Write("<script>alert('Your Data Has Been Updated Successfully');</script>");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtEmpID.Text))
            {
                lblMessage.Text = "Please enter Employee ID to delete.";
                return;
            }

            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                string query = "DELETE FROM Employees WHERE EmpID=@EmpID";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@EmpID", txtEmpID.Text);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            ClearFields();
            Response.Write("<script>alert('Your Data Has Been Deleted Successfully');</script>");
        }
     

        // 🔹 Clear Input Fields
        private void ClearFields()
        {
            txtEmpID.Text = "";
            txtEmpName.Text = "";
            ddlGender.SelectedIndex = 0;
            txtDOB.Text = "";
            txtAge.Text = "";
            txtPhoneNumber.Text = "";
            txtAddress.Text = "";
            txtEmail.Text = "";
            ddlDepartment.SelectedIndex = 0;
            ddlPosition.SelectedIndex = 0;
            txtSalary.Text = "";
        }
    }
    }
