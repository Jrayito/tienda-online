<?php
  include("../_conexion.php");
  
  $id_producto = $_POST['input-hide'];

  for ($i = 0; $i < count($_FILES["file"]["name"]); $i++) { 
    $file = $_FILES["file"];
    //$nombre = $file["name"][$i];
    $ruta = $file["tmp_name"][$i];
    //$carpeta = "../../image/";
    $nom_enc = md5($file["tmp_name"][$i]).".jpg";
    $src = "../../image/".$nom_enc;
    move_uploaded_file($ruta, $src);
    $sql = "INSERT INTO imagenes(id_producto, url, tipo) 
      VALUES ($id_producto, '$nom_enc', $i)";

    $resultado = mysqli_query($con, $sql);  
    echo "Imagen insertada";
  }
  mysqli_close($con);