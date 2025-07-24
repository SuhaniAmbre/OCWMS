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
    public partial class AlloEmp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadNotifications();
            }
        }
        private void LoadNotifications()
        {
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"C:\\Users\\Suhani Ambre\\OneDrive\\ドキュメント\\Project\\OCWMS\\OCWMS\\App_Data\\DB.mdf\";Integrated Security=True"))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT EmpName, AllowanceAmount, AllowanceType,Month, Status, Message FROM AllowanceNotification", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvNotifications.DataSource = dt;
                gvNotifications.DataBind();
            }
        }
        

        protected void gvNotifications_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

       
    }
}