<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

<div class="login">
	<h2>収入登録</h2>
	<a href="http://localhost:8080/webExam2/ManageServlet">管理ページに戻る</a>
	<form action="InsertServlet" method="post">
		<table border="1">
			<tr>
				<th>値段</th><td><input type="text" name="price"></td>
			</tr>
			<tr>
				<th>説明</th><td><input type="text" name="explanation"></td>
			</tr>
			
			
		</table>
		<button class="yes" name="btn" value="yes">登録</button>
		
		<c:if test="${message != null }">
			<p>${message}</p>
		</c:if>
	</form>
</div>	
</body>
</html>