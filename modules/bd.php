<?php
$servername = 'localhost';
$database = 'i20store';
$username = 'root';
$password = '';
// Создаем соединение
$conn = new mysqli($servername, $username, $password, $database);
// Проверяем соединение
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>

