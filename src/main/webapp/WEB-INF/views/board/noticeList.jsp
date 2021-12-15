<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
	<jsp:include page="../home/menu.jsp"/>
	<div align="center">
		<div><h1>공지사항 목록</h1></div>
		<div>
			<form id="frm" action="">
				<select id="key" name="key">
					<option value="" selected="selected">전   체</option>
					<option value="id">아 이 디</option>
					<option value="title">제    목</option>
					<option value="subject">내    용</option>
					<option value="wdate">작성 일자</option>
				</select>&nbsp;
				<input type="text" id="val" name="val" placeholder="검색할 내용을 입력하세요.">
				<input type="button" value="검색" onclick="BoardSearch();">
			</form>
		</div>
		<div>
			<table border="1" id="tb">
				<thead>
					<tr>
						<th width="50">글 번 호</th>
						<th width="200">제   목</th>
						<th width="100">작 성 자</th>
						<th width="100">작성 일자</th>
						<th width="70">조 회 수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${boards}" var="board">
						<tr onclick="BoardRead(${board.no})">
							<td align="center">${board.no }</td>
							<td>${board.title }</td>
							<td align="center">${board.name }</td>
							<td align="center">${board.wdate }</td>
							<td align="center">${board.hit }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div><br>
		<div>
			<c:if test="${id != null }">
				<button type="button" onclick="location.href='boardForm.do'">글쓰기</button>
			</c:if>
		</div>
		<div>
			<form action="" id="readForm" method="post">
				<input type="hidden" id="no" name="no">
			</form>	
		</div>
	</div>
	<script type="text/javascript">
		function BoardRead(n) {
			readForm.no.value = n;
			readForm.action = "boardRead.do";
			readForm.submit();
		}
	</script>
	
</body>
</html>