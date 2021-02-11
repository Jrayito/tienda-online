<?php
  //Validamos el usuario -> inicio de sesión
  include ("../_conexion.php");
  $response = new stdClass();
  $datos = [];

  $email = $_POST['email'];
  $pass = $_POST['password'];

  $sql = "SELECT * FROM usuarios WHERE email = '$email' AND password = '$pass'";
  $resultado = mysqli_query($con, $sql);
  if(!$resultado){
    echo "400";
    exit;
  }
  $row = mysqli_fetch_row($resultado);
  $obj = new stdClass();

  if(isset($row[0])){
    
      $obj->id = $row[0];
      $obj->nombre = $row[1];
      $obj->apellidos = $row[2];
      $obj->email = $row[3];
      $obj->password = $row[4];
      $obj->cp = $row[5];
      $obj->estado = $row[6];
      $obj->ciudad = $row[7];
      $obj->municipio = $row[8];
      $obj->colonia = $row[9];
      $obj->calle = $row[10];
      $obj->puntos = $row[11];
    
  }else{
    $obj->id = 1000;
  }
  
  $datos[0] = $obj;

  $response -> informacion = $datos;
  mysqli_close($con);
  echo json_encode($response);