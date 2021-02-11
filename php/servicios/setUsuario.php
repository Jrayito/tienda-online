<?php
  include ("../_conexion.php");
  
  $nombre = $_POST['nombre'];
  $apellido = $_POST['apellido'];
  $correo = $_POST['correo'];
  $cp = $_POST['cp'];
  $estado = $_POST['estado'];
  $ciudad = $_POST['ciudad'];
  $municipio = $_POST['municipio'];
  $colonia = $_POST['colonia'];
  $calle = $_POST['calle'];
  $password = $_POST['password'];

  $sql = "INSERT INTO usuarios (nombre, apellidos, email, password, cp, estado, ciudad, municipio, colonia, calle) 
    VALUES ('$nombre',  '$apellido', '$correo', '$password', '$cp', '$estado', '$ciudad', '$municipio', '$colonia', '$calle')";
  $resultado = mysqli_query($con, $sql);

  if(!$resultado){
    echo "400";
    exit;
  }

  echo "200";