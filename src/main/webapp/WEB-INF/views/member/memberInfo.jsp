<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../home/menu.jsp"></jsp:include>
	<div align="center">
		<div><h1>회원정보</h1></div>
		<div>
			<img alt="aaaa" src="./resources/fileUpload/${member.pimgFile }"><br>
			${member.id }<br>
			${member.imgFile }<br>
			${member.pimgFile }<br>
		</div>
	</div>
</body>
</html>