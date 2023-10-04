<%@ Page EnableEventValidation="false" Language="C#" AutoEventWireup="true" CodeBehind="VasitaPage.aspx.cs" Inherits="FinalOdev3_SadiEnisGucluer.VasitaPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-color:lightyellow">
<head runat="server">
    <title>Vasıtalar</title>
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
<body style="width: 1500px">
    <form id="form1" runat="server">
        <header>
            <table>
                <tr>
                    <td class="auto-style11"><asp:LinkButton runat="server" Text="Ana Sayfa" PostBackUrl="~/MainPage.aspx"></asp:LinkButton></td>
                    <td><h1 class="auto-style4">Sadi'den</h1></td>
                    <td class="auto-style3"><h1>|</h1></td>
                    <td class="auto-style10"><h2>Arabalar</h2></td>
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
            <asp:GridView runat="server" ID="gridVasita1" AutoGenerateColumns="false" OnRowDataBound="gridVasita1_RowDataBound" Width="1500px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField HeaderText="ID" DataField="carID" />
                    <asp:BoundField HeaderText="Marka" DataField="aracMarka" />
                    <asp:BoundField HeaderText="Model" DataField="aracModel" />
                    <asp:BoundField HeaderText="Motor Hacmi" DataField="aracMotor" />
                    <asp:BoundField HeaderText="Yakıt Tipi" DataField="aracYakit" />
                    <asp:BoundField HeaderText="Yıl" DataField="aracYil" />
                    <asp:BoundField HeaderText="KM" DataField="aracKM" />
                    <asp:BoundField HeaderText="Renk" DataField="aracRenk" />
                    <asp:BoundField HeaderText="Hasar Kaydı" DataField="aracHasarKaydi" />
                    <asp:BoundField HeaderText="Fiyat" DataField="aracFiyat" />
                    <asp:BoundField HeaderText="Satıcı ID" DataField="kisiID" />
                    <asp:BoundField HeaderText="Satıcı Adı" DataField="kisiAdiSoyadi" />
                    <asp:BoundField HeaderText="Telefon Numarası" DataField="kisiTel" />
                    <asp:BoundField HeaderText="Favori Sayısı" DataField="aracFavori" />
                    <asp:BoundField HeaderText="Fiyat Geçmişi" DataField="aracGecmis" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button runat="server" ID="favoriEkle1" Text="Favori Ekle" OnClick="favoriEkle_Click" CommandArgument='<%# Eval("carID") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Mesaj">
                        <ItemTemplate>
                                <asp:TextBox runat="server" ID="txtMesaj"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>                        
                        <ItemTemplate>
                            <asp:Button runat="server" ID="btnMesaj" Text="Gönder" OnClick="btnMesaj_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <asp:GridView BackColor="Gold" runat="server" ID="gridVasita2"  AutoGenerateColumns="false" OnRowDataBound="gridVasita2_RowDataBound" Width="1500px">
                
                <Columns>
                    <asp:BoundField DataField="carID" />
                    <asp:BoundField DataField="aracMarka" />
                    <asp:BoundField DataField="aracModel" />
                    <asp:BoundField DataField="aracMotor" />
                    <asp:BoundField DataField="aracYakit" />
                    <asp:BoundField DataField="aracYil" />
                    <asp:BoundField DataField="aracKM" />
                    <asp:BoundField DataField="aracRenk" />
                    <asp:BoundField DataField="aracHasarKaydi" />
                    <asp:BoundField DataField="aracFiyat" />
                    <asp:BoundField DataField="galeriID" />
                    <asp:BoundField DataField="galeriAdi" />
                    <asp:BoundField DataField="galeriTel" />
                    <asp:BoundField DataField="aracFavori" />
                    <asp:BoundField DataField="aracGecmis" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button runat="server" ID="favoriEkle2" Text="Favori Ekle" OnClick="favoriEkle2_Click" CommandArgument='<%# Eval("carID") %>' />
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
