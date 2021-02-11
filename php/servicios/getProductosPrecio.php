<?php
  //Obetenemos los productos precio minimo y maximo
  include("../_conexion.php");
  $response = new stdClass();
  $datos = [];

  $categoria = $_POST['categoria'];
  $idUsuario = $_POST['idUsuario'];
  $min = $_POST['min'];
  $max = $_POST['max'];

  $sql = "SELECT p.id, p.nombre, p.precio, p.por_oferta, p.categoria, i.url FROM productos p, imagenes i WHERE i.tipo = 0 AND p.id = i.id_producto AND p.id_user != $idUsuario AND p.categoria = '$categoria' AND p.precio > $min AND p.precio < $max";
  $resultado = mysqli_query($con, $sql);

  if(!$resultado){
    echo "400";
    exit;
  }
  $i = 0;
  while($row = mysqli_fetch_array($resultado)){
    $obj = new stdClass();  
    $obj->id = $row['id'];
    $obj->url = $row['url'];
    $obj->nombre = $row['nombre'];
    $obj->precio = $row['precio'];
    $obj->descuento = $row['por_oferta'];
    $obj->categoria = $row['categoria'];
    $datos[$i] = $obj;
    $i++;
  }

  $response -> data = $datos;
  mysqli_close($con);
  echo json_encode($response);











  