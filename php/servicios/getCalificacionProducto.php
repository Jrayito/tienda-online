<?php
  include("../_conexion.php");

  $response = new stdClass();
  $datos = [];

  $idProducto = $_POST['producto'];

  $sql = "SELECT * FROM `calificaciones` WHERE idProducto = $idProducto";
  $resultado = mysqli_query($con, $sql);

  if(!$resultado){
    echo "400";
    exit;
  }

  $i = 0;
  while($row = mysqli_fetch_array($resultado)){
    $obj = new stdClass();
    $obj->id = $row['id'];
    $obj->producto = $row['idProducto'];
    $obj->texto = $row['texto'];
    $obj->calificacion = $row['calificacion'];
    $obj->usuario = $row['usuario'];
    $datos[$i] = $obj;
    $i++;
  }

  $response -> data = $datos;
  mysqli_close($con);
  echo json_encode($response);