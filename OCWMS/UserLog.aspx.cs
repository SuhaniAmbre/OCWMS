using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OCWMS
{
    public partial class UserLog : System.Web.UI.Page
    {
        SqlConnection conn=new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string username = usertxt.Text.Trim();

            string check = "select count(*) from [UserRegister] where email='" + usertxt.Text + "' and password='" + passtxt.Text + "' ";
            SqlCommand com = new SqlCommand(check, conn);
            conn.Open();
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
            conn.Close();
            if (temp == 1)
            {
                Session["UserName"] = username;
                Response.Redirect("HomeEmp.aspx");
            }
            else
            {
                Label4.ForeColor = System.Drawing.Color.Red;
                Label4.Text = "Your Email_Id or Password is Invalid";

            }
        }
    }
}