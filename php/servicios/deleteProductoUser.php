<?php
  //Elimina un producto de usuario -> publicaciones.htm
  include("../_conexion.php");

  $idProducto = $_POST['idProducto'];

  $sql = "DELETE FROM productos WHERE id = $idProducto";
  $resultado = mysqli_query($con, $sql);

  if(!$resultado){
    echo "400";
    exit;
  }

  $sql = "DELETE FROM imagenes WHERE id_producto = $idProducto";
  $result = mysqli_query($con, $sql);

  if(!$result){
    echo "400";
    exit;
  }

  echo "200";