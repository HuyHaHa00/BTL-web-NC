using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace BTL_webNC
{
    public partial class IndexPage : System.Web.UI.MasterPage
    {
        string strCnn = WebConfigurationManager.ConnectionStrings["BTLcnn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                
                rpBaidang.DataSource = getChude();
                rpBaidang.DataBind();
                //Repeater1.DataSource = getChude();
                //Repeater1.DataBind();
                if(Session["dangnhap"] != null)
                {
                    loginLink.InnerHtml = "";
                    registerLink.InnerHtml = "";
                    btnLogout.Text= "Đăng xuất (" + Session["dangnhap"].ToString() + ")";
                    quanli.Style.Add("display", "inline-block");
                    if (Session["dangnhap"].ToString() == "admin")
                    {
                        lienHe.InnerHtml = "Đăng bài";
                        lienHe.HRef = "insert.aspx";                        
                    }
                }  
                
               
            }  
            if(Page.IsPostBack)
            {
                if (Session["dangnhap"] == null)
                {
                    loginLink.InnerHtml = "Đăng nhập ";
                    registerLink.InnerHtml = "/ Đăng ký";
                }
            }    
        }
        private DataSet getChude()
        {
            try
            {
                using (SqlConnection cnn = new SqlConnection (strCnn))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cnn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "spChude_get";
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
                return null;
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            login.dangnhap.hoten = null;
            Session["dangnhap"] = null;
            btnLogout.Text = "";
            Page.Response.Redirect("index.aspx");
        }

        protected void btnTimkiem_Click(object sender, EventArgs e)
        {
            if(!string.IsNullOrEmpty(txtTimkiem.Text))
            {
                Response.Redirect("find.aspx?find="+txtTimkiem.Text);
            }
            else
            {
                lbTimkiem.InnerText = "Bạn cần nhập thông tin để tìm kiếm";
            }
        }
    }
}