<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/css/bootstrap.min.css"></link>
</head>
<body>

	<div class="col-10 offset-1 mt-5 border border-primary p-2">
		<h1>Đăng nhập</h1>
		<c:if test="${ not empty sessionScope.error }">
			<div class="alert alert-danger">${ sessionScope.error }</div>
			<c:remove var="error" scope="session" />
		</c:if>

		<div class="col-10 offset-1 mt-5">
			<form method="POST"
				action="${ pageContext.request.contextPath }/login">
				<div class="mt-4">
					<label for="email">Email</label> <input type="email" name="email"
						id="email" class="form-control" />
				</div>
				<div class="mt-4">
					<label for="password">Password</label> <input type="password"
						name="password" id="password" class="form-control" />
				</div>
				<div class="mt-4">
					<button class="btn btn-primary mt-4">Login</button>
					<a href="${ pageContext.request.contextPath }/dangky"
						class="btn btn-danger mt-4"> đăng ký </a>
				</div>

			</form>
		</div>
	</div>

</body>
</html>