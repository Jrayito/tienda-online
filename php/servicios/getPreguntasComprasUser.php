<?php
  include("../_conexion.php");

  $response = new stdClass();
  $datos = [];

  $id = $_POST['usuario'];

  $sql = "SELECT * FROM preguntas WHERE idComprador = $id ORDER BY id DESC";
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
    $obj->pregunta = $row['pregunta'];
    $obj->repuesta = $row['respuesta'];
    $obj->nombre = $row['nombre'];
    $datos[$i] = $obj;
    $i++;
  }

  $response -> data = $datos;
  mysqli_close($con);
  echo json_encode($response);