<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="YeniAraba.aspx.cs" Inherits="FinalOdev3_SadiEnisGucluer.YeniIlanPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-color:lightyellow">
<head runat="server">
    <title>İlan Ver</title>
    <style type="text/css">
        .auto-style2 {
            margin-left: 120px;
            margin-top: 31px;
        }
        .auto-style3 {
            margin-left: 231px;
        }
        .auto-style4 {
            width: 400px;
            height: 430px;
            margin-left: 109px;
            margin-top: 35px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <h2>
                Yeni Araç Ekle
                <asp:Button runat="server" ID="btnMainPage" OnClick="btnMainPage_Click" Text="Ana Sayfaya Dön" CssClass="auto-style3" Height="35px" Width="215px" />
            </h2>
        </header>
        <hr />

        <article style="background-color:aliceblue" class="auto-style4">
            <table>
                <tr>
                    <td>Araç No</td>
                    <td>:</td>
                    <td> <asp:Label runat="server" ID="lblAracID"> </asp:Label> </td>
                </tr>
                <tr>
                    <td>Araç Markası</td>
                    <td>:</td>
                    <td> <asp:TextBox runat="server" ID="txtAracMarka"></asp:TextBox> </td>
                </tr>
                <tr>
                    <td>Araç Modeli</td>
                    <td>:</td>
                    <td> <asp:TextBox runat="server" ID="txtAracModel"></asp:TextBox> </td>
                </tr>
                <tr>
                    <td>Araç Motor Hacmi</td>
                    <td>:</td>
                    <td> <asp:TextBox runat="server" ID="txtAracMotor"></asp:TextBox> </td>
                </tr>
                <tr>
                    <td>Yakıt Türü</td>
                    <td>:</td>
                    <td> <asp:TextBox runat="server" ID="txtYakit"></asp:TextBox> </td>
                </tr>
                <tr>
                    <td>Vites Tipi</td>
                    <td>:</td>
                    <td> <asp:TextBox runat="server" ID="txtVites"></asp:TextBox> </td>
                </tr>
                <tr>
                    <td>Piyasaya Çıkış Yılı</td>
                    <td>:</td>
                    <td> <asp:TextBox runat="server" ID="txtYil"></asp:TextBox> </td>
                </tr>
                <tr>
                    <td>Araç KM</td>
                    <td>:</td>
                    <td> <asp:TextBox runat="server" ID="txtKM"></asp:TextBox> </td>
                </tr>
                <tr>
                    <td>Araç Rengi</td>
                    <td>:</td>
                    <td> <asp:TextBox runat="server" ID="txtRenk"></asp:TextBox> </td>
                </tr>
                <tr>
                    <td>Hasar Kaydı</td>
                    <td>:</td>
                    <td> <asp:TextBox runat="server" ID="txtHasar"></asp:TextBox> </td>
                </tr>
                <tr>
                    <td>Belirlediğiniz Fiyat</td>
                    <td>:</td>
                    <td> <asp:TextBox runat="server" ID="txtFiyat"></asp:TextBox> </td>
                </tr>
                <tr>
                    <td>Telefon No Görünürlüğü</td>
                    <td>:</td>
                    <td><asp:CheckBox runat="server" ID="chkEvetHayir" /></td>
                </tr>
            </table>
            <asp:Button runat="server" ID="btnEkle" Text="Aracı Ekle" CssClass="auto-style2" Height="40px" Width="192px" OnClick="btnEkle_Click" />
        </article>
        <asp:GridView runat="server" ID="gridKayit"></asp:GridView>
        <hr />

    </form>
</body>
</html>
