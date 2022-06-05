<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifynNotice</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

</head>
<body>
<div class="comtainer">
	<h2>수정하기</h2>
	<form action="${pageContext.request.contextPath}/modifyNotice" method="post">
  		<table class="table table-striped">
			<tr>
			<td>글번호</td>
			<td><input type="number" name="noticeNo" value="${notice.noticeNo}" readonly="readonly"></td>
		</tr>		
		<tr>
			<td>글제목</td>
			<td><input type="text" name="noticeTitle" placeholder="${notice.noticeTitle}"></td>
		</tr>	
		<tr>
			<td>글내용</td>
			<td><textarea name="noticeContent" placeholder="${notice.noticeContent}" cols="40" rows="5"  value=""></textarea></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>
				<input type="password" name="noticePw" value="">
			</td>
		</tr>	
		</table>
			<button type="submit">수정</button>
	</form>
			<a href="${pageContext.request.contextPath}/getNoticeByPage?noticeNo=${notice.noticeNo}">목록으로</a>
	</div>
</body>
</html>