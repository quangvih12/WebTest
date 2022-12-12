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
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>


function openModalRemoveSinhVien(Id) {  
    $("#exampleModal").modal('show');
    /*  fetch("${ pageContext.request.contextPath }/api/find" + "/" + Id)
   		.then(response => response.json())
   		.then(data => {
   			const renderHtml = data.map(item => {
   				console.log('item', item.diaChi)
   				return (`
   					<td>item.diaChi</td>
   				`)
   			})
   			console.log('renderHtml', renderHtml)
   			document.getElementById('dataHoaDon').innerHtml = renderHtml
   		})
   		
   		console.log('ggg', Id)*/
   		// document.getElementById('dataHoaDon')
     $.ajax({
        type: "GET",
        contentType: "application/json",
        url:"${ pageContext.request.contextPath }/api/find" + "/" + Id,
        data: JSON.stringify(Id),
        dataType: 'json',
        success:function (responseData) {
            console.log('responseData', responseData)
        
            $("#dataHoaDon").html(responseData.map(function (items) {
            	 $("#exampleModal #ma").val(items.hoaDon.ma);
            	 $("#exampleModal #ten").val(items.hoaDon.khachHang.ten);
            	 $("#exampleModal #status").val(items.hoaDon.trangThaiTT == 0?"chờ thanh toán":  items.hoaDon.trangThaiTT == -1?"đơn đã hủy":"đã thanh toán");
            	 $("#exampleModal #date").val(items.hoaDon.tgTao);
            	 $("#exampleModal #address").val(items.hoaDon.khachHang.diaChi);
                console.log('itemid', items.id)
            	return `
           
				<tr>
            	<td>	\${items.id}</td>
            	<td><img src="getimage/\${ items.chiTietSP.hinhAnh }" alt=""
					class="anh" style="width: 100px"></td>
				
				<td>\${ items.chiTietSP.sanPham.ten }</td>
				<td>\${ items.soLuong }</td>
				<td>\${ items.hoaDon.tgTao }</td>
				<td>\${ items.dongia }</td>
				</tr>
				
                `
            }))
	        
		//    hàm map sẽ return về 1 đoạn template string chứa cả 1 dòng trong table
		//    trong mảng có bao nhiêu phần tử sẽ lặp bấy nhiêu lần và hiển thị 
        	
        
           
        }
    
        
    });
}
</script>

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
						<li><a href="${ pageContext.request.contextPath }/DangXuat">Đăng
								Xuất</a></li>
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

						<td>Code</td>
						<td>UserName</td>

						<td>unit price</td>
						<td>status</td>
						<td>date created</td>
						<td>address</td>

						<td colspan="2">thao tác</td>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${ listHoaDon }" var="list" varStatus="i">
						<tr>
							<td>${ i.index +1 }</td>

							<td>${ list.ma}</td>
							<td>${ list.khachHang.ten }</td>

							<td>${ list.tongTien }</td>
							<td>${ list.trangThaiTT == 0?"chờ thanh toán":  list.trangThaiTT == -1?"đơn đã hủy":"đã thanh toán"}</td>
							<td>${ list.tgTao}</td>
							<td>${ list.diaChi }</td>


							<td><button type="button" class="btn btn-primary"
									data-bs-toggle="modal" data-bs-target="#exampleModal"
									data-bs-whatever="@mdo"
									onclick="openModalRemoveSinhVien(${list.id})">xem chi
									tiết</button></td>
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

		</div>
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content" style="width: 700px;">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">New message</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>

					<table id="custom-table"
						class="table table-bordered m-table d-sm-table m-table--head-bg-primary">
						<thead>
							<tr>
								<td>STT</td>
								<td>Hình ảnh</td>
								<td>Tên sản phẩm</td>
								<td>số lượng</td>
								<td>ngày tạo</td>
								<td>Giá bán</td>

							</tr>
						</thead>
						<tbody id="dataHoaDon">

						</tbody>

					</table>

					<div class="row col-12">
						<label class="col-4">Mã hóa đơn:</label> <input class="form-control"
							id="ma" autocomplete="off" readonly="true"
							style="width: 600px; margin-left: 40px;">
					</div>
					<div class="row col-12">
						<label class="col-4">tên khách hàng:</label> <input class="form-control"
							id="ten" autocomplete="off" readonly="true"style="width: 600px; margin-left: 40px;" />
					</div>
					<div class="row col-12">
						<label class="col-4">trạng thái:</label> <input class="form-control"
							id="status" autocomplete="off" readonly="true" style="width: 600px; margin-left: 40px;"/>
					</div>
					<div class="row col-12">
						<label class="col-4">ngày tạo:</label> <input class="form-control"
							id="date" autocomplete="off" readonly="true" style="width: 600px; margin-left: 40px;"/>
					</div>
					<div class="row col-12">
						<label class="col-4">địa chỉ:</label> <input class="form-control"
							id="address" autocomplete="off" readonly="true" style="width: 600px; margin-left: 40px;"/>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>

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