<?php
  include("../_conexion.php");

  $calificacion = $_POST['calificacion'];
  $texto = $_POST['texto'];
  $producto = $_POST['producto'];
  $usuario = $_POST['usuario'];


  $sql = "INSERT INTO calificaciones(idProducto, texto, calificacion, usuario) 
    VALUES ($producto, '$texto', $calificacion, '$usuario')";
  $resultado = mysqli_query($con, $sql);

  if(!$resultado){
    echo "400";
    exit;
  }

  echo "200";