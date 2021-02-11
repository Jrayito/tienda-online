<?php
  include("../_conexion.php");

  $idOrden = $_POST['orden'];
  $idProducto = $_POST['idProducto'];
  $url = $_POST['url'];
  $titulo = $_POST['titulo'];
  $cantidad = $_POST['cantidad'];
  $idVendedor = $_POST['idVendedor'];

  $sql = "INSERT INTO compras (idOrden, url, titulo, cantidad, estado, idVendedor, idProducto) 
    VALUES ($idOrden, '$url', '$titulo', $cantidad,0, $idVendedor, $idProducto)";
  $resultado = mysqli_query($con, $sql);

  if(!$resultado){
    echo "400";
    exit;
  }

  echo "200";