<?php
$dsn='mysql:host=localhost;dbname=i20Store';
$username = 'root';
$password = '';
// Создаем соединение
try {
$conn = new PDO(
    $dsn, 
	$username, 
	$password
);
}catch (PDOException $e) {
	die($e->getMessage());
}
?>

