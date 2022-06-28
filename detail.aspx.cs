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
    public partial class detail : System.Web.UI.Page
    {
        string strCnn = WebConfigurationManager.ConnectionStrings["BTLcnn"].ConnectionString;
        DataClasses1DataContext dc = new DataClasses1DataContext();
        //private List<User> danhsach;
        protected void Page_Load(object sender, EventArgs e)
        {
            checkBL();
            int? luotxem = null;
            int baidangID = Convert.ToInt32(Request["BaidangID"]);
            int chudeID = Convert.ToInt32(Request["ChudeID"]);

            if(!Page.IsPostBack)
            {
                dc.spBaidang_Hienluotxem(baidangID, ref luotxem);
                if (luotxem == null)
                {
                    luotxem = 0;
                }
                int hienluotxem = Convert.ToInt32(luotxem) + 1;
                dc.spBaidang_Luotxem(hienluotxem, baidangID);
                
                rpBaidang.DataSource = dc.spBaidang_getbyID(baidangID);
                rpBaidang.DataBind();
                //dlBinhluan.DataSource= dc.spBinhluan_getbyBaidang(baidangID);
                dlBinhluan.DataSource = getbinhluan();
                dlBinhluan.DataBind();
                rpNguoibinhluan.DataSource = dc.spLogin_getName(login.dangnhap.hoten);
                rpNguoibinhluan.DataBind();


                rpID.DataSource = dc.spLogin_getName(login.dangnhap.hoten);
                rpID.DataBind();
                dlTinkhac.DataSource = getBaidang();
                dlTinkhac.DataBind();
            }
            int binhluanID = Convert.ToInt32(Request["binhluanID"]);

            if (binhluanID > 0)
            {
                dc.spBinhluan_delete(binhluanID);
                Response.Redirect("detail.aspx?BaidangID="+baidangID);
                binhluanID = 0;
            }


        }

        private DataTable getbinhluan()
        {
            int baidangID = Convert.ToInt32(Request["BaidangID"]);
            using (SqlConnection cnn = new SqlConnection(strCnn))
            {
                cnn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = cnn;
                    cmd.CommandText = "spBinhluan_getbyBaidang";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@FK_iBaidangID", baidangID);
                    cmd.ExecuteNonQuery();
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        return dt ;
                    } 
                    
                }
                cnn.Close();
            }    
        }
        private DataTable getBaidang()
        {
            using (SqlConnection cnn = new SqlConnection(strCnn))
            {
                cnn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = cnn;
                    cmd.CommandText = "spBaidang_randomTop5";
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        return dt;
                    }
                }
                cnn.Close();
            }

        }
        private void checkBL ()
        {
            int baidangID = Convert.ToInt32(Request["BaidangID"]);
            using (SqlConnection cnn = new SqlConnection(strCnn))
            {
                cnn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = cnn;
                    cmd.CommandText = "spBinhluan_getbyBaidang";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@FK_iBaidangID", baidangID);
                    cmd.ExecuteNonQuery();
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                    }
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while(dr.Read())
                        {
                            if(dr.HasRows)
                            {
                                
                                if (dr.GetValue(5).ToString()== login.dangnhap.hoten)
                                {
                                    //Response.Write("xin chàoooo" + dr.GetValue(5).ToString());
                                }    
                            }    
                        }    
                    }    

                }
                cnn.Close();
            }
        }

        protected void btnSua_Click(object sender, EventArgs e)
        {
            int baidangID = Convert.ToInt32(Request["BaidangID"]);
            Session["sua"] = 1;
            Response.Redirect("insert.aspx?suaID="+baidangID);
        }

        protected void btnCmt_Click(object sender, EventArgs e)
        {
            if(Session["dangnhap"]!= null)
            {
                int baidangID = Convert.ToInt32(Request["BaidangID"]);
                dc.spBinhluan_Insert(txtCmt.Text, baidangID, login.dangnhap.hoten);
                txtCmt.Text = "";
                Page.Response.Redirect(Page.Request.Url.ToString(), true);
            }    
            else
            {
                Response.Write("<script>alert('Bạn cần đăng nhập để bình luận!')</script>");
            }    

        }

        //User us = new User();
        //danhsach = (List<User>)Session["user"];
        //foreach(User item in danhsach)
        //{ Response.Write("Xin chào" + item.hoTen); }
        //Response.Write("Xin chào");
        //if (1==1)
        //{
        //    Response.Write("Chào" + Request.QueryString["id"].ToString());
        //}
    }
}