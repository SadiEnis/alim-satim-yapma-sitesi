using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalOdev3_SadiEnisGucluer
{
    public partial class YeniIlanPage : System.Web.UI.Page
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
            cumlecik = "INSERT INTO tableVasita (aracMarka,aracModel,aracMotor,aracYakit,aracVites,aracYil,aracKM,aracRenk,aracHasarKaydi,aracFiyat,aracNumSorgu)" +
                " VALUES ('"+ txtAracMarka.Text+"','"+ txtAracModel.Text+"','"+ txtAracMotor.Text +"','"+ txtYakit.Text +"','"+ txtVites.Text + "','"+ txtYil.Text + "','"+ txtKM.Text + "','"+ txtRenk.Text + "','"+ txtHasar.Text + "','"+ txtFiyat.Text+"','"+strEvetHayir+"')";

            string iliski = "INSERT INTO tableSatilikVasita (aracID,saticiID) VALUES ((SELECT MAX(carID) FROM tableVasita),'100')";

            using (SqlConnection conn = new SqlConnection(connectString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand(cumlecik, conn))
                {
                    cmd.CommandType = CommandType.Text;
                    int affectRows = cmd.ExecuteNonQuery();
                    if (affectRows > 0)
                    {
                        string scrpt = "alert('Kayıt işlemi başarılı bir şekilde tamamlandı.')";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertBilgi", scrpt, true);
                        TabloOlustur();
                    }
                }
                using (SqlCommand cmd = new SqlCommand(iliski, conn))
                {
                    cmd.CommandType = CommandType.Text;
                    int affectRows = cmd.ExecuteNonQuery();
                }
                txtAracMarka.Text = "";
                txtAracModel.Text = "";
                txtAracMotor.Text = "";
                txtYakit.Text = "";
                txtVites.Text = "";
                txtYil.Text = "";
                txtKM.Text = "";
                txtRenk.Text = "";
                txtHasar.Text = "";
                txtFiyat.Text = "";
            }
        }
        protected void TabloOlustur()
        {
            using (SqlConnection con = new SqlConnection(connectString))
            {
                con.Open();
                using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM tableVasita",con))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    gridKayit.DataSource = ds.Tables[0];
                    gridKayit.DataBind();
                }
            }
        }
        protected void btnMainPage_Click(object sender, EventArgs e)
        {       // Bu kısım önceki ödeve ek bir kısım ana sayfa role göre farklı ayarlı olduğu için kullanıcının hangi rol yetkisine sahip olduğunu sorguladım.
            try                 // Bu süreç yeni ev ve arsa ekleme sayfalarının kodlarında da aynı işliyor.
            {
                if (Session["loginbasarili"] != null && Session["loginbasarili"].ToString() == "admin")
                {
                    Response.Redirect("~/MainPages/MainAdminPage.aspx",false);
                }

                else if (Session["loginbasarili"] != null && Session["loginbasarili"].ToString() == "member")
                    Response.Redirect("~/MainPages/MainMemberPage.aspx",false);

                else if (Session["loginbasarili"] != null && Session["loginbasarili"].ToString() == "galery")
                    Response.Redirect("~/MainPages/MainGaleriPage.aspx",false);

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