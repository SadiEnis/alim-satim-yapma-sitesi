using System;
using System.Data.SqlClient;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace FinalOdev3_SadiEnisGucluer
{
    public partial class YeniEv : System.Web.UI.Page
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
            cumlecik = "INSERT INTO tableEmlakEv (evKat,evOda,evBrutM2,evNetM2,evYas,evIsinma,evIl,evIlce,evMahalle,evAdres,evFiyat,evNumSorgu)" +
                " VALUES ('" + txtKat.Text + "','" + txtOda.Text + "','" + txtBrut.Text + "','" + txtNet.Text + "','" + txtYas.Text + "','" + txtIsinma.Text + "','" + txtIl.Text + "','" + txtIlce.Text + "','" + txtMahalle.Text + "','" + txtAdres.Text+ "','" + txtFiyat.Text + "','"+ strEvetHayir+ "')";

            string iliski = "INSERT INTO tableSatilikEv (evID,saticiID) VALUES ((SELECT MAX(evID) FROM tableEmlakEV),'100')";

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
            txtKat.Text = "";
            txtOda.Text = "";
            txtBrut.Text = "";
            txtNet.Text = "";
            txtYas.Text = "";
            txtIsinma.Text = "";
            txtIl.Text = "";
            txtIlce.Text = "";
            txtMahalle.Text = "";
            txtAdres.Text = "";
            txtFiyat.Text = "";
            strEvetHayir = "";
        }
        protected void TabloOlustur()
        {
            using (SqlConnection con = new SqlConnection(connectString))
            {
                con.Open();
                using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM tableEmlakEv", con))
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