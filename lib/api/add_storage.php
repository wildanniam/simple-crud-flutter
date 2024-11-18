<?php
include 'db.php';
$nama = $_POST['nama'];
$kategori = $_POST['kategori'];
$deskripsi = $_POST['deskripsi'];
$conn->query("INSERT INTO storage (nama, kategori, deskripsi) VALUES ('$nama', '$kategori', '$deskripsi')");
echo json_encode(["message" => "Data added successfully"]);
?>