<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<title>tropical</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/chitietsanpham.css">

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
						<li><a href="${ pageContext.request.contextPath }/hoaDon">hóa
								đơn</a></li>
					</ul>

				</nav>

			</div>
		</div>

		<div class="conter">
			<div class="trai1">
				<img src="/getimage/${list.hinhAnh }" alt="" class="nt">

			</div>

			<div class="phaiphai">
				<form onsubmit="return kt()"
					action="${ pageContext.request.contextPath }/gioHang/add"
					method="POST">
					<h1 class="toto">${ list.sanPham.ten }</h1>
					<br> <label class="col-4">ID SP:</label> <input
						name="chiTietSP" value="${ list.id} " class="form-control"
						autocomplete="off" readonly="true" style="width: 25px" /> <br>
					<br>
					<p class="q1">
						số lượng: <span>${ list.soLuongTon}</span> tồn
					</p>
					<p class="q">(0 đánh giá)</p>
					<h2 class="w1">${ list.giaBan}đ</h2>
					<h2 class="a1">Màu sắc: ${ list.mauSac.ten }</h2>
					<h5 class="a1">Thương hiệu: ${ list.thuongHieu.ten }</h5>

					<div class="mua">


						<label for="email">số lượng:</label> <input name="soLuong"
							id="soLuong" value="${param.soLuong }" class="search"> <br>
						<br>
						<button class="trtrt">
							<h2 class="y1">Thêm giỏ hàng</h2>
						</button>


						<div class="bc">
							<a
								href="${ pageContext.request.contextPath }/hoaDon/formThanhToan/+${list.id}">
								<h2 class="y2">Mua ngay</h2>
							</a>
						</div>

					</div>
				</form>

				<p class="va">
					GIỚI THIỆU <br>
				</p>
				<p class="qqq">${ list.moTa }</p>
			</div>
		</div>

		<div class="danhgia">
			<p class="zxc">KHÁCH HÀNG ĐÁNH GIÁ</p>
			<img src="img/itom1.png" alt="" class="tom">
			<p class="chua">Sản phẩm chưa có đánh giá. Hãy là người đầu tiên
				đánh giá sản phẩm này !</p>
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
	<script>
		function kt() {

			var sL = document.getElementById("soLuong");
			let x = document.getElementById("soLuong").value;

			//Kiểm tra Sl
			if (sL.value.length == 0) {
				sL.style.border = "1px solid red";

				return false;
			} else {
				sL.style.border = "none";
				sL.style.background = "white";
			}
			if (x == 0) {
				sL.style.border = "1px solid red";
				alert('Số lượng không được là 0')

				return false;
			} else {
				sL.style.border = "none";
				sL.style.background = "white";
			}

			//Thông báo thành công
			if (sL.value.length != 0)

				alert("Thêm vào giỏ hàng thành công");
		}
	</script>
</body>
</html>