<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<link rel="stylesheet" type="text/css" href="payment.css">
<title>Insert title here</title>
</head>
<body>
	<div class="inner">

			${year}/${month}/${day}
			
		<c:forEach var="item" items="${list}">
			<c:if test="${item.kubun == false}">
				<p>出費</p>
			</c:if>	
			<c:if test="${item.kubun == true}">
				<p>収入</p>
			</c:if>
			
			<table>
				<tr>
					<td>${item.buy}</td>
					<td>
						<c:if test="${item.kubun == false}">
							<p>出費</p>
						</c:if>	
						<c:if test="${item.kubun == true}">
							<p>収入</p>
						</c:if>
					</td>
					<td>${item.money}</td>
				</tr>
			</table>
		
			<form action="Payment" class="delete-form" method="post">	
				<input type="submit" class="btn-box delete" name="btn" value="削除">  
				<input type="hidden" name="id" value="${item.id}">
				<input type="hidden" name="year" value="${year}">
				<input type="hidden" name="day" value="${day}">
				<input type="hidden" name="month" value="${month}">
			</form>	
		</c:forEach>
			
			<form action="Payment" method="post">
				<table class="post-form">
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
				<div class="container">
				<input type="submit" class="btn-box" name="btn" value="登録">
				
				</div>
				<input type="hidden" name="year" value="${year}">
				<input type="hidden" name="day" value="${day}">
				<input type="hidden" name="month" value="${month}">
			</form>
	
			
		<c:if test="${message != null }">
			<p>${message}</p>
		</c:if>
	


		<a href="calendar.jsp" >戻る</a>	
	</div>
</body>
</html>