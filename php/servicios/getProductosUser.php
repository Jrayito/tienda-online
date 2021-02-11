<?php
  //script extrae todos los productos de usuario -> publicaciones.htm
  include("../_conexion.php");
  $response = new stdClass();
  $datos = [];
  $idUsuario = $_POST['idUsuario'];

  $sql = "SELECT * FROM productos WHERE id_user = $idUsuario";
  $resultado = mysqli_query($con, $sql);

  if(!$resultado){
    echo "400";
  }
  $i = 0;
  while($row = mysqli_fetch_array($resultado)){
    $obj = new stdClass();
    $obj->id = $row['id'];
    $obj->nombre = $row['nombre'];
    $obj->resena = $row['resena'];
    $obj->cat = $row['categoria'];
    $obj->subcat = $row['subcategoria'];
    $obj->marca = $row['marca'];
    $obj->modelo = $row['modelo'];
    $obj->color = $row['color'];
    $obj->estado = $row['estado'];
    $obj->oferta = $row['oferta'];
    $obj->precio = $row['precio'];
    $obj->descuento = $row['por_oferta'];
    $obj->precio_descuento = $row['precio_oferta'];
    $obj->stock = $row['stock'];
    $obj->desc = $row['descripcion'];
    $datos[$i] = $obj;
    $i++;
  }

  $response -> data = $datos;
  mysqli_close($con);
  echo json_encode($response);