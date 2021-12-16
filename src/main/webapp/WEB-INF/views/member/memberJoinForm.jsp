<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
 	<jsp:include page="../home/menu.jsp"></jsp:include>
 	<div align="center">
	 	<div><h1>회원가입</h1></div>
	 	<div>
	 		<form action="memberJoin.do" id="frm" method="post">
	 			<div>
	 				<table border="1">
	 					<tr>
	 						<th width="150">아 이 디*</th>
	 						<td width="450" colspan="3">
	 							<input type="email" id="id" name="id" placeholder="Your E-Mail..." required="required"> 
	 							&nbsp;&nbsp;
	 							<button type="button" onclick="isIdCheck()" value="NoCheck">중복체크</button>
	 						</td>
	 					</tr>
	 					<tr>
		 					<th width="150">비 밀 번 호*</th>
	 						<td width="150">
	 							<input type="password" id="password" name="password" placeholder="Your password..." required="required"> 
	 						</td>
		 					<th width="150">비 밀 번 호 확 인*</th>
	 						<td width="150">
	 							<input type="password" id="password1" name="password1" placeholder="Your password Check..." required="required"> 
	 						</td>
	 					</tr>
	 					<tr>
		 					<th width="150">이 름*</th>
	 						<td width="150">
	 							<input type="text" id="name" name="name" placeholder="Your name..." required="required"> 
	 						</td>
		 					<th width="150">전 화 번 호</th>
	 						<td width="150">
	 							<input type="text" id="tel" name="tel" placeholder="Your tel..."> 
	 						</td>
	 					</tr>
	 					<tr>
	 						<th width="150">주 소</th>
	 						<td width="450" colspan="3">
	 							<input type="text" id="address" name="address" size="68" placeholder="Your address..."> 
	 						</td>
	 					</tr>
	 				</table>
	 			</div><br>
	 			<div>
	 				<button type="button" onclick="formCheck()">회원가입</button>&nbsp;&nbsp;&nbsp;
	 				<button type="reset">취 소</button>
	 			</div>
	 		</form>
	 	</div>
 	</div>
 	
</body>
</html>