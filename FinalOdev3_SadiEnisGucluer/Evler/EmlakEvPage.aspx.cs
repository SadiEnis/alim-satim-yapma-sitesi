using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalOdev3_SadiEnisGucluer
{
    public partial class EmlakEvPage : System.Web.UI.Page
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
                using (SqlDataAdapter da1 = new SqlDataAdapter("SELECT * FROM viewSahibindenEv", conn))
                {
                    DataSet ds = new DataSet();
                    da1.Fill(ds);
                    gridEv1.DataSource = ds.Tables[0];
                    gridEv1.DataBind();
                }
                using (SqlDataAdapter da2 = new SqlDataAdapter("SELECT * FROM viewEmlaktanEv", conn))
                {
                    DataSet ds = new DataSet();
                    da2.Fill(ds);
                    gridEv2.DataSource = ds.Tables[0];
                    gridEv2.DataBind();
                }
            }
        }

        protected void favoriEkle1_Click(object sender, EventArgs e)
        {
            string evID = ((Button)sender).CommandArgument;
            string cumlecik = String.Format("UPDATE viewSahibindenEv SET evFavori= evFavori+1 WHERE evID={0}", evID);

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
            string evID = ((Button)sender).CommandArgument;
            string cumlecik = String.Format("UPDATE viewEmlaktanEv SET evFavori= evFavori+1 WHERE evID={0}", evID);

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
        protected void gridEv2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView row = (DataRowView)e.Row.DataItem;
                string sorgu = row["evNumSorgu"].ToString();
                if (sorgu == "H")
                {
                    e.Row.Cells[14].Text = "";
                }

                bool favSorgu = Convert.ToInt32(row["evFavori"]) == 0;
                if (favSorgu)
                {
                    e.Row.Cells[16].Text = "";
                }
            }
        }

        protected void gridEv1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView row = (DataRowView)e.Row.DataItem;
                string sorgu = row["evNumSorgu"].ToString();
                if (sorgu == "H")
                {
                    e.Row.Cells[14].Text = "";
                }

                bool favSorgu = Convert.ToInt32(row["evFavori"]) == 0;
                if (favSorgu)
                {
                    e.Row.Cells[16].Text = "";
                }
            }
        }
    }
}