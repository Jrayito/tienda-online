<?php
  //Extraemos informacion e imagenes para -> compra
  include("../_conexion.php");

  $response = new stdClass();
  $datos = [];
  
  $idProducto = $_POST['idProducto'];

  $sqlProducto = "SELECT * FROM productos WHERE id = $idProducto";
  $sqlImagen = "SELECT * FROM imagenes WHERE id_producto = $idProducto";
  $ResultadoProducto = mysqli_query($con, $sqlProducto);

  if(!$ResultadoProducto){
    echo "400";
    exit;
  }

  $row = mysqli_fetch_row($ResultadoProducto);
  if(isset($row[0])){
    $obj = new stdClass(); //Almacena toda la información de productos
    $objImagen = []; //Almacena solo las imagenes

    $ResultadoImagen = mysqli_query($con, $sqlImagen);
    $y = 0;
    while($rowImagen = mysqli_fetch_array($ResultadoImagen)){
      $imagen = new stdClass();
      $imagen->tipo = $rowImagen['tipo'];
      $imagen->url = $rowImagen['url'];
      $objImagen[$y] = $imagen;
      $y++;
    }

    $obj->id = $row[0];
    $obj->idUser = $row[1];
    $obj->nombre = $row[2];
    $obj->resena = $row[3];
    $obj->cat = $row[4];
    $obj->subcat = $row[5];
    $obj->marca = $row[6];
    $obj->modelo = $row[7];
    $obj->color = $row[8];
    $obj->estado = $row[9];
    $obj->oferta = $row[10];
    $obj->precio = $row[11];
    $obj->descuento = $row[12];
    $obj->precioD = $row[13];
    $obj->stock = $row[14];
    $obj->desc = $row[15];
    $obj->imagen = $objImagen;

    $datos = $obj;
    $response-> data = $datos;
  }

  mysqli_close($con);
  echo json_encode($response);