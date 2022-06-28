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
    public partial class register : System.Web.UI.Page
    {
        DataClasses1DataContext dc = new DataClasses1DataContext();
        string strCnn = WebConfigurationManager.ConnectionStrings["BTLcnn"].ConnectionString;
        string img = "nu.jpg";
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if(Page.IsPostBack)
            {
                string hoten = Request["hoten"];
                uNtontai.Text = "";
                userName.Text = Request["username"];
                string name = Request["username"];
                string pass = Request["matkhau"];
                if (Request["gender"] == "Nam")
                {
                    img = "nam.jpg";
                }
                DataTable dt = getTk();
                if (dt.Rows.Count > 0)
                {
                    uNtontai.Text = "Tên đăng nhập đã tồn tại!";
                }
                else
                {

                    dc.spLogin_insert(name, pass, img, false, hoten);
                    uNtontai.Text = "Đăng ký thành công!";
                }
            }    
            
            getTk();  
        }
        public DataTable getTk()
        {
            using (SqlConnection Cnn = new SqlConnection(strCnn))
            {
                Cnn.Open();
                using (SqlCommand Cmd = new SqlCommand("spLogin_getName", Cnn))
                {
                    
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@sName", userName.Text);
                    Cmd.ExecuteNonQuery();
                    using (SqlDataAdapter Da = new SqlDataAdapter(Cmd))
                    {
                        DataTable t = new DataTable("tblUser");
                        Da.Fill(t);
                        return t;
                    }
                                
                }
                Cnn.Close();

            }
        }

        protected void bt_Click(object sender, EventArgs e)
        {
           
        }
    }
}