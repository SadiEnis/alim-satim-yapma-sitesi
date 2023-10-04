using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalOdev3_SadiEnisGucluer
{
    public partial class MainAdminPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Tablolar();
            try    // Giriş yapan kullanıcının rolüne göre girişini onaylıyor. Zaten girişi onaylı olsa da bu kısımda tekrar kontrol yaparak garantiye alıyorum.
            {               // Bu kodda admin rolü için geçerli kod bulunuyor diğer rollere uygun ana sayfalar ise o rollere uygun değerlendirildi.
                if (Session["loginbasarili"] != null && Session["loginbasarili"] == "admin")
                {
                    var x = "1";
                    lblUser.Text = Session["kullaniciadi"].ToString();
                }
                else
                {
                    Response.Redirect("~/LogIn.aspx");
                }
            }
            catch
            {
                Response.Redirect("~/LogIn.aspx");
            }
            
        }
        protected void btnLogOut_Click(object sender, EventArgs e)
        {// Log Out butonuna basıldığı taktirde bu kod bloğu çalışarak kullanıcın çıkışı yapıyor. Örneğini çekcek olduğum videoda göstereceğim. LogOut olmuş kullanıcı GuestPage dışında diğer ana sayfalara giremiyor.
                Session.Abandon();
                Session.Remove("loginbasarili");
                Session.Remove("kullaniciadi");
                Response.Redirect("~/MainPages/MainGuestPage.aspx");
        }
        protected void Tablolar()
        {
            string strCon = @"Data Source = .\SQLEXPRESS;Initial Catalog = sahibindenData; Integrated Security = True";
            string cumle1 = "SELECT * FROM tableVasita ORDER BY aracFavori DESC";
            string cumle2 = "SELECT * FROM tableEmlakEv ORDER BY evFavori DESC";
            string cumle3 = "SELECT * FROM tableEmlakArsa ORDER BY arsaFavori DESC";

            using (SqlConnection con = new SqlConnection(strCon))
            {
                con.Open();
                using (SqlDataAdapter da = new SqlDataAdapter(cumle1, con))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    grid1.DataSource = ds.Tables[0];
                    grid1.DataBind();
                }
                using (SqlDataAdapter da = new SqlDataAdapter(cumle2, con))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    grid2.DataSource = ds.Tables[0];
                    grid2.DataBind();
                }
                using (SqlDataAdapter da = new SqlDataAdapter(cumle3, con))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    grid3.DataSource = ds.Tables[0];
                    grid3.DataBind();
                }
            }
        }
    }
}