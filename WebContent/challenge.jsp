<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
 

<html lang="ja">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<div class="boxA">
<div class="box1">
<div class="item">

</div>
<div class="item no-label">

<form action="/index.php" method="post">
<input type="text" name="data">
<div class="radio-group">
<label><input type="radio" name="source" value="a" checked="checked">支出</label>
<label><input type="radio" name="source" value="b">収入</label><br>
</div>

<input type="submit" value="送信">
</form>

</div>
</form>


</div>
<input type="button" onclick="location.href='./index.php'"value="再読み込み">
<div class="box2">

<table border="1" rules="all">
<tr><td>支出</td><td>収入</td></tr>

<?php foreach($csv as $row){ ?>
<tr>
<?php foreach($row as $cel){ ?>
<td>
<a href="./index.php?<?= "file" .$count; $count++;?>=<?= $i ?>"><?= $cel[0];?></a>
</td>
<?php } ?>
</tr>
<?php $i++; $count = 0; } ?>
<tr><td><?= $cost ?></td><td><?= $income ?></td></tr>
</table>
残高 : <?php echo ($income - $cost), "円"; ?>
</div>
</div>

</body>
</html>



