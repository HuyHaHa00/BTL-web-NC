<%@ Page Title="" Language="C#" MasterPageFile="~/IndexPage.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="BTL_webNC.register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="formDangNhap">
        <asp:ScriptManager runat="server">
               <Scripts> 
                   <asp:ScriptReference Path ="~/Script.js"/>
               </Scripts>
            </asp:ScriptManager>

        <div class="head">Đăng ký thành viên</div>
        <div class="bangregister">
            <div class="row">
                <div class="left">Họ và tên</div>
                <div class="right">
                    <input type="text" name="hoten" value="" id="hoten" placeholder="Nhập họ tên" onchange="xoathongtin()"/>
                </div>
            </div>

            <div class="row">
                <div class="left">Email</div>
                <div class="right">
                    <input type="text" name="email"  id="email" value="" placeholder="Nhập email"/>
               
                </div>
            </div>
            <div class="row">
                <div class="left">Tên đăng nhập</div>
                <div class="right">
                    <asp:TextBox ID="userName" CssClass="uName" runat="server" value="" placeholder="Nhập tên đăng nhập"></asp:TextBox>
                    <%--<asp:RequiredFieldValidator ID="rfvName" ControlToValidate="username" runat="server" ErrorMessage="Không được để username trống!" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                    <input type="text" id="username" name="username" value="" placeholder="Nhập tên đăng nhập"/>
                </div>
            </div>
            <div class="row">
                <div class="left">Mật khẩu</div>
                <div class="right">
                    <input type="password" id="mk" name="matkhau" value="" placeholder="Nhập mật khẩu"/>
                </div>
            </div>
            <div class="row">
                <div class="left">Nhập lại mật khẩu</div>
                <div class="right">
                    <input type="password" id="rmk" name="rematkhau" value="" placeholder="Nhập lại mật khẩu"/>
                </div>
            </div>           
            <div class="row">
                <div class="left">Số điện thoại</div>
                <div class="right">
                    <input type="text" id="sdt" name="sodienthoai" value="" placeholder="Nhập số điện thoại"/>
                 </div>
                </div>
            <div class="row">
                <div class="left">Giới tính</div>
                <div class="right">
                    <input type="radio" id="rbNam" value="Nam" name="gender" /> Nam
                    <input type="radio" id="rbNu" value="Nu" name="gender" /> Nữ
                </div>             
                    <p><label id="loi"></label></p>
                     <p id="thongbaoasp"> <asp:Label ID="uNtontai" runat="server"></asp:Label> <asp:Label ID="pTontai" runat="server"></asp:Label></p>
            </div>

            <div class="row">
                <div class="left">&nbsp</div>
                <div class="right">
                     <input type="button" id="bt" name="them" value="Thêm" onclick="checkdulieu()" /><input type="submit" name="dangky" id="hidden"/>
                    <%--<asp:Button ID="bt" OnClientClick="return checkdulieu()" runat="server" Text="Thêm" OnClick="bt_Click" />--%>
                </div>
            </div>

            

            
        </div>
       
    </div>
</asp:Content>
