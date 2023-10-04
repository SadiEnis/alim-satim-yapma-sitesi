<%@ Page EnableEventValidation="false" Language="C#" AutoEventWireup="true" CodeBehind="EmlakArsaPage.aspx.cs" Inherits="FinalOdev3_SadiEnisGucluer.EmlakArsaPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-color:lightyellow">
<head runat="server">
    <title>Arsalar</title>
    <style type="text/css">
        .auto-style1 {
            margin-left: 123px;
        }
        .auto-style2 {
            width: 130px;
        }
        .auto-style3 {
            width: 187px;
        }
        .auto-style4 {
            width: 216px;
            height: 45px;
            margin-left: 76px;
            margin-bottom: 0px;
        }
        .auto-style6 {
            width: 396px;
        }
        .auto-style7 {
            width: 12px;
            height: 46px;
            margin-left: 100px;
        }
        .auto-style8 {
            width: 155px;
            margin-left: 63px;
            margin-bottom: 0px;
        }
        .auto-style9 {
            width: 122px;
        }
        .auto-style10 {
            width: 501px;
        }
        .auto-style11 {
            width: 78px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <table>
                <tr>
                    <td class="auto-style11"><asp:LinkButton runat="server" Text="Ana Sayfa" PostBackUrl="~/MainPage.aspx"></asp:LinkButton></td>
                    <td><h1 class="auto-style4">Sadi'den</h1></td>
                    <td class="auto-style3"><h1>|</h1></td>
                    <td class="auto-style10"><h2>ARSALAR</h2></td>
                    <td class="auto-style2"><h1>|</h1></td>
                    <td><h2 class="auto-style8">👤 SadiEnis</h2></td>
                    <td class="auto-style9"><h1 class="auto-style7">|</h1></td>
                    <td class="auto-style6">
                        <asp:Button runat="server" ID="KullanılamayanCıkıs" Text="Çıkış Yap" PostBackUrl="" CssClass="auto-style1" Width="180px" Height="40px" />
                    </td>
                    <td><h1>|</h1></td>
                </tr>
            </table>
        </header>
        <hr />

        <article>
            <asp:GridView runat="server" ID="gridArsa1" AutoGenerateColumns="false" OnRowDataBound="gridArsa1_RowDataBound" Width="1500px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField HeaderText="ID" DataField="arsaID" />
                    <asp:BoundField HeaderText="M2" DataField="arsaM2" />
                    <asp:BoundField HeaderText="İl" DataField="arsaIl" />
                    <asp:BoundField HeaderText="İlçe" DataField="arsaIlce" />
                    <asp:BoundField HeaderText="Mahalle" DataField="arsaMahalle" />
                    <asp:BoundField HeaderText="İmar" DataField="arsaImar" />
                    <asp:BoundField HeaderText="Ada/Parsel" DataField="arsaAdaParsel" />
                    <asp:BoundField HeaderText="Adres" DataField="arsaAdres" />
                    <asp:BoundField HeaderText="Fiyat" DataField="arsaFiyat" />
                    <asp:BoundField HeaderText="Satıcı ID" DataField="kisiID" />
                    <asp:BoundField HeaderText="Satıcı Adı" DataField="kisiAdiSoyadi" />
                    <asp:BoundField HeaderText="Telefon Numarası" DataField="kisiTel" />
                    <asp:BoundField HeaderText="Favori Sayısı" DataField="arsaFavori" />
                    <asp:BoundField HeaderText="Fiyat Geçmişi" DataField="arsaGecmis" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button runat="server" ID="favoriEkle1" Text="Favori Ekle" OnClick="favoriEkle1_Click" CommandArgument='<%# Eval("arsaID") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField  HeaderText="Mesaj">
                        <ItemTemplate>
                            <asp:TextBox runat="server" ID="txtMesaj"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button runat="server" ID="btnMesaj" Text="Gönder" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <asp:GridView runat="server" BackColor="Gold" ID="gridArsa2" AutoGenerateColumns="false" OnRowDataBound="gridArsa2_RowDataBound" Width="1500px">
                
                <Columns>
                    <asp:BoundField DataField="arsaID" />
                    <asp:BoundField DataField="arsaM2" />
                    <asp:BoundField DataField="arsaIl" />
                    <asp:BoundField DataField="arsaIlce" />
                    <asp:BoundField DataField="arsaMahalle" />
                    <asp:BoundField DataField="arsaImar" />
                    <asp:BoundField DataField="arsaAdaParsel" />
                    <asp:BoundField DataField="arsaAdres" />
                    <asp:BoundField DataField="arsaFiyat" />
                    <asp:BoundField DataField="emlakID" />
                    <asp:BoundField DataField="emlakAdi" />
                    <asp:BoundField DataField="emlakTel" />
                    <asp:BoundField DataField="arsaFavori" />
                    <asp:BoundField DataField="arsaGecmis" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button runat="server" ID="favoriEkle2" Text="Favori Ekle" OnClick="favoriEkle2_Click" CommandArgument='<%# Eval("arsaID") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField  HeaderText="Mesaj">
                        <ItemTemplate>
                            <asp:TextBox runat="server" ID="txtMesaj"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button runat="server" ID="btnMesaj" Text="Gönder" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </article>
        <hr />

        <footer>
            Sadi Enis Güçlüer <br />
            2023 &copy <br />
        </footer>
        <hr />

    </form>
</body>
</html>
