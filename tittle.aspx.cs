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
    public partial class tittle : System.Web.UI.Page
    {
        DataClasses1DataContext dc = new DataClasses1DataContext();
        string strCnn = WebConfigurationManager.ConnectionStrings["BTLcnn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            int chudeID = Convert.ToInt32(Request["id"]);
            if (!Page.IsPostBack)
            {
                dlTieude.DataSource = getBaidangNew();
                dlTieude.DataBind();
                rpChude.DataSource = dc.spChude_getbyID(chudeID);
                rpChude.DataBind();
            }
        }
        private DataSet getBaidangNew()
        {
            int chudeID = Convert.ToInt32(Request["id"]);
            try
            {
                using (SqlConnection cnn = new SqlConnection(strCnn))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.CommandText = "spBaidang_getbyChude";
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Connection = cnn;
                        cmd.Parameters.AddWithValue("FK_iChudeID", chudeID) ;
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