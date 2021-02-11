<?php
  include("../_conexion.php");
  $response = new stdClass();
  $datos = [];

  $email = $_POST['email'];

  $sql = "SELECT * FROM `ordenes` WHERE email = '$email'";
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
    $obj->fecha = $row['fecha'];
    $obj->usuario = $row['usuario'];
    $obj->email = $row['email'];
    $obj->direccion = $row['direccion'];
    $obj->pago = $row['pago'];
    $obj->subtotal = $row['subtotal'];
    $obj->descuento = $row['descuento'];
    $obj->total = $row['total'];
    $datos[$i] = $obj;
    $i++;
  }

  $response -> data = $datos;
  mysqli_close($con);
  echo json_encode($response);