<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
</head>
<body>
	<form action="" method="get">
		<input type="text" name="data1" ><br>
		<input type="text" name="data2" ><br>
		<input type="submit" value="提交">
	</form>
	<?php
		if (!empty($_POST)) {
			echo "<p>post数据</p>";
			print_r($_POST);
		}
		if (!empty($_GET)) {
			echo "<p>GET数据</p>";
			print_r($_GET);
		}
		if (!empty($_REQUEST)) {
			echo "<p>REQUEST数据</p>";
			print_r($_REQUEST);
		}

	?>
</body>
</html>