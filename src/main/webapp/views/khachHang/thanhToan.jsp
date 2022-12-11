<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<title>Tropical</title>
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/css/dangKy.css"></link>
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/css/bootstrap.min.css"></link>
</head>
<body>
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
					<li><a href="${ pageContext.request.contextPath }/DangXuat">Đăng
							Xuất</a></li>

				</ul>

			</nav>

		</div>
	</div>

	<h1 class="cv">THANH TOÁN</h1>
	<div class="mt-5 col-10 offset-1">
		<form:form onsubmit="return kt()" modelAttribute="listHoaDonD"
			method="post"
			action="${ pageContext.request.contextPath }/hoaDon/saveThuong">

			<div class="trai1">
				<img src="/getimage/${list.hinhAnh }" alt="" class="nt"
					style="width: 400px; height: 250px; margin-left: 60px;">

			</div>

			<div class="phaiphai">

				<div class="row col-12">
					<label class="col-4">ID SP:</label>
					<form:input path="chiTietSP" value="${ list.id} "
						class="form-control" autocomplete="off" readonly="true"
						style="width: 35px" />
				</div>
				<div class="row col-12">
					<label class="col-4">Tên SP:</label> <label class="col-6">
						${ list.sanPham.ten }</label>
				</div>
				<div class="row col-12">
					<label class="col-4">Giá:</label> <label class="col-6"> ${ list.giaBan}đ</label>
				</div>
				<div class="row col-12">
					<label class="col-4">Màu sắc:</label> <label class="col-6">
						${ list.mauSac.ten }</label>
				</div>
				<div class="row col-12">
					<label class="col-4">Thương hiệu:</label> <label class="col-6">
						${ list.thuongHieu.ten }</label>
				</div>
				<div class="row col-12">
					<label for="email">Email</label> <input type="email" name="email"
						id="email" class="form-control" />
				</div>
				<div class="row col-12">
					<label class="col-4">Họ và tên:</label>
					<form:input path="hoaDon.tenNguoiNhan" class="form-control"
						autocomplete="off" />
				</div>
				<div class="row col-12">
					<label class="col-4">Số lượng:</label>
					<form:input path="soLuong" class="form-control" autocomplete="off" />
				</div>
				<div class="row col-12">
					<label class="col-4">Đơn giá:</label>
					<form:input path="dongia" class="form-control" autocomplete="off"
						value="${ list.giaBan} " readonly="true" />
				</div>
				<div class="row col-12">
					<label class="col-4">Địa Chỉ:</label>
					<form:input path="hoaDon.diaChi" class="form-control"
						autocomplete="off" />
				</div>
				<div class="row col-12">
					<label class="col-4">số điện thoại:</label>
					<form:input path="hoaDon.sdt" class="form-control"
						autocomplete="off" />
				</div>

			</div>




			<div class="form-group">
				<button class="btn btn-primary mt-4">thanh toán</button>
			</div>
		</form:form>
	</div>
	<script>
		function kt() {

			var sL = document.getElementById("soLuong");
			var email = document.getElementById("email");
			let x = document.getElementById("soLuong").value;

			//Kiểm tra Sl
			if (sL.value.length == 0) {
				sL.style.border = "1px solid red";
				sL.style.background = "red";
				return false;
			} else {
				sL.style.border = "none";
				sL.style.background = "white";
			}

			//Kiểm tra email
			if (email.value.length == 0) {
				email.style.border = "1px solid red";
				email.style.background = "red";
				return false;
			} else {
				email.style.border = "none";
				email.style.background = "white";
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
			if (email.value.length != 0
					&& (gender[0].checked == true && sL.value.length != 0)
					&& pass.value.length != 0)
				alert("Mua thành công");
		}
	</script>
</body>
</html>