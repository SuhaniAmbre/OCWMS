using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OCWMS
{
    public partial class Site2 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin"] != null)
            {
                lblUserName.Text = "Welcome," + Session["Admin"].ToString();
            }
            else
            {
                lblUserName.Text = "";
            }

        }
    }
}