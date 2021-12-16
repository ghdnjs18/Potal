<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			<table border="1" id="tb">
				<tdead>
					<tr>
						<td width="70" align="center">글 번 호</td>
						<td width="70" align="center">${board.no }</td>
						<td width="100" align="center">작 성 일 자</td>
						<td width="100" align="center">${board.wdate }</td>
						<td width="70" align="center">조 회 수</td>
						<td width="70" align="center">${board.hit }</td>
					</tr>
				</tdead>
				<tbody>
					<tr>
						<td width="70" align="center">제   목</td>
						<td align="center" colspan="3">${board.title }</td>
						<td width="70" align="center">작 성 자</td>
						<td width="200" align="center">${board.name }</td>
					</tr>
					<tr>
						<td width="70" align="center">내   용</td>
						<td height="500" align="center" colspan="5">${board.subject }</td>
					</tr>
						
				</tbody>
			</table>
		</div>
		<div>
			<button type="button" onclick="location.href='noticeList.do'">목록으로 가기</button>&nbsp;&nbsp;
			<c:if test="${id eq board.writer }">
				<button type="button" onclick="location.href=''">수정하기</button>&nbsp;&nbsp;
				<button type="button" onclick="location.href=''">삭제하기</button>
			</c:if>
			<c:if test="${author eq 'ADMIN' }">
				<button type="button" onclick="location.href=''">삭제하기</button>
			</c:if>
		</div>
		<c:if test="${message != null }">
			<div><h1>${message }</h1></div>
			<button type="button" onclick="location.href='noticeList.do'">목록가기</button>
		</c:if>
	</div>
</body>
</html>