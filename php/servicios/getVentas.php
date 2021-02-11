<?php
  include("../_conexion.php");
  $response = new stdClass();
  $datos = [];

  $id = $_POST['id'];

  $sql = "SELECT * FROM compras WHERE idVendedor = $id";
  $resultado = mysqli_query($con, $sql);

  if(!$resultado){
    echo "400";
    exit;
  }

  $i = 0;
  while($row = mysqli_fetch_array($resultado)){
    $obj = new stdClass();
    $obj->id = $row['id'];
    $obj->idOrden = $row['idOrden'];
    $obj->url = $row['url'];
    $obj->titulo = $row['titulo'];
    $obj->cantidad = $row['cantidad'];
    $obj->estado = $row['estado'];
    $datos[$i] = $obj;
    $i++;
  }

  $response -> data = $datos;
  mysqli_close($con);
  echo json_encode($response);