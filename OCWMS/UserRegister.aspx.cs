using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OCWMS
{
    public partial class UserRegister : System.Web.UI.Page
    {
        SqlConnection conn=new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string ins = "insert into [UserRegister](name,address,age,email,password,phone)values('" + txtName.Text + "','" + txtAddress.Text + "','" + txtAge.Text + "','" + txtEmail.Text + "','" + txtPassword.Text + "','" + txtPhone.Text + "') ";
            SqlCommand com = new SqlCommand(ins, conn);
            conn.Open();
            com.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("UserLog.aspx");

        }
    }
}