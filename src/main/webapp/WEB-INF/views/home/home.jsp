<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div align="center">
		<div><h1>Well Come to my Web-Site</h1></div>
		<button type="button" onclick="memberList()">멤버리스트 ajax 호출하기</button>
		<div id="memberList"></div>
	</div>
	<script type="text/javascript">
		function memberList() {
			$.ajax({
				url: "ajaxMemberList.do",
				dataType: "json",
				success: function(data) {
					var str = JSON.stringify(data);
					console.log(data);
					console.log(data[0].name);
					alert(str);
				}
			});
		}
	</script>
</body>
</html>