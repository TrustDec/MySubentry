<?php
	if (!empty($_POST)) {
		echo "post<br>    ";
		print_r($_POST);
	}
	if (!empty($_GET)) {
		echo "<br>GET   ";
		print_r($_GET);
	}
	if (!empty($_REQUEST)) {
		echo "<br>REQUEST   ";
		print_r($_REQUEST);
	}
?>