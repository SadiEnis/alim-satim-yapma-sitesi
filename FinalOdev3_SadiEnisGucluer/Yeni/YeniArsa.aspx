<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="YeniArsa.aspx.cs" Inherits="FinalOdev3_SadiEnisGucluer.Yeniarsa" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-color:lightyellow">
<head runat="server">
    <title>İlan Ver</title>
    <style type="text/css">
        .auto-style1 {
            width: 400px;
            height: 340px;
            margin-left: 77px;
            margin-top: 40px;
        }
        .auto-style2 {
            margin-left: 132px;
            margin-top: 17px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <header>
                <h2>
                    Yeni Arsa Ekle
                    <asp:Button runat="server" ID="btnMainPage" OnClick="btnMainPage_Click" Text="Ana Sayfaya Dön" CssClass="auto-style3" Height="35px" Width="215px" style="margin-left: 160px" />
                </h2>
            </header>
            <hr />
        </div>
        <article style="background-color:aliceblue" class="auto-style1">
            <table>
                <tr>
                    <td>Arsa No</td>
                    <td>:</td>
                    <td><asp:Label runat="server" ID="lblArsa"></asp:Label></td>
                </tr>
                <tr>
                    <td>m<sup>2</sup></td>
                    <td>:</td>
                    <td><asp:TextBox runat="server" ID="txtM2"></asp:TextBox></td>
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
                    <td>İmar</td>
                    <td>:</td>
                    <td><asp:TextBox runat="server" ID="txtImar"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Ada/Parsel</td>
                    <td>:</td>
                    <td><asp:TextBox runat="server" ID="txtAdaParsel"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Adres</td>
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
            <asp:Button runat="server" ID="btnEkle" Text="Arsayı Ekle" OnClick="btnEkle_Click" CssClass="auto-style2" Height="30px" Width="140px" />
        </article>
        <asp:GridView runat="server" ID="gridKayit"></asp:GridView>
    </form>
</body>
</html>
