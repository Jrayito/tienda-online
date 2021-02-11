<?php
  include("../_conexion.php");

  $response = new stdClass();
  $datos = [];

  $idProducto = $_POST['producto'];

  $sql = "SELECT * FROM preguntas WHERE idProducto = $idProducto ORDER BY id DESC";
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
    $obj->comprador = $row['idComprador'];
    $obj->pregunta = $row['pregunta'];
    $obj->repuesta = $row['respuesta'];
    $datos[$i] = $obj;
    $i++;
  }

  $response -> data = $datos;
  mysqli_close($con);
  echo json_encode($response);