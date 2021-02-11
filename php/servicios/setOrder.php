<?php
  include("../_conexion.php");

  $idOrden =  $_POST['orden'];
  $fecha = $_POST['fecha'];
  $usuario = $_POST['usuario'];
  $correo = $_POST['correo'];
  $direccion = $_POST['direccion'];
  $pago = $_POST['pago'];
  $subtotal = $_POST['subtotal'];
  $descuento = $_POST['descuento'];
  $total = $_POST['total'];

  $sql = "INSERT INTO ordenes (idOrden, fecha, usuario, email, direccion, pago, subtotal, descuento, total) 
    VALUES ('$idOrden', '$fecha', '$usuario', '$correo', '$direccion', '$pago', $subtotal, $descuento, $total)";
  $resultado = mysqli_query($con, $sql);

  if(!$resultado){
    echo "400";
    exit;
  }

  $sql = "SELECT id FROM ordenes WHERE idOrden = '$idOrden'";
  $resultado = mysqli_query($con, $sql);
  $row = mysqli_fetch_row($resultado);
  echo $row[0];