<%@ Page Title="" Language="C#" MasterPageFile="~/IndexPage.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="BTL_webNC.login"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" DefaultButton="btnDangnhap" runat="server"> 
        <div class="grid"> 
            <div class="formDangNhap">
        <div class="head">Đăng nhập vào hệ thống</div>
        <div class="bangregister">
            <div class="row">
                <div class="left">Tên đăng nhập</div>
                <div class="right">
                    <%--<input type="text" name="taikhoan" id="tk" value="" placeholder="Nhập email"/>--%>
                    <asp:TextBox ID="txtTaikhoan" placeholder="Tên đăng nhập" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="row">
                <div class="left">Mật khẩu</div>
                <div class="right">
                    <%--<input type="password" name="matkhau" id="mk" value="" placeholder="Nhập mật khẩu"/>--%>
                    <asp:TextBox ID="txtMatkhau" TextMode="Password" runat="server" placeholder="Nhập mật khẩu"></asp:TextBox>
                   
                </div>
            </div>
             <p><label id="loi"></label></p>
             <p class="loidn"> <asp:Label ID="loidangnhap" runat="server"></asp:Label></p>
            <div class="row">
                <div class="left">&nbsp</div>
               
                <div class="right">
                    <%--<input type="button" class="btn" name="dangnhap" value="Đăng nhập" onclick="check()" />--%>
                    <asp:Button ID="btnDangnhap" runat="server" Text="Đăng nhập" OnClick="btnDangnhap_Click" />
                </div>
            </div>
        </div>
        
        
    </div>
        </div>
         <!--<asp:RequiredFieldValidator ID="qfvMatkhau" runat="server" ErrorMessage="Mật khẩu không được trống!" ControlToValidate="txtMatkhau" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="rfvTaikhoan" runat="server" ErrorMessage="Tên đăng nhập không được trống!" ControlToValidate="txtTaikhoan" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator> -->

    
        </asp:Panel>
</asp:Content>
