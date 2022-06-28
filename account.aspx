<%@ Page Title="" Language="C#" MasterPageFile="~/IndexPage.Master" AutoEventWireup="true" CodeBehind="account.aspx.cs" Inherits="BTL_webNC.account" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" DefaultButton="btnDangnhap" runat="server"> 
        <div class="grid"> 
            <div class="formDangNhap">
        <div class="head">Thay đổi thông tin tài khoản</div>
        <div class="bangregister">
            <div class="row">
                <div class="left">Tên đăng nhập</div>
                <div class="right">
                    <%--<input type="text" name="taikhoan" id="tk" value="" placeholder="Nhập email"/>--%>
                    <asp:TextBox ID="txtTaikhoan" placeholder="Tên đăng nhập" runat="server"></asp:TextBox>
                    
                </div>
            </div>
            <div class="row">
                <div class="left">Tên người dùng</div>
                <div class="right">
                    <%--<input type="text" name="taikhoan" id="tk" value="" placeholder="Nhập email"/>--%>
                    <asp:TextBox ID="txtTen" placeholder="Tên của bạn" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="row">
                <div class="left">Email</div>
                <div class="right">
                    <%--<input type="text" name="taikhoan" id="tk" value="" placeholder="Nhập email"/>--%>
                    <asp:TextBox ID="txtEmail" placeholder="Email" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Sai định dạng"
                    ForeColor="Red" ValidationExpression="[\w-]+@([\w-]+\.)+[\w-]+"></asp:RegularExpressionValidator>
                </div>
            </div>

            <div class="row">
                <div class="left">Mật khẩu cũ</div>
                <div class="right">
                    <%--<input type="password" name="matkhau" id="mk" value="" placeholder="Nhập mật khẩu"/>--%>
                    <asp:TextBox ID="txtMatkhau" TextMode="Password" runat="server" placeholder="Nhập mật khẩu"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="left">Mật khẩu mới</div>
                <div class="right">
                    <%--<input type="password" name="matkhau" id="mk" value="" placeholder="Nhập mật khẩu"/>--%>
                    <asp:TextBox ID="txtMkmoi" TextMode="Password" runat="server" placeholder="Nhập mật khẩu"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="left">Nhập lại mật khẩu mới</div>
                <div class="right">
                    <%--<input type="password" name="matkhau" id="mk" value="" placeholder="Nhập mật khẩu"/>--%>
                    <asp:TextBox ID="txtMknhaplai" TextMode="Password" runat="server" placeholder="Nhập mật khẩu"></asp:TextBox>
                </div>
            </div>
             <p><label id="loi"></label></p>
             <p class="loidn"> <asp:Label ID="loidangnhap" runat="server"></asp:Label></p>
            <div class="row">
                <div class="left">&nbsp</div>
               
                <div class="right">
                    <%--<input type="button" class="btn" name="dangnhap" value="Đăng nhập" onclick="check()" />--%>
                    <asp:Button ID="btnDangnhap" runat="server" Text="Thay đổi" OnClick="btnDangnhap_Click" />
                </div>
            </div>
        </div>
        
        
    </div>
        </div>
        <!--<asp:RequiredFieldValidator ID="rfvTaikhoan" runat="server" ErrorMessage="Tên đăng nhập không được trống!" ControlToValidate="txtTaikhoan" ValidationGroup="dn" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="rfvTen" runat="server" ErrorMessage="Tên người dùng không được trống!" ControlToValidate="txtTen" ValidationGroup="dn" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="rfvMatkhau" runat="server" ErrorMessage="Mật khẩu không được trống!" ControlToValidate="txtMatkhau" ValidationGroup="dn" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="cvMkmoi" runat="server" ErrorMessage="Mật khẩu phải dài từ 6 kí tự" ControlToValidate="txtMkmoi" ValidationGroup="dn" Display="Dynamic" ForeColor="Red" OnServerValidate="cvMkmoi_ServerValidate"></asp:CustomValidator>
                    <asp:RequiredFieldValidator ID="rfvMkmoi" runat="server" ErrorMessage="Mật khẩu không được trống!" ControlToValidate="txtMkmoi" ValidationGroup="dn" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="cvMknhaplai" runat="server" ErrorMessage="Cần nhập lại đúng mật khẩu mới" Display="Dynamic" ForeColor="Red" ControlToCompare="txtMkmoi" ValidationGroup="dn" ControlToValidate="txtMknhaplai"></asp:CompareValidator>
        -->
        </asp:Panel>
</asp:Content>
