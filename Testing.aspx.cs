using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_webNC
{
    public partial class Testing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strCnn = WebConfigurationManager.ConnectionStrings["BTLcnn"].ConnectionString;
            using (SqlConnection cnn = new SqlConnection(strCnn))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = cnn;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "select * from tblBaiDang where dNgaydang between '2022-04-01' and '2022-04-09'";
                using (SqlDataAdapter adt = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    adt.Fill(dt);
                    /*foreach(DataRow row in dt.Rows)
                    {
                        string date1 = row[4].ToString("dd/MM/yyyy");
                        row[4] = date1;
                        string s = row[4].ToString();
                    }*/
                    rpbaidang.DataSource = dt;
                    rpbaidang.DataBind();
                    cnn.Close();
                    ddl1.DataSource = dt;
                    ddl1.DataTextField = "dNgaydang";
                    ddl1.DataValueField = "PK_iBaidangID";
                    ddl1.DataBind();
                    cnn.Close();
                }
            }

            using (SqlConnection cnn = new SqlConnection(strCnn))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = cnn;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "select * from tblUser";
                using (SqlDataAdapter adt = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    adt.Fill(dt);
                    grv1.DataSource = dt;
                    grv1.DataBind();
                }
            }
        }
    }
}