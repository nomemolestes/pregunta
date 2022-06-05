<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getNoticeOne</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container">
<div class="jumbotron">
	<h2>공지사항 상세보기</h2>
  	<table class="table table-dark">
		<tr>
			<td>글번호</td>
			<td>${notice.noticeNo}</td>
		</tr>
		<tr>
			<td>글제목</td>
			<td>
				<a href="${pageContext.request.contextPath}/removeNotice?noticeNo=${notice.noticeNo}">${notice.noticeTitle}</a>
			</td>
		</tr>	
		<tr>
			<td>글내용</td>
			<td>${notice.noticeContent}</td>
		</tr>
		<tr>
			<td>작성일</td>
			<td>${notice.createDate}</td>
		</tr>
	</table>
		<a class="btn btn-dark" href="${pageContext.request.contextPath}/modifyNotice?noticeNo=${notice.noticeNo}">수정</a>
		<a class="btn btn-secondary" href="${pageContext.request.contextPath}/getNoticeByPage?noticeNo=${notice.noticeNo}">목록으로</a>
		</div>
		</div>
</body>
</html>