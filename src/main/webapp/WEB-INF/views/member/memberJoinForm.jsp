<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
 	<jsp:include page="../home/menu.jsp"></jsp:include>
 	<div align="center">
	 	<div><h1>회원가입</h1></div>
	 	<div>
	 		<form action="memberJoin.do" id="frm" method="post" onsubmit="return formCheck()" enctype="multipart/form-data">
	 			<div>
	 				<table border="1">
	 					<tr>
	 						<th width="150">아 이 디*</th>
	 						<td width="450" colspan="3">
	 							<input type="email" id="id" name="id" placeholder="Your E-Mail..." required="required"> 
	 							&nbsp;&nbsp;
	 							<button type="button" id="idBtn" onclick="isIdCheck()" value="NoCheck">중복체크</button>
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
	 					<tr>
	 						<th width="150">사 진</th>
	 						<td width="450" colspan="3">
	 							<input type="file" id="file" name="file"> 
	 						</td>
	 					</tr>
	 				</table>
	 			</div><br>
	 			<div>
	 				<button type="submit">회원가입</button>&nbsp;&nbsp;&nbsp;
	 				<button type="reset">취 소</button>
	 			</div>
	 		</form>
	 	</div>
 	</div>
 	<script type="text/javascript">
 		function isIdCheck() {
 			var id = $("#id").val(); // 입력된 id 값을 가져온다.
 			if (id != '') { // 아이디가 비어 있으면 동작 하지 않도록 한다.
	 			$.ajax({
	 				url: "idCheck.do",
	 				type: "post",
	 				data: {"id": id}, // id변수에 입력된 id값을 넣는다.
	 				dataType: "text",
	 				success: function(result) {
	 					if (result == '1') {
	 						alert("사용 가능한 아이디입니다.");
	 						$("#idBtn").val("YesCheck");
		 					$("#idBtn").hide();
		 					$("#password").focus();
	 					} else {
	 						alert("이미 사용중인 아이디입니다.");
	 						$("#id").val('');
	 						$("#id").focus();
	 					}
	 				}
	 			})
 			}
		}
 		function formCheck() {
			if ($("#idBtn").val() != 'YesCheck') {
				alert("아이디 중복체크를 해주세요!");
				return false;
			}
			
			if ($("#password").val() != $("#password1").val()) {
				alert("비밀번호가 일치하지않습니다.");
				return false;
			}
			return true;
		}
 	</script>
</body>
</html>