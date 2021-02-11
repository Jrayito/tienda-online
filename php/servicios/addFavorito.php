<?php
  include("../_conexion.php");

  $url = $_POST['url'];
  $nombre = $_POST['nombre'];
  $precio = $_POST['precio'];
  $idUsuario = $_POST['idUsuario'];
  $idProducto = $_POST['idProducto'];

  $sql = "INSERT INTO `favoritos`(url, nombre, precio, idUsuario, idProducto) 
    VALUES ('$url', '$nombre', $precio, $idUsuario, $idProducto)";
  $resultado = mysqli_query($con, $sql);

  if(!$resultado){
    echo "400";
    exit;
  }

  echo "200";