<?php
  include("../_conexion.php");

  $id_user = $_POST['user'];
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

  $sql = "INSERT INTO productos(id_user, nombre, resena, categoria, subcategoria, marca, modelo, color, estado, oferta, precio, por_oferta, precio_oferta, stock, descripcion) 
    VALUES ('$id_user', '$nombre', '$resena','$cat','$subcat','$marca','$modelo','$color','$estado',$oferta,$precio,$descuento,$precioD, $stock, '$descripcion')";
  $resultado = mysqli_query($con, $sql);
  if(!$resultado){
    echo "400.1";
    exit;
  }

  $sql = "SELECT * FROM productos WHERE nombre = '$nombre'";
  $resultado = mysqli_query($con, $sql);
  if(!$resultado){
    echo "400.2";
    exit;
  }
  $row = mysqli_fetch_row($resultado);
  echo $row[0];
  