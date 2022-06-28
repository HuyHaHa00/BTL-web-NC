<%@ Page Title="" Language="C#" MasterPageFile="~/IndexPage.Master" AutoEventWireup="true" CodeBehind="detail.aspx.cs" Inherits="BTL_webNC.detail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        function tenID() {
            let click = document.getElementById("tenID");
            let login = document.getElementById("IDlogin").innerHTML;
            //
            setTimeout(function ten() {
                var x = location.href;
                var lastChar = x.substr(x.length - 1);
                var lastChar2 = x.substr(x.length - 2);
                if (lastChar == login || lastChar2 == login) {

                    click.href = x.replace(/#/g, '&');
                    var cf = confirm("Bạn muốn xóa bình luận này ?");
                    if (cf == true) {
                        click.click();
                    }
                    console.log(click.href);
                }

                //
                //
            }, 10);
            //let userID = document.querySelector("#uid");

        }
    </script>
    <div class="grid">
        
        <div class="col-8 noidung">
            <div class="detailTinchinh">              
            <div class="tinchinh">
                <asp:Repeater ID="rpBaidang" runat="server" >
                    <ItemTemplate>
                        <h1><%#Eval("sTieude") %></h1>
                        <i>Cập nhật: <%#Eval("dNgaydang") %> - Lượt xem: <%#Eval("iLuotxem") %></i>
                         <p><%#Eval("sNoidung") %></p>
                        
                    </ItemTemplate>                  
                </asp:Repeater>
            </div>
            <div class="sua">
                <asp:Button ID="btnSua" runat="server" Text="Sửa" OnClick="btnSua_Click" />
                <asp:Button ID="btnXoa" runat="server" Text="Xóa" />
            </div>
            </div>
            <h4>Bình luận</h4>
            <div class="binhluan">               
                <asp:DataList ID="dlBinhluan" runat="server">
                    <ItemTemplate>
                        <div class="BLleft"><img src="img/<%#Eval("sAnh")%>"/></div>                      
                        <div class="BLright">
                            <b id="bold"><%#Eval("sTen") %></b><br />
                            <span><%#Eval("sNoidung") %></span>
                            <a onclick="tenID()" href="#binhluanID=<%#Eval("PK_iBinhluanID") %>#userID=<%#Eval("iUserID") %>">:</a>
                            <a id="tenID" href="#"></a>
   
                        </div>                        
                    </ItemTemplate>
                </asp:DataList>
            </div>
            <div class="nguoibinhluan">
                <asp:Repeater ID="rpNguoibinhluan" runat="server">
                    <ItemTemplate>
                        <div class="BLleft"><img src="img/<%#Eval("sAnh") %>" /> </div>
                                           
                    </ItemTemplate>
                </asp:Repeater>
                <div class="BLright">
                    <asp:TextBox ID="txtCmt" runat="server" CssClass="txtCmt"></asp:TextBox>
                    <asp:Button ID="btnCmt" runat="server" Text="Bình luận" OnClick="btnCmt_Click" />
                </div>
                
            </div>
            <asp:Repeater ID="rpID" runat="server">
            <ItemTemplate>
                <a id="IDlogin" href="#"><%#Eval("iUserID") %></a>
            </ItemTemplate>
        </asp:Repeater>
                
        </div>



        <div class="col-4 ">
            
            <asp:DataList ID="dlTinkhac" runat="server">
                <ItemTemplate>
                    <div class="detailTinkhac">
                        <img src="img/<%#Eval("sAnh") %>"/>
                         <a class="sTinphu" href="detail.aspx?BaidangID=<%#Eval("PK_iBaidangID") %>&ChudeID=<%#Eval("FK_iChudeID") %>"><%#Eval("sTieude") %></a>
                     </div>
                 </ItemTemplate>
            </asp:DataList>
       </div>
        
    </div>
</asp:Content>
