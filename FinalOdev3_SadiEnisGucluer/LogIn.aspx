<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="FinalOdev3_SadiEnisGucluer.LogIn" %>

<!DOCTYPE html>

<html style="background-color:lightyellow" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Log In</title>
    <style type="text/css">
        .auto-style1 {
            width: 400px;
            height: 190px;
            background-color: aliceblue;
            margin-left: 500px;
            margin-top: 128px;
        }
        .auto-style2 {
            width: 300px;
            margin-left: 50px;
            margin-top: 0px;
            height: 130px;
        }
    </style>
</head>
<body style="width: 1400px">
    <form id="form1" runat="server">
        <div class="auto-style1">
            <br />
            <table class="auto-style2">
                <tr>
                    <td colspan="3" style="text-align:center">Log In</td>
                </tr>
                <tr>
                    <td>Kullanıcı Adı</td>
                    <td>:</td>
                    <td><asp:TextBox runat="server" ID="txtUsername"></asp:TextBox> </td>
                </tr>
                <tr>
                    <td>Şifre</td>
                    <td>:</td>
                    <td><asp:TextBox runat="server" ID="txtPassword" TextMode="Password"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align:center"><asp:Button runat="server" ID="btnLogIn" Text="Log In" OnClick="btnLogIn_Click" /> </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
