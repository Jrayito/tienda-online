<?php
  include("../_conexion.php");

  $response = new stdClass();
  $datos = [];

  $idUsuario = $_POST['idUsuario'];

  $sql = "SELECT * FROM favoritos WHERE idUsuario = $idUsuario";
  $resultado = mysqli_query($con, $sql);

  if(!$resultado){
    echo "400";
    exit;
  }

  $i = 0;
  while($row = mysqli_fetch_array($resultado)){
    $obj = new stdClass();
    $obj->id = $row['id'];
    $obj->url = $row['url'];
    $obj->nombre = $row['nombre'];
    $obj->precio = $row['precio'];
    $obj->producto = $row['idProducto'];
    $datos[$i] = $obj;
    $i++;
  }

  $response -> data = $datos;
  mysqli_close($con);
  echo json_encode($response);