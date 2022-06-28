using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_webNC
{
    public partial class index : System.Web.UI.Page
    {
        string strCnn = WebConfigurationManager.ConnectionStrings["BTLcnn"].ConnectionString;
        DataClasses1DataContext dc = new DataClasses1DataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                dlTieude.DataSource = getBaidangNew();
                dlTieude.DataBind();
                rpTinphu.DataSource = dc.spBaidang_random();
                rpTinphu.DataBind();
            }    
        }
        private DataSet getBaidangNew()
        {
            try
            {
                using (SqlConnection cnn = new SqlConnection(strCnn))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.CommandText = "spBaidang_new";
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Connection = cnn;
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            DataSet dsMenu = new DataSet();
                            da.Fill(dsMenu);
                            return dsMenu;
                        }
                    }
                }
            }
            catch (Exception loi)
            {
                
                Response.Write("loi la" + loi);
                return null;
            }
        }
    }
}