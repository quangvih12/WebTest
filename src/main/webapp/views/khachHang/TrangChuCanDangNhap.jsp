<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>tropical</title>
<meta http–equiv=“Content-Type” content=“text/html; charset=UTF-8”>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>tropical</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/csss.css">



</head>
<body onload=auto()>
	<div class="warper">
		<div class="topp">
			<div class="header">
				<nav class="ass">
					<a href="" class="logo"><img src="img/logo (1).png" alt="">
					</a>
					<ul class="main-menu">
						<li><a href="${ pageContext.request.contextPath }/home">
								Trang chủ</a></li>
						<li><a href="${ pageContext.request.contextPath }/sanPham">Sản
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
						<li><a href="${ pageContext.request.contextPath }/login">Đăng Nhập</a></li>
						<li><a href="${ pageContext.request.contextPath }/dangky">Đăng Ký</a></li>
					</ul>

				</nav>

			</div>
			<div class="banner">

				<img src="img/0.jpg" id="anh" alt=""> <br> <input
					type="button" value="<" onclick=" pre();" /> <input
					style="position: absolute; right: 1%" type="button" value=">"
					onclick="next();" />


			</div>
		</div>
		<div class="botttom">
			<div class="cach"></div>
			<div class="conter">
				<div class="conterleft">
					<div class="chu">
						<h2>
							Chúng tôi mang đến các giải pháp <br> dựa trên hiệu suất để
							đảm bảo thành <br> công cho thương mại điện tử.
						</h2>
					</div>
					<div class="anh">
						<img src="img/TNB-44407.jpg" alt="">
					</div>
				</div>
				<div class="conterright">
					<p>Kiểm soát chi phí</p>
					<p>Giám sát theo thời gian thực</p>
					<p>Nhắm mục tiêu đối tượng một cách thông minh</p>
					<p>Dịch vụ hỗ trợ khách hàng được đánh giá cao nhất</p>

					<div class="mua">
						<a href="${ pageContext.request.contextPath }/login">Mua
							Ngay</a>
					</div>
				</div>
			</div>
			<div class="avv">
				<h2>Tại sao chọn chúng tôi?</h2>
			</div>

			<div class="moi">
				<div class="moilef">
					<img src="img/camila-coelho-milan-ss20_gaai.jpg" alt="">
				</div>
				<div class="moiright">

					<p>TroPiCal là một công ty thời trang căn cứ đầy đủ dịch vụ.
						Các hệ thống được thành lập của chúng tôi cho phép chúng tôi cung
						cấp các giải pháp thời trang và hàng đầu trong ngành cho các khách
						hàng thương mại và dân cư. Được xây dựng dựa trên truyền thống
						chăm sóc gia đình, chúng tôi được thúc đẩy bởi niềm đam mê vượt
						quá sự mong đợi của khách hàng và luôn mang đến sự hài lòng cho
						khách hàng.</p>
					<h4>Chúng tôi là từ năm 1987!</h4>
					<p>
						TroPiCal luôn tập trung vào một điều: sự hài lòng của khách hàng.
						<br> Chúng tôi cung cấp sự hài lòng đó thông qua phạm vi toàn
						diện của chúng tôi về dịch vụ chăm sóc và chuyên gia, bao gồm cả
						chăm sóc thương mại và dân cư.
					</p>
				</div>
			</div>
			<br>
			<div class="tiep">
				<div class="t">
					<a href="${pageContext.request.contextPath}/sanPham">xem chi
						tiết danh mục</a>
				</div>
				<br>
				<h2>DANH MỤC SẢN PHẨM</h2>
				<ul class="item">
					<c:forEach items="${ data.content }" begin="1" end="9"
						var="list">
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
					<h2>TIN MỚI NHẤT</h2>
					<p class="bbb">Các sự kiện về thời trang trong tuần qua</p>
				</div>
				<div class="legt">
					<a href="">
						<div class="khung1">
							<img src="img/6_980x.jpg" alt="">
						</div>
						<div class="khung2">
							<a href=""><h5>Hãy làm cô dâu lộng lẫy và xinh đẹp nhất
									trong ngày trọng đại đời mình với kiểu tóc “siêu hot” này</h5>
								<p class="aaa">
									07/04/2020 <br> Các cô dâu thường lo lắng rất nhiều cho
									ngày trọng đại của cuộc đời [...]
								</p> </a>


						</div>
					</a>
				</div>
				<div class="rihht">
					<a href="">
						<div class="khung3">
							<img src="img/1_980x.jpg" alt="">
						</div>
						<div class="khung4">
							<a href="">
								<h5>Giải mã 5 cách phối đồ đi du lịch chuẩn “nam thần” cho
									các chàng</h5>
								<p class="ccc">
									07/04/2020 <br> huyến du lịch của bạn sẽ càng trở nên hoàn
									hảo hơn nhờ những cách [...]
								</p>
							</a>
						</div>
					</a>
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
	<script>
        var img = [];
var index = 0;
	
        for (var i = 0; i < 4; i++) {
            img[i] = new Image();
            img[i].src = "img/" + i + ".jpg";
        }

       
        //Nút next
        function next() {
            index++;
            if (index >= img.length)
                index = 0;
            var anh = document.getElementById("anh");
            anh.src = img[index].src;

	    	
        }
        //Nút pre
        function pre() {
            index--;
            if (index < 0)
                index = img.length - 1;
            var anh = document.getElementById("anh");
            anh.src = img[index].src;

	    	
        }
//auto
        function auto() {
            setInterval("next()", 6000);
        }
        
    </script>
</body>
</html>