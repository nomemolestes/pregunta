<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getNoticeBypage</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
 </head>
<body>
<div class="container">
	<h2>공지사항 목록</h2>
 	 <table class="table table-dark">
		<thead>
			<tr>
				<th>글번호</th>
				<th>글제목</th>
				<th>글내용</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="n" items="${list}">
			<tr>
				<td>${n.noticeNo}</td>
				<td>
				<a href="${pageContext.request.contextPath}/getNoticeOne?noticeNo=${n.noticeNo}">${n.noticeTitle}</a>
				</td>
				<td>${n.noticeContent}</td>
				<td>${n.createDate}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div>
		<c:if test="${currentPage>1}">
		<a href="${pageContext.request.contextPath}/getNoticeByPage?currentPage=${currentPage-1}">이전</a>
	</c:if>
		<c:if test="${currentPage < lastPage}">
		<a href="${pageContext.request.contextPath}/getNoticeByPage?currentPage=${currentPage+1}">다음</a>
	</c:if>
	</div>
	<a href="${pageContext.request.contextPath}/addNotice">공지사항 추가</a>
	</div>
</body>
</html>