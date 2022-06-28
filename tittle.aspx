<%@ Page Title="" Language="C#" MasterPageFile="~/IndexPage.Master" AutoEventWireup="true" CodeBehind="tittle.aspx.cs" Inherits="BTL_webNC.tittle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="grid">        
        <div class="col-8 noidung">
            <asp:Repeater ID="rpChude" runat="server">
                    <ItemTemplate>
                        <h2><%#Eval("sTenchude") %></h2>
                    </ItemTemplate>
                </asp:Repeater>
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
        </div>
   

        <div class="col-4 banner">
            <div><img src="img/right_banner.jpg"/></div>
            <div class="tinkhacindex">
                <div><h2><mark>Các tin trong tuần</mark></h2><hr /></div>
                <asp:Repeater ID="rpTinphu" runat="server" DataSourceID="LinqDataSource1">
                    <ItemTemplate>
                         <a class="sTinphu" href="detail.aspx?BaidangID=<%#Eval("PK_iBaidangID") %>&ChudeID=<%#Eval("FK_iChudeID") %>"><%#Eval("sTieude") %></a>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="BTL_webNC.DataClasses1DataContext" EntityTypeName="" Select="new (PK_iBaidangID, sTieude, FK_iChudeID)" TableName="tblBaidangs">
                </asp:LinqDataSource>
            </div>
            
            </div>
    
        </div>

</asp:Content>
