<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<title>tropical</title>
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/css/bootstrap.min.css"></link>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/sanpham.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
	integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js"
	integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk"
	crossorigin="anonymous"></script>


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



		<div class="mt-5 col-10 offset-1 border border-primary p-2">
			<h1 style="text-align: center">HÓA ĐƠN</h1>

			<table class="table table-strip table-dark mt-3">

				<thead>
					<tr>
						<td>STT</td>
						<td>Image</td>
						<td>Product's name</td>
						<td>UserName</td>
						<td>amount</td>
						<td>unit price</td>
						<td>status</td>
						<td>date created</td>
						<td>address</td>

						<td colspan="2"></td>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${ listHoaDon }" var="list" varStatus="i">
						<tr>
							<td>${ i.index +1 }</td>
							<td><img src="getimage/${ list.chiTietSP.hinhAnh }" alt=""
								class="anh" style="width: 100px"></td>
							<td>${ list.chiTietSP.sanPham.ten}</td>
							<td>${ list.hoaDon.tenNguoiNhan }</td>
							<td>${ list.soLuong }</td>
							<td>${ list.dongia }</td>
							<td>${ list.hoaDon.trangThaiTT == 0?"chờ thanh toán":  list.hoaDon.trangThaiTT == -1?"đơn đã hủy":"đã thanh toán"}</td>
							<td>${ list.hoaDon.tgTao}</td>
							<td>${ list.hoaDon.diaChi }</td>


							<td></td>
							<td>
								<form
									action="${ pageContext.request.contextPath }/hoaDon/update/+${list.id}"
									method="POST">
									<button class="btn btn-danger">Hủy hóa đơn</button>
								</form>
							</td>
						</tr>

					</c:forEach>

				</tbody>


			</table>
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">New message</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form:form modelAttribute="listHoaDonD"
								action="${ pageContext.request.contextPath }/hoaDon/save"
								method="POST">
								<div class="row col-12">
									<label class="col-4">ID SP:</label> <input type="text"
										id="soLuong" name="soLuong">
								</div>
								<div class="mb-3">
									<label for="message-text" class="col-form-label">Message:</label>
									<textarea class="form-control" id="message-text"></textarea>

								</div>
								<input type="hidden" id="id" name="id">
							</form:form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Send
								message</button>
						</div>
					</div>
				</div>
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