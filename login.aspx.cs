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
    public partial class login : System.Web.UI.Page
    {
        public class dangnhap
        {
            public static string hoten = "";
        }
        DataClasses1DataContext dc = new DataClasses1DataContext();
        string strCnn = WebConfigurationManager.ConnectionStrings["BTLcnn"].ConnectionString;
        //private List<User> danhsach;

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnDangnhap_Click(object sender, EventArgs e)
        {
            getTk();
            DataTable dt = getTk();
            if (dt.Rows.Count == 1)
            {
                Session["dangnhap"] = txtTaikhoan.Text;               
                //User us = new User();         
                //danhsach = (List<User>) Session["user"];
                //us.hoTen = txtTaikhoan.Text;
                //danhsach.Add(us);
                //Session["user"] = danhsach;
                dangnhap.hoten = txtTaikhoan.Text;
                Response.Redirect("index.aspx");
            }
            else
            {
                loidangnhap.Text = "Sai tên tài khoản hoặc mật khẩu!";
                return;
            }
        }
        public DataTable getTk()
        {
            using (SqlConnection Cnn = new SqlConnection(strCnn))
            {
                Cnn.Open();
                using (SqlCommand Cmd = new SqlCommand("spLogin_get", Cnn))
                {
          
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@sName", txtTaikhoan.Text);
                    Cmd.Parameters.AddWithValue("@sPassword", txtMatkhau.Text);
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
    }
}