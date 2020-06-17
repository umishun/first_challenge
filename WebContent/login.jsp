<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Login</title>
</head>
<body>

<div class="form-item">

	<div class="message">${message}</div>
		<form action="LoginServlet" method="post">


	<div class="form-item">
		<label for="username"></label>
			<p>ユーザー名</p>
				<input type="text" name="name"></input>
		</div>
				
		<div class="form-item">
        <label for="password"></label>
			<p>パスワード</p>
				<input type="password" name="pass"></input>
   		</div>
		
		<div class="button-panel">
		<button>Login</button>
		
    </div>

	</form>
</div>	
</body>
</html>