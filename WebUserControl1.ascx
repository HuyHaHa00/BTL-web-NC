<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WebUserControl1.ascx.cs" Inherits="BTL_webNC.WebUserControl1" %>
<asp:Panel ID="Panel1" runat="server">
    <div class="formDangNhap">
        <div class="head">Đăng nhập vào hệ thống</div>
        <div class="bangregister">
            <div class="row">
                <div class="left">Email</div>
                <div class="right">
                    <%--<input type="text" name="taikhoan" id="tk" value="" placeholder="Nhập email"/>--%>
                    <asp:TextBox ID="txtTaikhoan" placeholder="Tên đăng nhập" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvTaikhoan" runat="server" ErrorMessage="Tên đăng nhập không được trống!" ControlToValidate="txtTaikhoan"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="row">
                <div class="left">Mật khẩu</div>
                <div class="right">
                    <%--<input type="password" name="matkhau" id="mk" value="" placeholder="Nhập mật khẩu"/>--%>
                    <asp:TextBox ID="txtMatkhau" runat="server"></asp:TextBox>
<%--                    <asp:RequiredFieldValidator ID="qfvMatkhau" runat="server" ErrorMessage="Mật khẩu không được trống" ControlToValidate="txtMatkhau"></asp:RequiredFieldValidator>--%>
                </div>
            </div>
             <p><label id="loi"></label></p>
             <p class="loidn"> <asp:Label ID="loidangnhap" runat="server"></asp:Label></p>
            <div class="row">
                <div class="left">&nbsp</div>
               
                <div class="right">
                    <%--<input type="button" class="btn" name="dangnhap" value="Đăng nhập" onclick="check()" />--%>
                    <asp:Button ID="btnDangnhap"  runat="server" Text="Button" />
                </div>
            </div>
        </div>
        
    </div>
</asp:Panel>
