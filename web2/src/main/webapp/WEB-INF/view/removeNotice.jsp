<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>removeNotice</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
	<div class="jumbotron">
		<h2>삭제하기</h2>
		<form method="post" action="${pageContext.request.contextPath}/removeNotice">
  			<table class="table table-hover">
				<tr>
					<td>글번호</td>
					<td>
					<input type="number" name="noticeNo" readonly="readonly" value="${notice.noticeNo}">				
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
					<input type="password" name="noticePw" value="" >								
					</td>
				</tr>
			</table>
				<button class="btn btn-warning" type="submit">삭제</button>
				<a class="btn btn-success" href="${pageContext.request.contextPath}/getNoticeBypage?noticeNo=${notice.noticeNo}">목록으로</a>			
		</form>
	</div>
	</div>
</body>
</html>