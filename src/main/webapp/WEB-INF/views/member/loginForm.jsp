<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../home/menu.jsp"/>
	<div align="center">
		<div><h1>로 그 인</h1></div>
		<div>
			<form action="memberLogin.do" id="frm" method="post">
				<div>
					<table border="1">
						<tr>
							<th width="100">아이디</th>
							<td width="200">
								<input type="email" id="id" name="id" placeholder="email을 입력하세요.." required="required">
							</td>
						</tr>
						<tr>
							<th width="100">패스워드</th>
							<td width="200">
								<input type="password" id="password" name="password" placeholder="password을 입력하세요.." required="required">
							</td>
						</tr>
					</table>
				</div>
				<div>
					<button type="submit">로그인</button>
					<button type="button">취소</button>
				</div> 
			</form>
		</div>
	</div>
</body>
</html>