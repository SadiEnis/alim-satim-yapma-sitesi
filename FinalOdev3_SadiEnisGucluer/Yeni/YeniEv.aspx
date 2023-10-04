<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="YeniEv.aspx.cs" Inherits="FinalOdev3_SadiEnisGucluer.YeniEv" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-color:lightyellow">
<head runat="server">
    <title>İlan Ver</title>
    <style type="text/css">
        .auto-style1 {
            width: 410px;
            height: 419px;
            margin-left: 109px;
            margin-top: 35px;
        }
        .auto-style2 {
            margin-left: 120px;
            margin-top: 8px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <header>
                <h2>
                    Yeni Ev Ekle
                    <asp:Button runat="server" ID="btnMainPage" OnClick="btnMainPage_Click" Text="Ana Sayfaya Dön" CssClass="auto-style3" Height="35px" Width="215px" style="margin-left: 250px" />
                </h2>
            </header>
            <hr />

            <article style="background-color:aliceblue" class="auto-style1">
                <table>
                    <tr>
                        <td>Ev No</td>
                        <td>:</td>
                        <td><asp:Label runat="server" ID="lblEvNo"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Kat</td>
                        <td>:</td>
                        <td><asp:TextBox runat="server" ID="txtKat"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Oda</td>
                        <td>:</td>
                        <td><asp:TextBox runat="server" ID="txtOda"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Brüt m<sup>2</sup></td>
                        <td>:</td>
                        <td><asp:TextBox runat="server" ID="txtBrut"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Net m<sup>2</sup></td>
                        <td>:</td>
                        <td><asp:TextBox runat="server" ID="txtNet"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Apartman Yaşı</td>
                        <td>:</td>
                        <td><asp:TextBox runat="server" ID="txtYas"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Isınma Tipi</td>
                        <td>:</td>
                        <td><asp:TextBox runat="server" ID="txtIsinma"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>İl</td>
                        <td>:</td>
                        <td><asp:TextBox runat="server" ID="txtIl"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>İlçe</td>
                        <td>:</td>
                        <td><asp:TextBox runat="server" ID="txtIlce"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Mahalle</td>
                        <td>:</td>
                        <td><asp:TextBox runat="server" ID="txtMahalle"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Açık Adres</td>
                        <td>:</td>
                        <td><asp:TextBox runat="server" ID="txtAdres"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Fiyat</td>
                        <td>:</td>
                        <td><asp:TextBox runat="server" ID="txtFiyat"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Telefon No Görünürlüğü</td>
                        <td>:</td>
                        <td><asp:CheckBox runat="server" ID="chkEvetHayir" /></td>
                    </tr>
                </table>
                <asp:Button runat="server" ID="btnEkle" Text="Evi Ekle" OnClick="btnEkle_Click" CssClass="auto-style2" Height="30px" Width="120px" />
            </article>
            <asp:GridView runat="server" ID="gridKayit"></asp:GridView>
            <hr />
        </div>
    </form>
</body>
</html>
