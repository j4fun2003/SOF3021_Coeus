<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Coeus - Mua sách trực tuyến</title>
</head>
<body>
	<!--===== HEADER =====-->
        <header class="l-header" id="header">
            <nav class="nav bd-grid">
                <div>
                    <a href="/home/index" class="nav__logo"><img alt="" src="../img/logo.png" style="width:60px !important"></a>
                </div>

                <div class="nav__menu" id="nav-menu">
                    <ul class="nav__list">
                        <li class="nav__item"><a href="/home/index" class="nav__link active">Trang chủ</a></li>
                        <li class="nav__item"><a href="/home/index#featured" class="nav__link">Mua hàng</a></li>
                        <div class="drop__down-menu">
                            <li class="nav__item"><a class="nav__link">Thể loại</a></li>
                            <ul class="menu">
                                <li>&nbsp;<a href="/home/index?category=TN#featured">Truyện Ngắn</a></li>
                                <li><a href="/home/index?category=TTT#featured">&nbsp;Tiểu Thuyết</a></li>
                                <li><a href="/home/index?category=KD#featured">&nbsp;Kinh Doanh</a></li>
                                <li><a href="/home/index?category=TT#featured">&nbsp;Thể Thao</a></li>
                                <li><a href="/home/index?category=HD#featured">&nbsp;Hành Động</a></li>
                                <li><a href="/home/index?category=VT#featured">&nbsp;Viễn Tưởng</a></li>
                                <li><a href="/home/index?category=TTH#featured">&nbsp;Trinh Thám</a></li>
                            </ul>
                        </div>
                           <li class="nav__item"><a href="/home/index#contact-area" class="nav__link">Liên hệ</a></li>
                    </ul>
                </div>
                <div class="header__cart">
                    <div class="header__cart-wrap">
                        <i class='bx bx-cart nav__cart'></i>
                     <%--    <span class="header__cart-notice" id="cart-count">${shoppingCart.count}</span> --%>

                        <!--no cart: header__cart-list-no-cart -->
                        <div class="header__cart-list ">
                            <img src="assets/img/cart-img.jpg" alt="" class="header__cart-no-cart-img">
                            <span class="header__cart-list-no-cart-message">Không có sản phẩm</span>

                            <h4 class="header__cart-heading">Giỏ hàng</h4>
                            <ul class="header__cart-list-item">
                                <!-- Cart item -->
                                <c:forEach var="product" items="${shoppingCart.products}">
                                	<li class="header__cart-item">
                                		<img class="header__cart-img" src="../images/product/${product.image1}"/>
                                		<div class="header__cart-item-info">
                                			<div class="header__cart-item-head">
                                				<h5 class="header__cart-item-name">${product.name}</h5>
                                				<div class="header__cart-item-price-wrap">
                                					<span class="header__cart-item-price">
                                						<fmt:formatNumber value="${newPrice}" type="currency" currencySymbol="VND"></fmt:formatNumber>
                                					</span>
                                					<span class="header__cart-item-multiply">x</span>
                                					<span class="header__cart-item-soluong">${product.quantity}</span>
                                				</div>
                                			</div>
                                			<div class="header__cart-item-body">
                                				<span class="header__cart-item-description">Classify: ${product.category.name}</span>
                                				<span class="header__cart-item-remove">Xóa</span>
                                			</div>                    	
                                		</div>
                                	</li>
                                </c:forEach>
                             
                            </ul>
                            <a href="/home/cart" class="header__cart-view-cart">
                            <div class="btn btn-primary">
                               Xem thêm 
                            </div>
                            </a>
                        </div>
                    </div>
                    <div class="drop__down-menu">
                    <span><i class='bx bxs-user'></i></span>
                    <ul class="user">
                    	<c:if test="${user == null }">
                        	<li><a href="/account/login">Đăng nhập</a></li>
                        	<li><a href="/account/login">Đăng ký</a></li>
                    	</c:if>
  	                    <c:if test="${user != null }">
                        	<li><a href="/account/profilecard">Tài khoản</a></li>
                        	<li><a href="/account/changePassword">Đổi mật khẩu</a></li>
                        	<li><a href="/account/logout">Đăng xuất</a></li>
                        	<c:if test="${user.admin}">
                        		<li><a href="/home/admin">Quản lý website</a></li>
                        		<li><a href="/home/order">Lịch sử mua hàng</a></li>
                        	</c:if>
                        	<c:if test="${!user.admin}">
                        		<li><a href="/home/order">Lịch sử mua hàng</a></li>
                        	</c:if>
                    	</c:if>
                    </ul>
                </div>   
                    
                </div>
                <h5>${user.fullname == null ? user.username : user.fullname}</h5>
                <i class='bx bx-menu nav__toggle' id="nav-toggle" ></i>
                
            </nav>
        </header>

</body>
</html>