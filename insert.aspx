<%@ Page Title="" Language="C#" MasterPageFile="~/IndexPage.Master" AutoEventWireup="true" CodeBehind="insert.aspx.cs" Inherits="BTL_webNC.insert" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <script src="ckeditor/ckeditor.js"></script>
    <div class="grid">
        <div class="col-1"></div>
        <div class="col-10">
            <div class="col-6"><asp:Repeater ID="rpBaidang" runat="server">
                    <ItemTemplate>
                        <h3 runat="server" id="tieude"><%#Eval("sTieude") %></h3>
                        <i>Cập nhật: <%#Eval("dNgaydang") %></i><br />
                        <i>Lượt xem: <%#Eval("iLuotxem") %></i>
                         <p><%#Eval("sNoidung") %></p>
                    </ItemTemplate>                  
                </asp:Repeater></div>
            
            <div><h3>
                <asp:Label ID="lbDangbai" runat="server" Text=""></asp:Label></h3></div>
            <div>
                <h5>Chọn bản tin</h5>
                <asp:DropDownList ID="ddlChude" runat="server"></asp:DropDownList>
                <h5>Chọn ảnh đại diện</h5>
                <asp:FileUpload ID="ava" AllowMultiple="false"   runat="server" />
                <asp:RegularExpressionValidator ID="revAnh" runat="server" ErrorMessage="Chỉ được chọn tệp ảnh!" ControlToValidate="ava" ValidationExpression="(.*\.([Jj][Pp][Gg])|.*\.([Jj][Pp][Ee][Gg])|.*\.([Pp][Nn][Gg])$)" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                <h5>Tiêu đề bản tin</h5>
                <asp:TextBox ID="txtTenbantin" runat="server" ></asp:TextBox>
                <h5>Nội dung</h5>
                <asp:TextBox ID="txtNoidung" runat="server" TextMode="MultiLine"></asp:TextBox>
                <script type="text/javascript" lang="javascript">CKEDITOR.replace('<%=txtNoidung.ClientID%>');</script> 
                    <br /> <br />
                <asp:Button ID="btnInsert" runat="server" Text="Đăng bài" OnClick="btnInsert_Click"></asp:Button>
            </div>
            
            
        </div>
        <div class="col-1"></div>
     </div>
</asp:Content>
