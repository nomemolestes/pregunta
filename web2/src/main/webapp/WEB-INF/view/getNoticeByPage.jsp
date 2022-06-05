<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getNoticeBypage</title>
</head>
<body>
<div class="container">
<div class="jombotron">
	<h2>공지사항 목록</h2>
	<table>
	<c:forEach var="n" items="${list}">
		<thead>
			<tr>
				<th>글번호</th>
				<th>글제목</th>
				<th>글내용</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${n.noticeNo}</td>
				<td>
				<a href="${pageContext.request.contextPath}/getNoticeOne?noticeNo=${n.noticeNo}">${n.noticeTitle}</a>
				</td>
				<td>${n.noticeContent}</td>
				<td>${n.createDate}</td>
			</tr>
		</tbody>
		</c:forEach>
	</table>
	<ul class="pager">
	<c:if test="${current>1}">
		<li class="previous"><a href="${pageContext.request.contextPath}/getNoticeBypage?currentPage=${currentPage-1}">이전</a></li>
	</c:if>
	<c:if test="${currentPage<lastPage}">
		<li class="next"><a href="${pageContext.request.contextPath}/getNoticeBypage?currentPage=${currentPage+1}">다음</a></li>
	</c:if>
	</ul>
	<a href="${pageContext.request.contextPath}/addNotice">수정</a>
	</div>
	</div>
</body>
</html>