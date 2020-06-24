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
			
		<c:if test="${item.kubun == false}">
			<p>出費</p>
		</c:if>	
		<c:if test="${item.kubun == true}">
			<p>収入</p>
		</c:if>
		<form action="Payment" method="post">	
			<button class="no" name="btn" value="no">削除</button>  
		<input type="hidden" name="id" value="${item.id}">
		</form>	
		</c:forEach>
		<form action="Payment" method="post">
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
		<input type="hidden" name="year" value="${year}">
		<input type="hidden" name="day" value="${day}">
		<input type="hidden" name="month" value="${month}">
	</form>


	
</body>
</html>