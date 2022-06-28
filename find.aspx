<%@ Page Title="" Language="C#" MasterPageFile="~/IndexPage.Master" AutoEventWireup="true" CodeBehind="find.aspx.cs" Inherits="BTL_webNC.find" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="grid">        
        <div class="col-8 noidung">
            <div class="bai">  
            <asp:Datalist ID="dlTieude" runat="server">
                 <ItemTemplate>                
                        <div class="tinchinh">
                            <div class="col-4 anh">
                                <img src="img/<%#Eval("sAnh") %>" />
                            </div>
                            <div class="col-8 tin">                  
                                    <a class="sTieude" href="detail.aspx?BaidangID=<%#Eval("PK_iBaidangID") %>&ChudeID=<%#Eval("FK_iChudeID") %>"><%#Eval("sTieude") %></a>
                                    <i><%#Eval("sNoidung") %></i>                    
                            </div>
                        </div>                   
                 </ItemTemplate>
            </asp:Datalist>
                </div>
            
            <div class="bai">

            </div>
        </div>
        <div class="col-4 banner">
            <div><img src="img/right_banner.jpg"/></div>
            <div class="tinkhacindex">
                <div><h2><mark>Các tin trong tuần</mark></h2><hr /></div>
                <asp:Repeater ID="rpTinphu" runat="server">
                    <ItemTemplate>
                         <a class="sTinphu" href="detail.aspx?BaidangID=<%#Eval("PK_iBaidangID") %>&ChudeID=<%#Eval("FK_iChudeID") %>"><%#Eval("sTieude") %></a>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            
            
        </div>
    </div>
</asp:Content>
