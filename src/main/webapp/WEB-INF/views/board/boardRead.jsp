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
		<div><h1>게시글 상세</h1></div>
		<div>
			 <h1>${message}</h1>
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
					<tr onclick="BoardRead(${board.no})">
						<td align="center">${board.no }</td>
						<td>${board.title }</td>
						<td align="center">${board.name }</td>
						<td align="center">${board.wdate }</td>
						<td align="center">${board.hit }</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>