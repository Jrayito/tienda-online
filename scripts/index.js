//VALIDAMOS SI EXISTE UNA SESIÓN ACTIVA
if(sessionStorage.getItem('sesion')){
  $("#is").text('Perfil');
  $("#cc").text('Cerrar Sesión');
}


$(document).ready(function(){

  
  //OBTENEMOS LA CATEGORIA EL NAVBAR
  $('a').click(function(){
    $('body .nav-categorias').on('click', 'a', function(e){
      e.preventDefault();
      e.stopImmediatePropagation();
      let item = $(this).text();
      if(!e.target.classList.contains('cat')){
        location.href = "electro/productos.htm?cat="+item;
      }
    })
  });

  //OBTENERMOS LA CATEGORIA DE LAS CAJAS IMAGENES
  $(".col-s4").click(function(){ 
    let item = $(this).attr('data-cat');
    location.href = "electro/productos.htm?cat="+item;
   });

   $(".col-s6").click(function(){ 
    let item = $(this).attr('data-cat');
    location.href = "electro/productos.htm?cat="+item;
  });

  $(".col-s3").click(function(){ 
    let item = $(this).attr('data-cat');
    location.href = "electro/productos.htm?cat="+item;
  });

  //ENLACES DE INICIO SESIÓN
  $('a').click(function(){
    $('body .nav-banner').on('click', 'a', function(e){
      e.preventDefault();
      let sesion = $(this).text();
      if(sesion != "Perfil" && sesion != "Cerrar Sesión"){
        if(sesion == "shopping_cart"){
          location.href = "electro/carrito.htm";
        }else{
          location.href = "electro/sesion.htm?sesion="+sesion;
        }
      }else{
        if(sesion == "Perfil"){
          location.href = "electro/perfil/compras.htm";
        }else{
          sessionStorage.removeItem('sesion');
          localStorage.removeItem('infoUser');
          location.href = "index.htm";
        }
      }
     
    });
  }); 
});