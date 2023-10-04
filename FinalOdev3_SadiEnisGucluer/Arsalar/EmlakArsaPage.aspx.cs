using System;
using System.Data.SqlClient;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalOdev3_SadiEnisGucluer
{
    public partial class EmlakArsaPage : System.Web.UI.Page
    {
        string connectString = @"Data Source = .\SQLEXPRESS;Initial Catalog = sahibindenData; Integrated Security = True";
        protected void Page_Load(object sender, EventArgs e)
        {
            TabloOlustur();
        }
        protected void TabloOlustur()
        {
            using (SqlConnection conn = new SqlConnection(connectString))
            {
                conn.Open();
                using (SqlDataAdapter da1 = new SqlDataAdapter("SELECT * FROM viewSahibindenArsa", conn))
                {
                    DataSet ds = new DataSet();
                    da1.Fill(ds);
                    gridArsa1.DataSource = ds.Tables[0];
                    gridArsa1.DataBind();
                }
                using (SqlDataAdapter da2 = new SqlDataAdapter("SELECT * FROM viewEmlaktanArsa", conn))
                {
                    DataSet ds = new DataSet();
                    da2.Fill(ds);
                    gridArsa2.DataSource = ds.Tables[0];
                    gridArsa2.DataBind();
                }
            }
        }
        protected void favoriEkle1_Click(object sender, EventArgs e)
        {
            string arsaID = ((Button)sender).CommandArgument;
            string cumlecik = String.Format("UPDATE viewSahibindenArsa SET arsaFavori= arsaFavori+1 WHERE arsaID={0}", arsaID);

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

        protected void favoriEkle2_Click(object sender, EventArgs e)
        {
            string arsaID = ((Button)sender).CommandArgument;
            string cumlecik = String.Format("UPDATE viewEmlaktanArsa SET arsaFavori= arsaFavori+1 WHERE arsaID={0}", arsaID);

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

        protected void gridArsa1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView row = (DataRowView)e.Row.DataItem;
                string sorgu = row["arsaNumSorgu"].ToString();
                if (sorgu == "H")
                {
                    e.Row.Cells[11].Text = "";
                }

                bool favSorgu = Convert.ToInt32(row["arsaFavori"]) == 0;
                if (favSorgu)
                {
                    e.Row.Cells[13].Text = "";
                }
            }
        }

        protected void gridArsa2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView row = (DataRowView)e.Row.DataItem;
                string sorgu = row["arsaNumSorgu"].ToString();
                if (sorgu == "H")
                {
                    e.Row.Cells[11].Text = "";
                }

                bool favSorgu = Convert.ToInt32(row["arsaFavori"]) == 0;
                if (favSorgu)
                {
                    e.Row.Cells[13].Text = "";
                }
            }
        }
    }
}