<?php
  include("../_conexion.php");
  //SELECT i.url, p.nombre, p.precio, p.por_oferta, p.categoria FROM productos p, imagenes i WHERE p.id = i.id_producto AND i.tipo = 0 AND p.id_user != 10 AND p.subcategoria like '%accesorios%'

  $idUsuario = $_POST[]