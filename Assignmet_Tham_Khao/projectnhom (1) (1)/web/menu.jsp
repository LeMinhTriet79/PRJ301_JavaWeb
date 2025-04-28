<%@page import="DAO.ProductDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="DButils.utils"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DTO.UserDTO"%>
<%@page import="DTO.ProductDTO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trà Sữa GR5</title>
        <link rel="stylesheet"  href="css/menu.css">

    </head>
    <body>
        <%
            List<ProductDTO> productList = (List<ProductDTO>) request.getAttribute("PRODUCT_LIST");
            String searchMessage = (String) request.getAttribute("message");
            String errorMessage = (String) request.getAttribute("error");
        %>
        <!-- 🏷️ Thanh công cụ -->


        <%
            // Lấy thông tin user từ session
            UserDTO user = (UserDTO) session.getAttribute("USER");
        %>
        <% if (user != null) { %>
        <form action="MainController" method="POST">
            <button type="submit" name="action" value="logout">ĐĂNG XUẤT</button>
        </form>
        <% } else { %>
        <a href="login.jsp" style="color: #007bff;">ĐĂNG NHẬP</a>
        <% } %>
    </div>

    <!-- Hiển thị thông báo tìm kiếm -->
    <% if (errorMessage != null) {%>
    <p style="color: red;"><%= errorMessage%></p>
    <% } %>
    <% if (searchMessage != null) {%>
    <p style="color: blue;"><%= searchMessage%></p>
    <% } %>

    <!-- Hiển thị danh sách sản phẩm -->
   <div class="product-container">
    <% if (productList != null && !productList.isEmpty()) { %>
    <% for (ProductDTO p : productList) {%>
    <div class="product-card">
        <img src="<%= p.getImage()%>" alt="<%= p.getProductName()%>" width="150">
        <p><strong><%= p.getProductName()%></strong></p>
        <p><%= String.format("%,.0f", p.getPrice())%>đ</p>
        <!-- Truyền thông tin sản phẩm qua URL -->
        <a href="shoppingCart.jsp?name=<%= p.getProductName() %>&price=<%= p.getPrice() %>&image=<%= p.getImage() %>" class="add-to-cart">+</a>
    </div>
    <% } %>
    <% } %>
</div>

    <div>
        <div class="banner">

            <nav>
                <ul>
                    <a href="index.jsp">
                        <div class="LOGO"><img src="images/logogr5.jpg" alt="Logo"> </div>
                    </a>
                    <li><a href="index.jsp">TRANG CHỦ</a></li>
                    <li><a href="menu.jsp">SẢN PHẨM</a></li>
                    <li><a href="about.jsp">GIỚI THIỆU</a></li>
                    <li><a href="contact.jsp">LIÊN HỆ</a></li>
                        <% if (user != null) { %>
                    <!-- Nếu đã đăng nhập, hiển thị nút ĐĂNG XUẤT -->
                    <li>
                        <form action="MainController" method="POST" style="display: inline;">
                            <button type="submit" name="action" value="logout" class="login-btn">ĐĂNG XUẤT</button>
                        </form>
                    </li>
                    <% } else { %>
                    <!-- Nếu chưa đăng nhập, hiển thị nút ĐĂNG NHẬP -->
                    <a href="login.jsp?redirect=menu.jsp" class="login-btn">ĐĂNG NHẬP</a>
                    <% }%>                    </ul>

            </nav>


        </div>

        <!-- Danh Mục -->
        <div class="menu">
            <h3>Danh Mục</h3>
            <a href="#tra-sua">Trà Sữa </a>
            <a href="#tra-trai-cay">Trà Trái Cây</a>
            <a href="#da-xay-smoothie">Đá Xay - Smoothie</a>
            <a href="#topping">Topping</a>
            <a href="#do-an-vat">Đồ Ăn Vặt</a>
            <a href="#tra-dac-biet">Trà Đặc Biệt</a>
            <a href="#nuoc-uong-khac">Nước Uống Khác</a>
        </div>



        <!-- Nội dung các danh mục -->
        <div class="content">
            <div class="search-container">
                <form action="MainController" method="GET">
                    <input type="text" class="search-input" placeholder="Tìm kiếm..." name="keyword" aria-label="Tìm kiếm">
                    <button type="submit" class="search-button" name="action" value="search">TÌM</button>
                </form>
            </div>

            <div id="tra-sua" class="section">
                <h2>Trà Sữa</h2>
                <div>
                    <ul class="products">
                        <li><div class="product">
                                <img src="images/Tra sua truyen thong/trasua_khoaimon.jpg" alt="san pham">
                                <h3>Trà sữa khoai môn</h3>
                                <p class="price">35,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>
                        <li><div class="product">
                                <img src="images/Tra sua truyen thong/trasua_matcha.jpg" alt="san pham">
                                <h3>Trà sữa matcha</h3>
                                <p class="price">35,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>
                        <li><div class="product">
                                <img src="images/Tra sua truyen thong/trasua_olong.jpg" alt="san pham">
                                <h3>Trà sữa ô long</h3>
                                <p class="price">35,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>
                        <li><div class="product">
                                <img src="images/Tra sua truyen thong/trasua_socola.jpg" alt="san pham">
                                <h3>Trà sữa socola</h3>
                                <p class="price">35,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>
                        <li><div class="product">
                                <img src="images/Tra sua truyen thong/trasua_thaido.jpg" alt="san pham">
                                <h3>Trà sữa thái đỏ</h3>
                                <p class="price">35,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>
                        <li><div class="product">
                                <img src="images/Tra sua truyen thong/trasua_thaixanh.jpg" alt="san pham">
                                <h3>Trà sữa thái xanh</h3>
                                <p class="price">35,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>
                        <li><div class="product">
                                <img src="images/Tra sua truyen thong/trasua_truyenthong.jpg" alt="san pham">
                                <h3>Trà sữa truyền thống</h3>
                                <p class="price">35,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>


                    </ul>
                </div>
            </div>

            <div id="tra-trai-cay" class="section">
                <h2>Trà Trái Cây</h2>
                <div>
                    <ul class="products">
                        <li><div class="product">
                                <img src="images/Tra trai cay/tra_buoihong.jpg" alt="san pham">
                                <h3>Trà bưởi hồng</h3>
                                <p class="price">35,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>
                        <li><div class="product">
                                <img src="images/Tra trai cay/tra_chanhday.jpg" alt="san pham">
                                <h3>Trà chanh dây</h3>
                                <p class="price">35,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>
                        <li><div class="product">
                                <img src="images/Tra trai cay/tra_dao.jpg" alt="san pham">
                                <h3>Trà đào</h3>
                                <p class="price">35,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>
                        <li><div class="product">
                                <img src="images/Tra trai cay/tra_daocamsa.jpg" alt="san pham">
                                <h3>Trà đào cam sả</h3>
                                <p class="price">35,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>
                        <li><div class="product">
                                <img src="images/Tra trai cay/tra_dau.jpg" alt="san pham">
                                <h3>Trà dâu</h3>
                                <p class="price">35,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>
                        <li><div class="product">
                                <img src="images/Tra trai cay/tra_taoxanh.jpg" alt="san pham">
                                <h3>Trà táo xanh</h3>
                                <p class="price">35,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>
                        <li><div class="product">
                                <img src="images/Tra trai cay/tra_vai.jpg" alt="san pham">
                                <h3>Trà vãi</h3>
                                <p class="price">35,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>


                    </ul>
                </div>
            </div>

            <div id="da-xay-smoothie" class="section">
                <h2>Đá Xay - Smoothie</h2>
                <div>
                    <ul class="products">
                        <li><div class="product">
                                <img src="images/Da xay/cookie_daxay.jpg" alt="san pham">
                                <h3>Cookie đá xay</h3>
                                <p class="price">35,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>
                        <li><div class="product">
                                <img src="images/Da xay/dau_daxay.jpg" alt="san pham">
                                <h3>Dâu đá xay</h3>
                                <p class="price">35,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>
                        <li><div class="product">
                                <img src="images/Da xay/kiwi_daxay.jpg" alt="san pham">
                                <h3>Kiwi đá xay</h3>
                                <p class="price">35,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>
                        <li><div class="product">
                                <img src="images/Da xay/matcha_daxay.jpg" alt="san pham">
                                <h3>Matcha đá xay</h3>
                                <p class="price">35,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>
                        <li><div class="product">
                                <img src="images/Da xay/socola_daxay.jpg" alt="san pham">
                                <h3>Socola đá xay</h3>
                                <p class="price">35,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>
                        <li><div class="product">
                                <img src="images/Da xay/vietquat_daxay.jpg" alt="san pham">
                                <h3>Việt quất đá xay</h3>
                                <p class="price">35,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>
                        <li><div class="product">
                                <img src="images/Da xay/xoai_daxay.jpg" alt="san pham">
                                <h3>Xoài đá xay</h3>
                                <p class="price">35,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>


                    </ul>
                </div>
            </div>

            <div id="topping" class="section">
                <h2>Topping</h2>
                <div>
                    <ul class="products">
                        <li><div class="product">
                                <img src="images/Topping/kem_phomai.jpg" alt="san pham">
                                <h3>Kem phô mai</h3>
                                <p class="price">10,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>
                        <li><div class="product">
                                <img src="images/Topping/pudding.jpg" alt="san pham">
                                <h3>Pudding</h3>
                                <p class="price">10,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>
                        <li><div class="product">
                                <img src="images/Topping/suong_sao.jpg" alt="san pham">
                                <h3>Sương sáo</h3>
                                <p class="price">10,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>
                        <li><div class="product">
                                <img src="images/Topping/thach_traicay.jpg" alt="san pham">
                                <h3>Thạch trái cây</h3>
                                <p class="price">10,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>
                        <li><div class="product">
                                <img src="images/Topping/tranchau_den.jpg" alt="san pham">
                                <h3>Trân châu đen</h3>
                                <p class="price">10,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>
                        <li><div class="product">
                                <img src="images/Topping/tranchau_trang.jpg" alt="san pham">
                                <h3>Trân châu trắng</h3>
                                <p class="price">10,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>
                        <li><div class="product">
                                <img src="images/Topping/kem_tuoi.jpg" alt="san pham">
                                <h3>Kem tươi</h3>
                                <p class="price">10,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>


                    </ul>
                </div>
            </div>

            <div id="do-an-vat" class="section">
                <h2>Đồ Ăn Vặt</h2>
                <div>
                    <ul class="products">
                        <li><div class="product">
                                <img src="images/Do an vat/banh_plan.jpg" alt="san pham">
                                <h3>Bánh Plan</h3>
                                <p class="price">35,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>
                        <li><div class="product">
                                <img src="images/Do an vat/banh_sukem.jpg" alt="san pham">
                                <h3>Bánh su kem</h3>
                                <p class="price">35,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>
                        <li><div class="product">
                                <img src="images/Do an vat/banhgao_cay.jpg" alt="san pham">
                                <h3>Bánh gạo cay</h3>
                                <p class="price">35,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>
                        <li><div class="product">
                                <img src="images/Do an vat/bo_kho.jpg" alt="san pham">
                                <h3>Bò khô</h3>
                                <p class="price">35,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>
                        <li><div class="product">
                                <img src="images/Do an vat/khoaitay_chien.jpg" alt="san pham">
                                <h3>Khoai tây chiên</h3>
                                <p class="price">35,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>
                        <li><div class="product">
                                <img src="images/Do an vat/khoga_lachanh.jpg" alt="san pham">
                                <h3>Khô gà lá chanh</h3>
                                <p class="price">35,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>
                        <li><div class="product">
                                <img src="images/Do an vat/huong_duong.jpg" alt="san pham">
                                <h3>Hạt hướng dương</h3>
                                <p class="price">35,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>


                    </ul>
                </div>
            </div>

            <div id="tra-dac-biet" class="section">
                <h2>Trà Đặc Biệt</h2>
                <div>
                    <ul class="products">
                        <li><div class="product">
                                <img src="images/Tra dac biet/hong_tra.jpg" alt="san pham">
                                <h3>Hồng trà</h3>
                                <p class="price">35,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>
                        <li><div class="product">
                                <img src="images/Tra dac biet/tra_den.jpg" alt="san pham">
                                <h3>Trà đen</h3>
                                <p class="price">35,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>
                        <li><div class="product">
                                <img src="images/Tra dac biet/tra_gaorang.jpg" alt="san pham">
                                <h3>Trà gạo rang</h3>
                                <p class="price">35,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>
                        <li><div class="product">
                                <img src="images/Tra dac biet/tra_hoacuc.jpg" alt="san pham">
                                <h3>Trà hoa cúc</h3>
                                <p class="price">35,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>
                        <li><div class="product">
                                <img src="images/Tra dac biet/tra_hoa_nhai.jpg" alt="san pham">
                                <h3>Trà hoa nhài</h3>
                                <p class="price">35,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>
                        <li><div class="product">
                                <img src="images/Tra dac biet/tra_xanh.jpg" alt="san pham">
                                <h3>Trà xanh</h3>
                                <p class="price">35,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>
                        <li><div class="product">
                                <img src="images/Tra dac biet/tra_tac_thai_xanh.jpg" alt="san pham">
                                <h3>Trà tắc thái xanh</h3>
                                <p class="price">35,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>


                    </ul>
                </div>
            </div>

            <div id="nuoc-uong-khac" class="section">
                <h2>Nước Uống Khác</h2>
                <div>
                    <ul class="products">
                        <li><div class="product">
                                <img src="images/tra sua dac biet/trasua_caramel.jpg" alt="san pham">
                                <h3>Trà sữa caramel</h3>
                                <p class="price">35,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>
                        <li><div class="product">
                                <img src="images/tra sua dac biet/trasua_dautay.jpg" alt="san pham">
                                <h3>Trà sữa dâu tây</h3>
                                <p class="price">35,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>
                        <li><div class="product">
                                <img src="images/tra sua dac biet/trasua_dua.jpg" alt="san pham">
                                <h3>Trà sữa dừa</h3>
                                <p class="price">35,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>
                        <li><div class="product">
                                <img src="images/tra sua dac biet/trasua_.jpg" alt="san pham">
                                <h3>Trà sữa thái đỏ kem muối</h3>
                                <p class="price">35,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>
                        <li><div class="product">
                                <img src="images/tra sua dac biet/trasua_kiwi.jpg" alt="san pham">
                                <h3>Trà sữa kiwi</h3>
                                <p class="price">35,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>
                        <li><div class="product">
                                <img src="images/tra sua dac biet/trasua_pudding.jpg" alt="san pham">
                                <h3>Trà sữa pudding</h3>
                                <p class="price">35,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>
                        <li><div class="product">
                                <img src="images/tra sua dac biet/trasua_xoai.jpg" alt="san pham">
                                <h3>Trà sữa xoài</h3>
                                <p class="price">35,000đ</p>
                                <label for="modal-toggle" class="add-to-cart">+</label>
                            </div></li>


                    </ul>
                </div>
            </div>


        </div>
        <input type="checkbox" id="modal-toggle" class="modal-toggle">
        <div class="modal">
            <div class="modal-content">
                <label for="modal-toggle" class="close">&times;</label>
                <div class="modal-header">
                    <h3>Trà sữa khoai môn</h3>
                    <p class="price">35,000đ</p>
              <%
    // Kiểm tra đăng nhập trước khi mua hàng
    if (user == null) {
%>
    <div class="login-required">
        <p>Vui lòng <a href="login.jsp?redirect=menu.jsp">đăng nhập</a> để mua hàng!</p>
    </div>     

<%
    } else {
String productID = request.getParameter("ProductID");

    // Đặt giá trị mặc định là "Trà sữa khoai môn" - 35.000đ
    String productName = "Trà sữa khoai môn";
    double basePrice = 35000;

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        conn = utils.getConnection(); // Giả sử utils có hàm kết nối

        // Truy vấn sản phẩm
        String sql = "SELECT ProductName, Price FROM Product WHERE ProductID = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, productID);
        rs = pstmt.executeQuery();

        // Nếu tìm thấy sản phẩm, cập nhật thông tin
        if (rs.next()) {
            productName = rs.getString("ProductName");
            basePrice = rs.getDouble("Price");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Đóng tài nguyên một cách an toàn
        if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
        if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
    }

    double totalPrice = basePrice; 
%>

<!-- Hiển thị thông tin sản phẩm -->
<div class="modal-header">
    <img src="images/background1.jpg" alt="<%= productName %>" width="100">
    <h3><%= productName %></h3>
    <p class="price"><%= new DecimalFormat("#,###").format(basePrice) %>đ</p>
</div>


<% 
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String[] toppings = request.getParameterValues("topping");
        if (toppings != null) {
            for (String toppingPrice : toppings) {
                totalPrice += Double.parseDouble(toppingPrice);
            }
        }

        // Ghi dữ liệu vào database (nếu cần)
        Connection connOrder = null;
        PreparedStatement stmtOrder = null;
        ResultSet rsOrder = null;

        try {
            connOrder = utils.getConnection(); // Lấy kết nối database

            // Thêm đơn hàng vào bảng Order
            String sqlOrder = "INSERT INTO [Order] (UserID, OrderDate, FinalAmount, ShippingStatus) VALUES (?, GETDATE(), ?, 'Pending')";
            stmtOrder = connOrder.prepareStatement(sqlOrder, Statement.RETURN_GENERATED_KEYS);
            stmtOrder.setInt(1, 1); // Giả sử UserID = 1 (cần lấy từ session)
            stmtOrder.setDouble(2, totalPrice);
            stmtOrder.executeUpdate();

            // Lấy OrderID vừa tạo
            rsOrder = stmtOrder.getGeneratedKeys();
            int orderID = -1;
            if (rsOrder.next()) {
                orderID = rsOrder.getInt(1);
            }

            // Thêm vào OrderDetail nếu OrderID hợp lệ
            if (orderID != -1) {
                String sqlOrderDetail = "INSERT INTO OrderDetail (OrderID, ProductID, Quantity, Price) VALUES (?, ?, ?, ?)";
                PreparedStatement stmtDetail = connOrder.prepareStatement(sqlOrderDetail);
                stmtDetail.setInt(1, orderID);
                stmtDetail.setString(2, productID);
                stmtDetail.setInt(3, 1); // Mặc định mua 1 sản phẩm
                stmtDetail.setDouble(4, basePrice);
                stmtDetail.executeUpdate();
                stmtDetail.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Đóng kết nối an toàn
            if (rsOrder != null) try { rsOrder.close(); } catch (SQLException ignore) {}
            if (stmtOrder != null) try { stmtOrder.close(); } catch (SQLException ignore) {}
            if (connOrder != null) try { connOrder.close(); } catch (SQLException ignore) {}
        }
%>

<script>
    alert("Thanh toán thành công!\nSản phẩm: <%= productName %>\nTổng tiền: <%= new DecimalFormat("#,###").format(totalPrice) %>đ");
    window.location.href = "menu.jsp"; // Quay về menu
</script>

<% } %>
    
<form method="post">
    <div class="topping-options">
        <h4>Topping</h4>
        <label class="topping">
            <input type="checkbox" name="topping" value="10000"> Kem phô mai (+10,000đ)
        </label><br>
        <label class="topping">
            <input type="checkbox" name="topping" value="10000"> Pudding (+10,000đ)
        </label><br>
        <label class="topping">
            <input type="checkbox" name="topping" value="10000"> Sương sáo (+10,000đ)
        </label><br>
        <label class="topping">
            <input type="checkbox" name="topping" value="10000"> Thạch trái cây (+10,000đ)
        </label><br>
    </div>

    <!-- Đặt nút trong form -->
    <button type="submit">Thanh toán</button>
</form>

<%
    } // <-- Đóng dấu } cuối cùng để kết thúc else
%>

                </div>
            </div>
        </div>
    </div>


</body>
</html>


</body>
</html>
