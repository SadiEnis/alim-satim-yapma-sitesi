<%@ Page EnableEventValidation="false" Language="C#" AutoEventWireup="true" CodeBehind="EmlakEvPage.aspx.cs" Inherits="FinalOdev3_SadiEnisGucluer.EmlakEvPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-color:lightyellow">
<head runat="server">
    <title>Evler</title>
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
                    <td class="auto-style10"><h2>EVLER</h2></td>
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
            <asp:GridView runat="server" ID="gridEv1" AutoGenerateColumns="false" OnRowDataBound="gridEv1_RowDataBound" Width="1500px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField HeaderText="ID" DataField="evID" />
                    <asp:BoundField HeaderText="Kat" DataField="evKat" />
                    <asp:BoundField HeaderText="Oda" DataField="evOda" />
                    <asp:BoundField HeaderText="Brüt m2" DataField="evBrutM2" />
                    <asp:BoundField HeaderText="Net m2" DataField="evNetM2" />
                    <asp:BoundField HeaderText="Yaş" DataField="evYas" />
                    <asp:BoundField HeaderText="Isınma" DataField="evIsinma" />
                    <asp:BoundField HeaderText="İl" DataField="evIl" />
                    <asp:BoundField HeaderText="İlçe" DataField="evIlce" />
                    <asp:BoundField HeaderText="Mahalle" DataField="evMahalle" />
                    <asp:BoundField HeaderText="Adres" DataField="evAdres" />
                    <asp:BoundField HeaderText="Fiyat" DataField="evFiyat" />
                    <asp:BoundField HeaderText="Satıcı ID" DataField="kisiID" />
                    <asp:BoundField HeaderText="Satıcı Adı" DataField="kisiAdiSoyadi" />
                    <asp:BoundField HeaderText="Telefon Numarası" DataField="kisiTel" />
                    <asp:BoundField HeaderText="Favori Sayısı" DataField="evFavori" />
                    <asp:BoundField HeaderText="Fiyat Geçmişi" DataField="evGecmis" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button runat="server" ID="favoriEkle1" Text="Favori Ekle" OnClick="favoriEkle1_Click" CommandArgument='<%# Eval("evID") %>' />
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

            <asp:GridView runat="server" BackColor="Gold" ID="gridEv2" AutoGenerateColumns="false" OnRowDataBound="gridEv2_RowDataBound" Width="1500px">
                
                <Columns>
                    <asp:BoundField DataField="evID" />
                    <asp:BoundField DataField="evKat" />
                    <asp:BoundField DataField="evOda" />
                    <asp:BoundField DataField="evBrutM2" />
                    <asp:BoundField DataField="evNetM2" />
                    <asp:BoundField DataField="evYas" />
                    <asp:BoundField DataField="evIsinma" />
                    <asp:BoundField DataField="evIl" />
                    <asp:BoundField DataField="evIlce" />
                    <asp:BoundField DataField="evMahalle" />
                    <asp:BoundField DataField="evAdres" />
                    <asp:BoundField DataField="evFiyat" />
                    <asp:BoundField DataField="emlakID" />
                    <asp:BoundField DataField="emlakAdi" />
                    <asp:BoundField DataField="emlakTel" />
                    <asp:BoundField DataField="evFavori" />
                    <asp:BoundField DataField="evGecmis" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button runat="server" ID="favoriEkle2" Text="Favori Ekle" OnClick="favoriEkle2_Click" CommandArgument='<%# Eval("evID") %>' />
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
