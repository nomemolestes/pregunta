<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addNotice</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

</head>
<body>
<div class="comtainer">
	<h2>입력하기</h2>
	<form action="${pageContext.request.contextPath}/addNotice" method="post">
  		<table class="table table-striped">		
		<tr>
			<td>글제목</td>
			<td><input type="text" name="noticeTitle"></td>
		</tr>	
		<tr>
			<td>글내용</td>
			<td><textarea name="noticeContent" cols="40" rows="5"></textarea></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>
				<input type="password" name="noticePw">
			</td>
		</tr>	
		</table>
			<button type="submit">입력</button>
	</form>
	</div>
</body>
</html>