using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalOdev3_SadiEnisGucluer
{
    public partial class LogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            string Constring = @"Data Source = .\SQLEXPRESS;Initial Catalog = sahibindenData; Integrated Security = True";
            bool login = false;
            using (SqlConnection con = new SqlConnection(Constring))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("P_UserLogin", con)) 
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@username",txtUsername.Text));
                    cmd.Parameters.Add(new SqlParameter("@password", txtPassword.Text));
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        if (ds.Tables.Count > 0)
                        {
                            DataTable dt = ds.Tables[0];
                            if (dt.Rows.Count > 0)
                            {
                                // Aşağıdaki if blokları farklı rollere göre farklı yetkili sayfalara iletiyor.

                                DataRow dr = dt.Rows[0];
                                if (dr["LOGIN_ACCEPTED"].ToString() == "admin")
                                {
                                    Session["loginbasarili"] = "admin";
                                    Session["kullaniciadi"] = txtUsername.Text;
                                    login = true;
                                    Response.Redirect("~/MainPages/MainAdminPage.aspx");
                                }
                                else if (dr["LOGIN_ACCEPTED"].ToString() == "member")
                                {
                                    Session["loginbasarili"] = "member";
                                    Session["kullaniciadi"] = txtUsername.Text;
                                    login = true;
                                    Response.Redirect("~/MainPages/MainMemberPage.aspx");
                                }
                                else if (dr["LOGIN_ACCEPTED"].ToString() == "galery")
                                {
                                    Session["loginbasarili"] = "galery";
                                    Session["kullaniciadi"] = txtUsername.Text;
                                    login = true;
                                    Response.Redirect("~/MainPages/MainGaleriPage.aspx");
                                }
                                else if (dr["LOGIN_ACCEPTED"].ToString() == "emlak")
                                {
                                    Session["loginbasarili"] = "emlak";
                                    Session["kullaniciadi"] = txtUsername.Text;
                                    login = true;
                                    Response.Redirect("~/MainPages/MainEmlakPage.aspx");
                                }
                                else if (dr["LOGIN_ACCEPTED"].ToString() == "dealer")
                                {
                                    Session["loginbasarili"] = "dealer";
                                    Session["kullaniciadi"] = txtUsername.Text;
                                    login = true;
                                    Response.Redirect("~/MainPages/MainBayiPage.aspx");
                                }
                            }
                        }
                    }
                }
            }
            string scrpt = "alert('Kullanıcı adı veya şifre yanlış!!');";         // Giriş hatalı ise JavaScript alert kodu ile uyarı verecektir.
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertBilgi", scrpt, true);
        }
    }
}