<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Testing.aspx.cs" Inherits="BTL_webNC.Testing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server">
            <Scripts>
                <asp:ScriptReference Path="~/Script.js" />
            </Scripts>
        </asp:ScriptManager>
    <div>
    <asp:Repeater id="rpbaidang" runat="server">
        <ItemTemplate>
            <h1><%#Eval("sTieude") %></h1>
            <i>Cập nhật: <%#Eval("dNgaydang" ,"{0: dd/MM/yyyy}")%> - Lượt xem: <%#Eval("iLuotxem") %></i>
        </ItemTemplate>
    </asp:Repeater>
    </div>
        <asp:DropDownList ID="ddl1" runat="server">
        </asp:DropDownList>
        <asp:UpdatePanel ID="udp1" runat="server">
            <ContentTemplate>
                <asp:GridView runat ="server" ID="grv1">

                </asp:GridView>              
            </ContentTemplate>
        </asp:UpdatePanel>

        
    </form>
</body>
</html>
