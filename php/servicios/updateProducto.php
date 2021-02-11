<?php
  include("../_conexion.php");

  $idProducto = $_POST['idProducto'];
  $nombre = $_POST['nombre'];
  $resena = $_POST['resena'];
  $cat = $_POST['categoria'];
  $subcat = $_POST['subcategoria'];
  $marca = $_POST['marca'];
  $modelo = $_POST['modelo'];
  $color = $_POST['color'];
  $estado = $_POST['estado'];
  $oferta = $_POST['oferta'];
  $precio = $_POST['precio'];
  $descuento = $_POST['descuento'];
  $precioD = $_POST['precioD'];
  $stock = $_POST['stock'];
  $descripcion = $_POST['descripcion'];

  $sql = "UPDATE productos SET nombre='$nombre',resena='$resena',categoria='$cat',subcategoria='$subcat',marca='$marca',modelo='$modelo',color='$color',estado='$estado',oferta=$oferta,precio=$precio,por_oferta= $descuento,precio_oferta=$precioD,stock=$stock,descripcion='$descripcion' WHERE id = $idProducto";

  $resultado = mysqli_query($con, $sql);
  if(!$resultado){
    echo "400";
    exit;
  }
  echo "200";
  