<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainBayiPage.aspx.cs" Inherits="FinalOdev3_SadiEnisGucluer.MainBayiPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-color:lightyellow">
<head runat="server">
    <title> Sadi'den </title>
    <style>

        .auto-style1 {
            margin-left: 50px;
        }
        .auto-style2 {
            width: 25px;
        }
        .auto-style3 {
            width: 185px;
        }
        .auto-style4 {
            width: 250px;
        }
        .auto-style5 {
            width: 130px;
        }
        .auto-style6 {
            width: 160px;
        }
        .auto-style8 {
            margin-left: 0px;
        }
        .auto-style9 {
            width: 60px;
        }
        .auto-style10 {
            width: 75px;
        }
        .auto-style11 {
            width: 655px;
            height: 196px;
            margin-left: 391px;
            margin-top: 45px;
        }
        .auto-style12 {
            margin-left: 36px;
            font-weight: bold;
            background-color: #3366FF;
        }
        .auto-style13 {
            margin-left: 35px;
            font-weight: bold;
            background-color: #3366FF;
        }
        .auto-style14 {
            width: 655px;
            text-align: center;
        }
        .auto-style15 {
            margin-left: 40px;
            font-weight: bold;
            background-color: #3366FF;
        }

    </style>
</head>
<body style="width: 1500px; margin-left: 150px">
    <form id="form1" runat="server">
        <div>
            <header>
                <table>
                    <tr>
                        <td class="auto-style2"><h1>|</h1></td>
                        <td style="color:yellow" class="auto-style3"><h2>Sadi'den</h2></td>
                        <td class="auto-style2"><h1>|</h1></td>
                        <td class="auto-style4">
                            <asp:Button Text="Vasıta" runat="server" ID="Button1" Height="30px" Width="150px" PostBackUrl="~/Arabalar/VasitaPage.aspx" BackColor="#FF9933" BorderColor="Black" BorderStyle="Solid" BorderWidth="3px" Font-Bold="True" Font-Names="Arial" CssClass="auto-style1"/>                    
                        </td>
                        <td class="auto-style2"><h1>|</h1></td>
                        <td class="auto-style4">
                            <asp:Button Text="Ev" runat="server" ID="Button2" Height="30px" Width="150px" PostBackUrl="~/Evler/EmlakEvPage.aspx" BackColor="#FF9933" BorderColor="Black" BorderStyle="Solid" BorderWidth="3px" Font-Bold="True" Font-Names="Arial" style="margin-top: 2px; margin-left: 50px;"/>
                        </td>
                        <td class="auto-style2"><h1>|</h1></td>
                        <td class="auto-style4">
                            <asp:Button Text="Arsa" runat="server" ID="Button3" Height="30px" Width="150px" PostBackUrl="~/Arsalar/EmlakArsaPage.aspx" BackColor="#FF9933" BorderColor="Black" BorderStyle="Solid" BorderWidth="3px" Font-Bold="True" Font-Names="Arial" style="margin-left: 50px"/>
                        </td>
                        <td class="auto-style9"><h1>|</h1></td>
                        <td class="auto-style5">Hoş geldin <i><asp:Label runat="server" ID="lblUser"></asp:Label></i></td>
                        <td class="auto-style10"><h1>|</h1></td>
                        <td class="auto-style6">
                            <asp:Button runat="server" ID="btnLogOut" Text="Log Out" OnClick="btnLogOut_Click" />
                        </td>
                        <td class="auto-style2"><h1 class="auto-style8">|</h1></td>
                    </tr>
                </table>
            </header>
            <hr />

            <article>
                <div style="background-color:aliceblue" class="auto-style11">
                    <br /><h3 class="auto-style14" > YENİ İLAN OLUŞTUR</h3><br />
                    <strong>
                    <asp:Button Text="Otomobil İlanı Ver" runat="server" PostBackUrl="~/Yeni/YeniAraba.aspx" CssClass="auto-style15" BorderWidth="2px" Height="39px" Width="191px" />
                    <asp:Button Text="Ev İlanı Ver" runat="server" PostBackUrl="~/Yeni/YeniEv.aspx" CssClass="auto-style13" BorderWidth="2px" Width="152px" Height="40px" />
                    <asp:Button Text="Arsa İlanı Ver" runat="server" PostBackUrl="~/Yeni/YeniArsa.aspx" CssClass="auto-style12" BorderWidth="2px" Height="40px" Width="160px" />
                    </strong>
                </div>
                <div>
                    <asp:GridView runat="server" ID="grid1" AutoGenerateColumns="false" >
                        <Columns>
                            <asp:BoundField HeaderText="Araç ID" DataField="carID" />
                            <asp:BoundField HeaderText="Araç Marka" DataField="aracMarka" />
                            <asp:BoundField HeaderText="Araç Model" DataField="aracModel" />
                            <asp:BoundField HeaderText="Araç KM" DataField="aracKM" />
                            <asp:BoundField HeaderText="Araç Yakıt" DataField="aracYakit" />
                            <asp:BoundField HeaderText="Arac Vites" DataField="aracVites" />
                            <asp:BoundField HeaderText="Araç Favori" DataField="aracFavori" />
                        </Columns>
                    </asp:GridView>
                    <asp:GridView runat="server" ID="grid2" AutoGenerateColumns="false" >
                        <Columns>
                            <asp:BoundField HeaderText="Ev ID" DataField="evID" />
                            <asp:BoundField HeaderText="Ev Kat" DataField="evKat" />
                            <asp:BoundField HeaderText="Ev Oda" DataField="evOda" />
                            <asp:BoundField HeaderText="Ev M2" DataField="evNetM2" />
                            <asp:BoundField HeaderText="Ev Yaş" DataField="evYas" />
                            <asp:BoundField HeaderText="Ev Favori" DataField="EvFavori" />

                        </Columns>
                    </asp:GridView>
                    <asp:GridView runat="server" ID="grid3" AutoGenerateColumns="false" >
                        <Columns>
                            <asp:BoundField HeaderText="Arsa ID" DataField="arsaID" />
                            <asp:BoundField HeaderText="Arsa M2" DataField="arsaM2" />
                            <asp:BoundField HeaderText="Arsa İl" DataField="arsaIl" />
                            <asp:BoundField HeaderText="İmar" DataField="arsaImar" />
                            <asp:BoundField HeaderText="Arsa Favori" DataField="arsaFavori" />

                        </Columns>
                    </asp:GridView>
                </div>
            </article>
            <hr />  

            <footer>
                Sadi Enis Güçlüer <br />
                2023 &copy <br />
            </footer>
        </div>
    </form>
</body>
</html>

