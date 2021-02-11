//VALIDAMOS SI EXISTE UNA SESIÓN ACTIVA

let carrito = {};
$(document).ready(function(){
  let favoritos = {};
  $("#alerta").hide();
  if (!sessionStorage.getItem('sesion')) {
    location.href = "../../index.htm";
  }else{
    datosUsuario = JSON.parse(JSON.parse(localStorage.getItem('infoUser')));
    getFavoritos();
  }

  //ACCIONES DE LOS BOTONES PARA NEVAGAR POR EL PERFIL
  $('button').click(function(){
    $('body .action-buttons-perfil').on('click', 'button', function(){
      let button = $(this).attr('title');
      let page = button.toLowerCase();
      if(page != "cerrar sesion" && page != "inicio"){
        location.href = page+".htm";
      }
      if(page == "cerrar sesión"){
        sessionStorage.removeItem('sesion');
        localStorage.removeItem('infoUser');
        location.href = "../../index.htm";
      }
      if(page == "inicio"){
        location.href = "../../index.htm";
      }
    });
  });

  function getFavoritos(){
    $.ajax({
      url: "../../php/servicios/getFavoritos.php",
      type: "POST",
      data: { idUsuario: datosUsuario.informacion[0].id },
      success: function (response) {
        let data = JSON.parse(response);
        pintarFavoritos(data);
      }
    });
  }

  const pintarFavoritos = data =>{
    for (let index = 0; index < data.data.length; index++) {
      let favorito = {
        id: data.data[index].id,
        url: data.data[index].url,
        nombre: data.data[index].nombre,
        precio: data.data[index].precio,
        producto: data.data[index].producto
      };

      if(favoritos.hasOwnProperty(favorito.nombre)){
        console.log("No agregue")
      }else{
        favoritos[favorito.nombre] =  {...favorito};
      }
      
    }
    $("#body-favorito").html(" ");
    let html = " ";
    Object.values(favoritos).forEach(favorito => {
      html += '<tr>'+
      '<td>'+
        '<img src="../../image/'+favorito.url+'" alt="">'+
      '</td>'+
      '<td>'+favorito.nombre+'</td>'+
      '<td>$'+favorito.precio+'</td>'+
      '<td>'+
       ' <button data-id="'+favorito.producto+'" class="btn-comprar-again">Agregar Carrito</button>'+
        '<button data-id="'+favorito.producto+'" class="btn-buy">Comprar</button>'+
      '</td>'+
    '</tr>';
    });
    $("#body-favorito").html(html);
    addEventComprar();
  }

  function addEventComprar(){

    
    $(".btn-comprar-again").click(function(e){
      e.stopImmediatePropagation();
      verAlerta('#3498db', 'Producto agregado al carrito');
      let producto = $(this).attr('data-id');
      obtenerProducto(producto, 0);
    });

    $(".btn-buy").click(function(e){
      e.stopImmediatePropagation();
      let producto = $(this).attr('data-id');
      obtenerProducto(producto, 1);
    });

  }

  const obtenerProducto = (producto, ban) =>{
    $.ajax({
      url: "../../php/servicios/getProducto.php",
      type: "POST",
      data: {idProducto: producto},
      success: function(response){
        data = JSON.parse(response);
        guardarCarrito(data, ban);
      }
    });
  }

  const guardarCarrito = (data, ban) =>{
    if(localStorage.getItem('carrito')){
      carrito = JSON.parse(localStorage.getItem('carrito'));
    }
    console.log(carrito);
    const producto = {
      id: data.data.id,
      idVendedor: data.data.idUser,
      url:  data.data.imagen[0].url,
      nombre: data.data.nombre,
      cantidad: 1,
      precio: data.data.precio,
      oferta: data.data.oferta,
      descuento: data.data.precioD
    }

    if(carrito.hasOwnProperty(producto.id)){
      producto.cantidad = carrito[producto.id].cantidad + 1;
    }
    carrito[producto.id] = {...producto};

    //Guardamos el carritos
    localStorage.setItem('carrito', JSON.stringify(carrito));
    if(ban == 1){
      location.href = "../carrito.htm";
    }
  }
  function verAlerta(color, text){
    $(".alert-mensaje").css('background-color', color)
    $(".alert-mensaje").text(text);
    $("#alerta").show("slow");
    setTimeout(function(){
      $("#alerta").hide("slow");
    }, 5000);
  };
});