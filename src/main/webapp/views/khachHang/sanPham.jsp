<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<title>Tropical</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/sanpham.css">
</head>
<body>

	<div class="warper">

		<div class="topp">

			<div class="header">

				<nav class="ass">
					<a href="" class="logo"><img src="img/logo (1).png" alt="">
					</a>
					<ul class="main-menu">
						<li><a href="/home"> Trang chủ</a></li>
						<li><a href="/sanPham">Sản Phẩm</a>
							<ul class="sup">
								<li><a href="">Quần</a>
									<ul class="sup">
										<li><a href="">Quần đùi</a></li>
										<li><a href="">Quần dài</a></li>
										<li><a href="">quần lót</a></li>

									</ul></li>
								<li><a href="">Áo</a>
									<ul class="sup">
										<li><a href="">Áo sơ mi</a></li>
										<li><a href="">Polo</a></li>
										<li><a href="">Áo Khoác</a></li>
										<li><a href="">Áo Phông</a></li>
									</ul></li>
								<li><a href="">Giày</a>
									<ul class="sup">
										<li><a href="">Giày lười</a></li>
										<li><a href="">Sneaker</a></li>

									</ul></li>
								<li><a href="">Túi</a>
									<ul class="sup">
										<li><a href="">Túi xách</a></li>
										<li><a href="">Balo</a></li>
									</ul></li>
								<li><a href="">Phụ kiện</a>
									<ul class="sup">
										<li><a href="">vòng cổ/tay</a></li>
										<li><a href="">khuyên tai</a></li>
									</ul>
							</ul></li>
						<li><a href="${ pageContext.request.contextPath }/gioHang">Giỏ
								Hàng</a></li>
						<li><a href="${ pageContext.request.contextPath }/hoaDon">Hóa
								Đơn</a></li>
					</ul>

				</nav>

			</div>

		</div>
		<div class="ssd">
			<form class="seark"
				action="${ pageContext.request.contextPath }/sanPham/searh"
				method="post">
				<input name="ten" value="${param.ten }" class="search">

				<button>searh</button>
			</form>
		</div>
		<div class="botttom">

			<div class="tiep">
				<br>
				<h2>DANH MỤC SẢN PHẨM</h2>

				<ul class="item">
					<c:forEach items="${ pageData.content }" var="list">
						<li>
							<div class="pitem">
								<div class="top">
									<a href="" class="p-thumb"> <img
										src="/getimage/${list.hinhAnh }" alt="">
									</a> <a
										href="${pageContext.request.contextPath}/sanPham/sanPhamCT/+${list.id}"
										class="by-now">Mua Ngay</a>
								</div>
							</div>
							<div class="infor">
								<a href="" class="cat">${list.thuongHieu.ten }</a> <a href=""
									class="name">${list.sanPham.ten }</a>
							</div>
							<div class="tien">${list.giaBan }VND</div>
						</li>
					</c:forEach>


				</ul>
			
			</div>

		</div>

		<div class="abc">
			<div class="tin">
				<div class="vcc">
					<h2>CÁC SẢN PHẨM LIÊN QUAN</h2>
					<p class="bbb">Các xu hướng về thời trang</p>
				</div>
			</div>
			<div class="legt">
				<a href="">
					<div class="khung1">
						<img src="img/item5.jpg" alt="">
					</div>
					<div class="khung2">
						<a href=""><h5>Đồng hồ Cơ</h5>
							<p class="aaa">
								07/04/2020 <br> Dasy Bag Sonia by Sonia Rykiel
							</p> </a>
					</div>
				</a>
			</div>
			<div class="rihht">
				<a href="">
					<div class="khung3">
						<img src="img/item16.jpg" alt="">
					</div>
					<div class="khung4">
						<a href="">
							<h5>Đồng hồ điện tử</h5>
							<p class="ccc">
								07/04/2020 <br> Dasy Bag Sonia by Sonia Rykiel <br>
							</p>
						</a>
					</div>
				</a>
			</div>

		</div>
		<div class="icon">
			<div class="iconto">
				<div class="icon1">
					<img src="img/icon1.svg" alt="" class="xx">
				</div>
				<div class="qwe">
					<h5 class="o">GIAO HÀNG MIỄN PHÍ & TRẢ LẠI</h5>
					<p class="p">Miễn phí vận chuyển</p>
				</div>
			</div>
			<div class="icon2">
				<div class="icon1">
					<img src="img/icon2.svg" alt="" class="bbbb">
				</div>
				<div class="qwe">
					<h5 class="o">ĐẢM BẢO LẠI TIỀN</h5>
					<p class="p">Đảm bảo hoàn tiền trong 30 ngày</p>
				</div>
			</div>
			<div class="icon3">
				<div class="icon1">
					<img src="img/icon3.svg" alt="" class="ggg">
				</div>
				<div class="qwe">
					<h5 class="o">THANH TOÁN AN TOÀN</h5>
					<p class="p">Tất cả các khoản thanh toán được bảo đảm</p>
				</div>
			</div>
			<div class="icon4">
				<div class="icon1">
					<img src="img/icon4.svg" alt="" class="jj">
				</div>
				<div class="qwe">
					<h5 class="o">03-89-30-24-72</h5>
					<p class="p">Thời gian hàng giờ cho giao hàng.</p>
				</div>
			</div>
		</div>
		<div class="mg">
			<div class="r1">
				<h3 class="ty">VỀ CHÚNG TÔI</h3>
				<p class="it">Nam nec tellus a odio tincidunt auctor a ornare
					odio redmore</p>
				<h3 class="mn">THỜI GIAN MỞ CỬA</h3>
				<p class="it">
					Thứ Hai - Thứ Sáu .... 8,00 đến 18:00 <br> Thứ Bảy
					............ 9.00 đến 21.00 <br> Chủ nhật ............ 10:00
					đến 21:00
				</p>
			</div>
			<div class="r2">
				<h3 class="ty">MENU</h3>
				<a href="" class="qq">Trang chủ</a> <br> <a href="" class="qq">Cửa
					hàng</a> <br> <a href="" class="qq">Giỏ hàng</a> <br> <a
					href="" class="qq">Giớ thiệu</a> <br> <a href="" class="qq">Liên
					hệ</a>

			</div>
			<div class="r3">
				<h3 class="ty">DANH MỤC</h3>
				<a href="" class="qq">Áo </a> <br> <a href="" class="qq">Quần</a>
				<br> <a href="" class="qq">Giày</a> <br> <a href=""
					class="qq">Túi xách</a> <br> <a href="" class="qq">Trang
					Sức</a>
			</div>
			<div class="r4">
				<h3 class="ty">CHÍNH SÁCH</h3>
				<p class="it">Chính sách ưu đãi</p>
				<p class="it">Chính sách bảo mật</p>
				<p class="it">Chính sách giao nhận</p>
				<p class="it">Chính sách đổi trả</p>




			</div>
			<div class="r5">
				<h3 class="ty">ĐĂNG KÝ</h3>
				<p class="it">Đăng ký để nhận được được thông tin mới nhất từ
					chúng tôi.</p>
				<div class="v">
					<a href="">Đăng kí</a>

				</div>
			</div>
		</div>
		<div class="endd">
			<p class="fg">Nguyễn Quang Vinh-PH20805</p>
		</div>

	</div>
</body>
</html>