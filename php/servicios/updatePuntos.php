<?php
  include("../_conexion.php");

  $puntos = $_POST['puntos'];
  $idUsuario = $_POST['idUsuario'];

  $sql = "UPDATE `usuarios` SET puntos = $puntos WHERE id = $idUsuario";
  $resultado = mysqli_query($con, $sql);

  if(!$resultado){
    echo "400";
    exit;
  }

  echo "200";