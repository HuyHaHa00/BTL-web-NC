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
    

    public partial class insert : System.Web.UI.Page
    {
        DataClasses1DataContext dc = new DataClasses1DataContext();
       
        string strCnn = WebConfigurationManager.ConnectionStrings["BTLcnn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            int suaID = Convert.ToInt32(Request["suaID"]);
            if (!Page.IsPostBack)
            {
                ddlChude.DataTextField = "sTenchude";
                ddlChude.DataValueField = "PK_iChudeID";
                ddlChude.DataSource = getDangbai();
                ddlChude.DataBind();
            }    
            if (Session["sua"]!=null)
            {
                btnInsert.Text = "Sửa";             
                rpBaidang.DataSource = dc.spBaidang_getbyID(suaID);
                rpBaidang.DataBind();
                lbDangbai.Text = "Bài thay thế";
            }
            else
            {
                lbDangbai.Text = "Thêm bài mới";
            }  
        }
        private DataSet getDangbai()
        {
            try
            {
                using (SqlConnection cnn = new SqlConnection(strCnn))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = cnn;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "spChude_get";
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            DataSet dsChude = new DataSet();
                            da.Fill(dsChude);
                            if (dsChude.Tables[0].Rows.Count > 0)
                                return dsChude;
                            else
                                return null;
                        }

                    }
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }
       
        protected void btnInsert_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath("~/img/");
            if ((txtTenbantin.Text != "") && (txtNoidung.Text != "") && ava.HasFile )
            {
                try
                {
                    string fName = DateTime.Now.ToString("h-m") +ava.FileName;
                    string fname = fName.Trim();
                    ava.SaveAs(path + fName);
                    using (SqlConnection cnn = new SqlConnection(strCnn))

                    {
                        cnn.Open();
                        if(Session["sua"]==null)
                        {
                            string proc = "spBaidang_Insert";
                            using (SqlCommand cmd = new SqlCommand(proc, cnn))
                            {
                                cmd.CommandType = CommandType.StoredProcedure;
                                cmd.Parameters.AddWithValue("@sTieude", txtTenbantin.Text);
                                cmd.Parameters.AddWithValue("@sNoidung", txtNoidung.Text);
                                cmd.Parameters.AddWithValue("@iLuotxem", 0);
                                cmd.Parameters.AddWithValue("@dNgaydang", DateTime.Now);
                                cmd.Parameters.AddWithValue("@FK_iChudeID", Convert.ToInt32(ddlChude.SelectedValue));
                                cmd.Parameters.AddWithValue("@sAnh", fname);
                                cmd.ExecuteNonQuery();
                                cnn.Close();
                            }
                        } 
                        else if (Session["sua"] != null)
                        {
                            int suaID = Convert.ToInt32(Request["suaID"]);
                            string proc = "spBaidang_Update";
                            using (SqlCommand cmd = new SqlCommand(proc, cnn))
                            {
                                cmd.CommandType = CommandType.StoredProcedure;
                                cmd.Parameters.AddWithValue("@PK_iBaidangID", suaID);
                                cmd.Parameters.AddWithValue("@sTieude", txtTenbantin.Text);
                                cmd.Parameters.AddWithValue("@sNoidung", txtNoidung.Text);
                                cmd.Parameters.AddWithValue("@iLuotxem", 0);
                                cmd.Parameters.AddWithValue("@dNgaydang", DateTime.Now);
                                cmd.Parameters.AddWithValue("@FK_iChudeID", Convert.ToInt32(ddlChude.SelectedValue));
                                cmd.Parameters.AddWithValue("@sAnh", fname);
                                cmd.ExecuteNonQuery();
                                cnn.Close();
                            }
                        }


                    }
                    if (txtNoidung.Text!=null)
                    {
                        txtTenbantin.Text = "";
                        txtNoidung.Text = "";
                    }
                    Session["sua"] = null;
                    Response.Redirect("index.aspx");
                    
                }
                catch (Exception ex)
                {

                }
                //dc.spBaidang_Insert(txtTenbantin.Text, txtNoidung.Text, 0, DateTime.Now, Convert.ToInt32(ddlChude.SelectedValue));
            }
            else
            {
                Response.Write("<script>alert('Đăng bài thất bại')</script>");
                return;
            }
        }
    }
}