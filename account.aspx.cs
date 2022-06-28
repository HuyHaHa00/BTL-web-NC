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
    public partial class account : System.Web.UI.Page
    {
        string strCnn = WebConfigurationManager.ConnectionStrings["BTLcnn"].ConnectionString;
        DataClasses1DataContext dc = new DataClasses1DataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            
        }
        private DataTable getUser()
        {
            using(SqlConnection cnn = new SqlConnection(strCnn) )

            {
                cnn.Open();
                using(SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = cnn;
                    cmd.CommandText = "spLogin_get";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("sName", txtTaikhoan.Text);
                    cmd.Parameters.AddWithValue("sPassword", txtMatkhau.Text);
                    cmd.ExecuteNonQuery();
                    using(SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        return dt;
                    }    
                }    
            }    
        }
        protected void cvMkmoi_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (txtMkmoi.Text.Length < 6)
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }

        protected void btnDangnhap_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (!Page.IsValid)
                return;
            getUser();
            if (getUser().Rows.Count > 0)
            {
                dc.spLogin_Update1(txtTaikhoan.Text, txtMkmoi.Text, txtTen.Text);
                loidangnhap.Text = "Đổi thông tin thành công!";
            }
            else
            {
                loidangnhap.Text = "Tên đăng nhập hoặc mật khẩu không chính xác!";
            }
        }
    }
}