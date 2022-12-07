<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<title>Insert title here</title>
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
					<li><a href="http://127.0.0.1:5500/assignment/trangchu.html">
							Trang chủ</a></li>
					<li><a href="http://127.0.0.1:5500/assignment/sanpham.html">Sản
							Phẩm</a>
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
					<li><a href="http://127.0.0.1:5500/assignment/tintuc.html">Tin
							tức</a></li>
					<li><a href="">Liên hệ</a>
						<ul class="sup">
							<li><a href="">Hot Line: 0389302472</a></li>
							<li><a href="">Địa chỉ</a></li>

						</ul></li>
				</ul>

			</nav>

		</div>


	</div>
	<h1 class="cv">ĐĂNG KÝ THÀNH VIÊN</h1>
	<div class="mt-5 col-10 offset-1">
		<form:form onsubmit="return kt()" modelAttribute="user" method="post"
			action="${ pageContext.request.contextPath }/dangky/store">

			<input type="hidden" name="_method" value="put" />
			<form:errors path="*" element="div" delimiter="<br>" />

			<div class="form-group ">
				<label for="ma">ten tài khoản</label>
				<form:input path="ma" class="form-control" autocomplete="off" />
				<form:errors path="ma" element="span" cssClass="text-danger" />

			</div>


			<div class="form-group">
				<label for="ten">Họ và tên: </label>
				<form:input path="ten" class="form-control" autocomplete="off" />

			</div>
			<div class="form-group">
				<label for="email">Email: </label>
				<form:input path="email" class="form-control" id="email"
					name="email" autocomplete="off" />

			</div>
			<div class="form-group">
				<label for="gender">Giới tính: </label>
				<div class="lab" id="gt">
					<label for=""><input type="radio" name="gender">Nam</label>
					<label for=""><input type="radio" name="gender">Nữ</label>
				</div>

			</div>
			<div class="form-group">
				<label for="matKhau">password: </label>
				<form:password path="matKhau" value="*********" name="password"
					class="form-control" />

			</div>
			<div class="form-group">
				<label for="quocGia">Quốc tịch</label> <select name="quocGia"
					id="quocGia" required>
					<option value="null">Chọn quốc tịch</option>
					<option value="Việt Nam">Việt Nam</option>
					<option value="Japan">Japan</option>
					<option value="German">German</option>
					<option value="Korea">Korea</option>
					<option value="Thái Lan">Thái Lan</option>
				</select>
			</div>

			<div class="form-group">
				<button class="btn btn-primary mt-4">Submit</button>
				<a href="${ pageContext.request.contextPath} /login"
					class="btn btn-danger mt-4"> đăng nhập </a>
			</div>
		</form:form>
	</div>
	<script>
		function kt() {
			var student = document.getElementById("ma");
			var name = document.getElementById("ten");
			var pass = document.getElementById("matKhau");
			var email = document.getElementById("email");
			var gt = document.getElementById("gt");
			var st = document.getElementById("st");
			var national = document.getElementById("quocGia");

			//Kiểm tra mã sinh viên
			if (student.value.length == 0) {
				student.style.border = "1px solid red";
				student.style.background = "yellow";
				return false;
			} else {
				student.style.border = "none";
				student.style.background = "white";
			}
			//Kiểm tra họ tên
			if (name.value.length == 0) {
				name.style.border = "1px solid red";
				name.style.background = "yellow";
				return false;
			} else {
				name.style.border = "none";
				name.style.background = "white";
			}
			//Kiểm tra pass
			if (name.value.length == 0) {
				pass.style.border = "1px solid red";
				pass.style.background = "yellow";
				return false;
			} else {
				name.style.border = "none";
				name.style.background = "white";
			}
			//Kiểm tra email
			if (email.value.length == 0) {
				email.style.border = "1px solid red";
				email.style.background = "yellow";
				return false;
			} else {
				email.style.border = "none";
				email.style.background = "white";
			}
			//Kiểm tra giới tính
			if (gender[0].checked !== true & gender[1].checked !== true) {
				gt.style.background = "yellow";
				return false;
			} else {
				gt.style.border = "none";
				st.style.background = "while";
			}

			//Kiểm tra quốc tịch
			if (national.value == 0) {
				national.style.border = "1px solid red";
				national.style.background = "yellow";
				return false;
			} else {
				national.style.border = "none";
				national.style.background = "white";
			}

			//Thông báo thành công
			if (email.value.length != 0 && (gender[0].checked == true)
					&& pass.value.length != 0)
				alert("Đăng ký thành công");
		}
	</script>
</body>
</html>