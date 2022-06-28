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
    public partial class find : System.Web.UI.Page
    {
        string strCnn = WebConfigurationManager.ConnectionStrings["BTLcnn"].ConnectionString;
        DataClasses1DataContext dc = new DataClasses1DataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
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
                try
                {
                    int find = Convert.ToInt32(Request["find"]);
                    //int chudeID = Convert.ToInt32(Request["id"]);
                    using (SqlConnection cnn = new SqlConnection(strCnn))
                    {
                        using (SqlCommand cmd = new SqlCommand())
                        {
                            cmd.CommandText = "spBaidang_find";
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Connection = cnn;
                            cmd.Parameters.AddWithValue("sTieude", Request["find"].ToString());
                            cmd.Parameters.AddWithValue("dNgaydang", Request["find"].ToString());
                            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                            {
                                DataSet dsMenu = new DataSet();
                                da.Fill(dsMenu);
                                return dsMenu;
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                   
                    using (SqlConnection cnn = new SqlConnection(strCnn))
                    {
                        using (SqlCommand cmd = new SqlCommand())
                        {
                            cmd.CommandText = "spBaidang_find";
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Connection = cnn;
                            cmd.Parameters.AddWithValue("sTieude", Request["find"].ToString());
                            cmd.Parameters.AddWithValue("dNgaydang", "");
                            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                            {
                                DataSet dsMenu = new DataSet();
                                da.Fill(dsMenu);
                                return dsMenu;
                            }
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