<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<main class="l-main">
            <!--===== HOME =====-->
            <section class="home" id="home" style="background-image:url('../img/banner.png');background-size: cover;">
                <div class="home__container bd-grid">
                    <div class="home__data">
                        <h1 class="home__title" style="color:white">COEUS <br><span>Tri thức không giới hạn</span></h1>
                    </div>
                </div>
            </section>

            <!--===== COLLECTION =====-->
            <section class="collection section">
                <div class="collection__container row">
						<div class="col-4" >
							<img alt="" src="..//img/poster1.jpg" width="100%" height="196px">
						</div>
                    	<div class="col-4">
							<img alt="" src="..//img/poster2.jpg" width="100%" height="196px">
						</div>
							<div class="col-4">
							<img alt="" src="..//img/poster3.jpg" width="100%" height="196px">
						</div>
                    
                </div>
            </section>

            <!--===== FEATURED PRODUCTS =====-->
            <section class="featured section" id="featured">
                <h2 class="section-title">SẢN PHẨM MỚI</h2>
                <a href="/home/index?all#featured" class="section-all">Xem tất cả</a>
                <div class="featured__container bd-grid">
                	<c:forEach var="product" items="${products.content}">
                	<input type="hidden" id="${product.id}"/>
                		<span>
                			<div class="featured__product">
                				<div class="featured__box">
                					<div class="featured__new">HÀNG HOT</div>
                					<a href="/home/product-detail?id=${product.id}">
                						<img src="../images/product/${product.image1}" alt="product.png" class="featured__img"/>
                					</a>
                				</div>
                				
                				<div class="featured__data">
                					<h3 class="featured__name">${product.name}</h3>
                					<span class="featured__preci">
                						<fmt:formatNumber value="${product.price}" type="currency" currencySymbol="VND"/>
                					</span>
                				</div>
                			</div>
                		</span>
                	</c:forEach>
                	
                
                </div>
               
            </section>

            <div class="btn-changepage">
            <a class="btn btn-primary offset-3" href="/home/index?p=0&category=${category}#featured">Trang đầu</a>
            		<c:if test="${products.number == 0 }">
            			<a class="btn btn-primary" href="#">Trước</a>
            		</c:if>
            		<c:if test="${products.number != 0 }">
            			<a class="btn btn-primary" href="/home/index?p=${products.number-1}&category=${category}#featured">Trước</a>
            		</c:if>
            		<c:if test="${products.number >= (products.totalPages - 1)}">
            			<a class="btn btn-primary" href="#">Sau</a>
            		</c:if>
            		<c:if test="${products.number < (products.totalPages - 1)}">
						<a class="btn btn-primary" href="/home/index?p=${products.number+1}&category=${category}#featured">Sau</a>         		
            		</c:if>
					<a class="btn btn-primary" href="/home/index?p=${products.totalPages-1}&category=${category}#featured">Trang cuối</a>
            </div>
					<h5 align="center">${products.number+1}/${products.totalPages}</h5>
					              <section class="container-slide">
            <div id="slide">
                <div class="slide-item" style="background-image: url('../img/slide1.jpg');" ></div>
                <div class="slide-item" style="background-image: url('../img/slide2.jpg');"></div>
                <div class="slide-item" style="background-image: url('../img/slide1.jpg');"></div>
                <div class="slide-item" style="background-image: url('../img/slide2.jpg');"></div>
                <div class="slide-item" style="background-image: url('../img/slide1.jpg');"></div>
                <div class="slide-item" style="background-image: url('../img/slide2.jpg');"></div>
                <div class="buttons">
                    <button id="prev"><i class="fa-regular fa-circle-caret-left"></i></button>
                    <button id="next"><i class="fa-regular fa-circle-caret-right"></i></button>
                </div>
            </div>
        </section>
			  <section class="contact reveal" id="contact-area" style="margin: 50px;">
            <div class="container">
                <div style="text-align:center;font-weight: 700;">
                    <h2 style="font-size:2rem">Liên hệ </h2>
                    <p>Liên hệ trực tiếp nếu bạn có thắc mắc!</p>
                  </div>
                  <div class="row">
                    <div class="col">
                      <img src="../img/map.jpg" style="width:100%">
                    </div>
                    <div class="col">
                      <form action="/action_page.php">
                        <label for="fname">Họ và tên</label>
                        <input type="text" id="fname" name="fullname" class="form-control-fake" placeholder="Họ và tên">
                        <label for="lname">Mail</label>
                        <input type="text" id="lname" name="email"  class="form-control-fake" placeholder="Email">
                        <label for="country">Thành phố</label>
                        <select id="country" name="country" class="form-control">
                          <option value="hcm">Hồ Chí Minh</option>
                          <option value="bthuan">Bình Thuận</option>
                          <option value="btre">Bến Tre</option>
                          <option value="dnai">Đồng Nai</option>
                        </select> <br>
                        <label for="subject">Chủ đề</label>
                        <textarea id="subject" name="subject" class="form-control-fake" placeholder="Write something.." style="height:170px"></textarea>
                        <input type="submit" value="Submit">
                      </form>
                    </div>
                
                </div>
            </div>
    
        </section>
      
        </main>
</body>
</html>