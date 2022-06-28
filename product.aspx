<%@ Page Title="" Language="C#" MasterPageFile="~/IndexPage.Master" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="BTL_webNC.product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="grid">   
        <div class="col-1"></div>
        <div class="col-10 pageList">
                <div class="col-4 item">
                    <img src="img/ao1.jpeg" />
                    <h5 class="ten">Team 31</h5>
                    <h5 class="price">900.000</h5>
                    <h6 class="but">Thêm vào giỏ hàng</h6>
                </div>

                 <div class="col-4 item">
                    <img src="img/ao2.jpeg" />
                    <h5 class="ten">Jordan Jumpman Classics</h5>
                    <h5 class="price">819.000</h5>
                     <h6 class="but">Thêm vào giỏ hàng</h6> 
                </div>

                <div class="col-4 item">
                    <img src="img/ao3.jpeg" />
                    <h5 class="ten">Nike Sportswear</h5>
                    <h5 class="price">999.000</h5>
                    <h6 class="but">Thêm vào giỏ hàng</h6> 
                </div>

                 <div class="col-4">
                    <img src="img/ao4.jpeg" />
                    <p>Nike Sportswear</p>
                    <p>1,279,000</p>
                </div>

                <div class="col-4">
                    <img src="img/ao5.jpeg" />
                    <p>Nike NB</p>
                    <p>659,000</p>
                </div>

                 <div class="col-4">
                    <img src="img/ao6.jpeg" />
                    <p>Jordan Dri-FIT Zion</p>
                    <p>1,879,000</p>
                </div> 
            <div class="cart">
                <h2> Cart </h2>
            
            <table>
                <thead>
                    <tr>
                        <th>Sản phẩm</th>
                        <th>Tên</th>
                        <th>Giá</th>
                        <th>Số lượng</th>
                        <th>Chọn</th>
                    </tr>
                </thead>
                <tbody>
                    <%--<tr>
                        <td>
                            <img style = "width:50px;" src="' + productImg + '"/>
                        </td>
                        <td> <span class="name">' + productName + '</span></td>
                        <td> Giá:<span class="gia">' + productPrice + '</span></td>
                        <td>Số lượng<input class="soluong" type="number" value="1" min="1" /> </td>
                        <td><span class="xoa"> Xóa</span></td>
                    </tr>--%>
                </tbody>
                

            </table>
            </div>
            <div class="bangtinhtien">
                <p class="total" >Tổng tiền : <span> </span><sup>đ</sup></p>
            </div>
        </div>

        <div class="col-1 right"></div>
        <script src="JavaScript.js"></script>
    </div>
</asp:Content>
