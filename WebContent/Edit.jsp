<!DOCTYPE HTML>
<html xmlns:th="http://www.thymeleaf.org">
	<head>
		<title>edit page</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<style>
		table { border-collapse: collapse; }
		table th { padding: 10px; border: solid 1px black; }
		table td { padding: 3px 10px; border: solid 1px black; }
		</style>
	</head>
	<body>
		<h1>sample edit page</h1>
		<table>
			<form method="post" action="/edit" th:object="${editModel}">
				<input type="hidden" name="id" th:value="*{id}" />
				<tr>
					<td><label for="name">名前</label></td>
					<td><input type="text" name="name" th:value="*{name}" /></td>
				</tr>
				<tr>
					<td><label for="post">投稿内容</label></td>
					<td><input type="text" name="post" th:value="*{post}" /></td>
				</tr>
				<tr>
					<td><input type="submit" name="edit" value="編集"/></td>
				</tr>
				<tr>
					<td><input type="submit" name="delete" value="削除"/></td>
				</tr>
			</form>
		</table>
	</body>
</html>