<?php
  include("../_conexion.php");

  $id = $_POST['producto'];
  $respuesta = $_POST['respuesta'];

  $sql = "UPDATE preguntas SET respuesta = '$respuesta' WHERE id = $id";
  $resultado = mysqli_query($con, $sql);

  if(!$resultado){
    echo "400";
    exit;
  }

  echo "200";