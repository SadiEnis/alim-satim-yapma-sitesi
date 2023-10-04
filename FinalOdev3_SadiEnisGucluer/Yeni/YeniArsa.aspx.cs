using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalOdev3_SadiEnisGucluer
{
    public partial class Yeniarsa : System.Web.UI.Page
    {
        string connectString = @"Data Source = .\SQLEXPRESS;Initial Catalog = sahibindenData; Integrated Security = True";
        string strEvetHayir = "";
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnEkle_Click(object sender, EventArgs e)
        {
            bool evetMi = false;
            evetMi = chkEvetHayir.Checked;
            if (evetMi)
                strEvetHayir = "E";
            else
                strEvetHayir = "H";

            string cumlecik = "";
            cumlecik = "INSERT INTO tableEmlakArsa (arsaM2,arsaIl,arsaIlce,arsaMahalle,arsaImar,arsaAdaParsel,arsaAdres,arsaFiyat,arsaNumSorgu)" +
                " VALUES ('" + txtM2.Text + "','" + txtIl.Text + "','" + txtIlce.Text + "','" + txtMahalle.Text + "','" + txtImar.Text + "','" + txtAdaParsel.Text + "','" + txtAdres.Text + "','" + txtFiyat.Text + "','" + strEvetHayir + "')";

            string iliski = "INSERT INTO tableSatilikArsa (arsaID,saticiID) VALUES ((SELECT MAX(arsaID) FROM tableEmlakArsa),'100')";

            using (SqlConnection con = new SqlConnection(connectString))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand(cumlecik,con))
                {
                    cmd.CommandType = CommandType.Text;
                    int affectRows = cmd.ExecuteNonQuery();
                    if (affectRows > 0)
                    {
                        string scrpt = "alert('Kayıt işlemi başarılı bir şekilde tamamlandı.');";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertBilgi", scrpt, true);
                        TabloOlustur();
                    }
                }
                using (SqlCommand cmd = new SqlCommand(iliski, con))
                {
                    cmd.CommandType = CommandType.Text;
                    int affectRows = cmd.ExecuteNonQuery();
                }
            }
            txtM2.Text = "";
            txtIl.Text = "";
            txtIlce.Text = "";
            txtMahalle.Text = "";
            txtImar.Text = "";
            txtAdaParsel.Text = "";
            txtAdres.Text = "";
            txtFiyat.Text = "";
            strEvetHayir = "";
        }
        protected void TabloOlustur()
        {
            using (SqlConnection conn = new SqlConnection(connectString))
            {
                conn.Open();
                using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM tableEmlakArsa",conn))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    gridKayit.DataSource = ds.Tables[0];
                    gridKayit.DataBind();
                }
            }
        }
        protected void btnMainPage_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["loginbasarili"] != null && Session["loginbasarili"].ToString() == "admin")
                {
                    Response.Redirect("~/MainPages/MainAdminPage.aspx", false);
                }

                else if (Session["loginbasarili"] != null && Session["loginbasarili"].ToString() == "member")
                    Response.Redirect("~/MainPages/MainMemberPage.aspx", false);

                else if (Session["loginbasarili"] != null && Session["loginbasarili"].ToString() == "galery")
                    Response.Redirect("~/MainPages/MainGaleriPage.aspx", false);

                else if (Session["loginbasarili"] != null && Session["loginbasarili"].ToString() == "emlak")
                    Response.Redirect("~/MainPages/MainEmlakPage.aspx", false);

                else if (Session["loginbasarili"] != null && Session["loginbasarili"].ToString() == "dealer")
                    Response.Redirect("~/MainPages/MainBayiPage.aspx", false);

                else
                    Response.Redirect("~/MainPages/MainGuestPage.aspx", false);
            }
            catch (Exception)
            {
                Session.Abandon();
                Session.Remove("loginbasarili");
                Session.Remove("kullaniciadi");
                Response.Redirect("~/MainPages/MainGuestPage.aspx");
            }
        }
    }
}