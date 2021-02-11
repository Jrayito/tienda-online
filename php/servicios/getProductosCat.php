<?php
  //extrae los productos en -> productos por cat
  include("../_conexion.php");
  $response = new stdClass();
  $datos = [];

  $categoria = $_POST['categoria'];
  $idUsuario = $_POST['idUsuario'];

  $sql = "SELECT p.id, i.url, p.nombre, p.precio, p.por_oferta, p.categoria FROM productos p, imagenes i WHERE p.id = i.id_producto AND i.tipo = 0 AND p.id_user != $idUsuario AND p.subcategoria = '$categoria' OR p.categoria = '$categoria'";
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
  