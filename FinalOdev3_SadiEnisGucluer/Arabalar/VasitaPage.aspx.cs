using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalOdev3_SadiEnisGucluer
{
    public partial class VasitaPage : System.Web.UI.Page
    {
        string connectString = @"Data Source = .\SQLEXPRESS;Initial Catalog = sahibindenData; Integrated Security = True";
        string txt1, txt2;
        protected void Page_Load(object sender, EventArgs e)
        {
            TabloOlustur();
        }
        protected void TabloOlustur()
        {
            using (SqlConnection con = new SqlConnection(connectString))
            {
                con.Open();
                using (SqlDataAdapter da1 = new SqlDataAdapter("SELECT * FROM viewSahibindenArac", con))
                {
                    DataSet ds = new DataSet();
                    da1.Fill(ds);
                    gridVasita1.DataSource = ds.Tables[0];
                    gridVasita1.DataBind();
                }
                using (SqlDataAdapter da2 = new SqlDataAdapter("SELECT * FROM viewGaleridenArac", con))
                {
                    DataSet ds = new DataSet();
                    da2.Fill(ds);
                    gridVasita2.DataSource = ds.Tables[0];
                    gridVasita2.DataBind();
                }
            }
        }

        protected void favoriEkle_Click(object sender, EventArgs e)
        {
            string aracID = ((Button)sender).CommandArgument;
            string cumlecik = String.Format("UPDATE viewSahibindenArac SET aracFavori= aracFavori+1 WHERE carID={0}", aracID);

            using(SqlConnection con = new SqlConnection(connectString))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand(cumlecik, con))
                {
                    cmd.CommandType = CommandType.Text;
                    int affectRows = cmd.ExecuteNonQuery();
                }
                TabloOlustur();
            }
        }
        protected void favoriEkle2_Click(object sender, EventArgs e)
        {
            string aracID = ((Button)sender).CommandArgument;
            string cumlecik = String.Format("UPDATE viewGaleridenArac SET aracFavori= aracFavori+1 WHERE carID={0}", aracID);

            using (SqlConnection con = new SqlConnection(connectString))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand(cumlecik, con))
                {
                    cmd.CommandType = CommandType.Text;
                    int affectRows = cmd.ExecuteNonQuery();
                }
                TabloOlustur();
            }
        }

        protected void gridVasita1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView row = (DataRowView)e.Row.DataItem;
                string sorgu = row["aracNumSorgu"].ToString();
                if (sorgu == "H")
                {
                    e.Row.Cells[12].Text = "";
                }

                bool favSorgu = Convert.ToInt32(row["aracFavori"]) == 0;
                if (favSorgu)
                {
                    e.Row.Cells[14].Text = "";
                }
                TextBox txtMesaj = (TextBox)e.Row.FindControl("txtMesaj") as TextBox;
                string mesajBox = txtMesaj.Text;
                txt1 = mesajBox;
            }
        }

        protected void gridVasita2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView row = (DataRowView)e.Row.DataItem;
                string sorgu = row["aracNumSorgu"].ToString();
                if (sorgu == "H")
                {
                    e.Row.Cells[12].Text = "";
                }

                bool favSorgu = Convert.ToInt32(row["aracFavori"]) == 0;
                if (favSorgu)
                {
                    e.Row.Cells[14].Text = "";
                }
            }
        }

        protected void btnMesaj_Click(object sender, EventArgs e)
        {
            string value = txt1;
        }
    }
}