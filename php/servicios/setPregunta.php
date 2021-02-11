<?php
  include("../_conexion.php");

  $idProducto = $_POST['producto'];
  $idComprador = $_POST['comprador'];
  $idVendedor = $_POST['vendedor'];
  $pregunta = $_POST['pregunta'];
  $nombre = $_POST['nombre'];

  $sql = "INSERT INTO preguntas (idProducto, idComprador, idVendedor, nombre, pregunta) 
    VALUES ($idProducto, $idComprador, $idVendedor, '$nombre', '$pregunta')";
  $resultado = mysqli_query($con, $sql);

  if(!$resultado){
    echo "400";
    exit;
  }

  echo "200";