<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

		<c:forEach var="item" items="${list}">
		
			${item.month}
			${item.money}
			${item.kubun}
			${item.buy}
			
		<c:if test="${item.kubun == 0}">
			<p>出費</p>
		</c:if>	
		<c:if test="${item.kubun == 1}">
			<p>収入</p>
		</c:if>	
		
		</c:forEach>
		<form action="Main" method="post">
			<table border="1">
			<tr>
				<th>商品</th><td><input type="text" name="product"></td>
			</tr>
			<tr>
				<th>値段</th><td><input type="text" name="price"></td>
			</tr>
			<tr>
				<th></th><td><input type="radio" name="shupi">収入<input type="radio" name="shupi">支出</td>
			</tr>
		</table>
		<button class="yes" name="btn" value="yes">登録</button>
		
		<c:if test="${message != null }">
			<p>${message}</p>
		</c:if>
	</form>


	
</body>
</html>