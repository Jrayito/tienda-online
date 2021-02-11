
let idUsuario = 0;
$("#alerta").hide();

//VALIDAMOS SI EXISTE UNA SESIÓN ACTIVA
if (sessionStorage.getItem('sesion')) {
  datosUsuario = JSON.parse(JSON.parse(localStorage.getItem('infoUser')));
  idUsuario = datosUsuario.informacion[0].id;
  $("#is").text('Perfil');
  $("#cc").text('Cerrar Sesión');
}

//almacenamos informacion a cambiar en caso de oferta
let precio = "";
let descuento = "";
let lblDescuento = "";
//Alamcena toda la información del producto
let data;
//Almacenamos informacion de carrito de compras
let carrito = {};

cargarProducto();


//ENLACES EN NAVBAR
$('a').click(function () {
  $('body .nav-banner').on('click', 'a', function (e) {
    e.preventDefault();
    let sesion = $(this).text();
    if (sesion != "Perfil" && sesion != "Cerrar Sesión") {
      if (sesion == "shopping_cart") {
        location.href = "carrito.htm";
      } else {
        location.href = "sesion.htm?sesion=" + sesion;
      }
    } else {
      if (sesion == "Perfil") {
        location.href = "perfil/compras.htm";
      } else {
        sessionStorage.removeItem('sesion');
        localStorage.removeItem('infoUser');
        location.href = "../index.htm";
      }
    }

  });
});

//OBTENEMOS LOS PARAMETROS PASADOS POR URL
function getURL() {
  let loc = document.location.href;

  if (loc.indexOf('?') > 0) {
    let getString = loc.split('?')[1];
    let GET = getString.split('&');
    var get = {};
    for (var i = 0, l = GET.length; i < l; i++) {
      var tmp = GET[i].split('=');
      get[tmp[0]] = unescape(decodeURI(tmp[1]));
    }
    return get;
  }
}

const validarOferta = data =>{
  if(data.data.oferta == 0){
    precio = data.data.precio+".00";
  }else{
    precio = parseFloat(data.data.precioD);
    lblDescuento = data.data.descuento+"% Descuento"
    descuento = "$"+data.data.precio+".00";
  }
}

function cargarProducto() {
  let valores = getURL();
  $.ajax({
    url: "../php/servicios/getProducto.php",
    type: "POST",
    data: { idProducto: valores['id'] },
    success: function (response) {
      data = JSON.parse(response);
      validarOferta(data);
      carrusel(data.data.imagen);
      pintarProductoInfo(data);
      extraerPreguntas();
      getCalificacion();
    }
  });
}

const completarDescuento = (decimal, entero) =>{
  let Ndecimal = decimal - entero;  
  let Nentero = Ndecimal.toFixed(2) * 100;
  if(Nentero > 0){
    return entero+"."+Nentero;
  }
  return entero+".00";
}


const pintarProductoInfo = data => {
  $("#items-detalles").html(" ");
  $("#link-cat").text(data.data.cat);
  $("#link-subcat").text(data.data.subcat);
  $("#img-full img").attr('src', '../image/'+data.data.imagen[0].url);
  $("#img-full img").attr('data-zoom', '../image/'+data.data.imagen[0].url);
  $("#img-full img").attr('id', 'imagen-full-zoom');
  $("#imagen-full-zoom").elevateZoom({
    zoomType	: "lens",
    lensShape : "round",
    lensSize  : 200
  });
  let html = '';
  html =  '<label>'+data.data.estado+'</label>'+
          '<h2>'+data.data.nombre+'</h2>'+
          '<p>'+data.data.resena+'</p>'+
          '<div class="table-prop">'+
            '<table>'+
              '<tbody>'+
                '<tr>'+
                  '<td>Marca</td>'+
                  '<td>'+data.data.marca+'</td>'+
                '</tr>'+
                '<tr>'+
                  '<td>Modelo</td>'+
                  '<td>'+data.data.modelo+'</td>'+
                '</tr>'+
                '<tr>'+
                  '<td>Color</td>'+
                  '<td>'+data.data.color+'</td>'+
                '</tr>'+
              '</tbody>'+
            '</table>'+
          '</div>'+
          '<del>'+descuento+'</del>'+
          '<h1>$'+precio+'</h1>'+
          '<span>'+lblDescuento+'</span>'+
          '<button id="btn-add-carrito">Agregar al carrito</button>'+
          '<button class="btn-fav" data-id><i class="material-icons">favorite</i></button>';
  $("#items-detalles").html(html);
  $("#descripcion").val(data.data.desc);
  addEventAddCarrito();
}

//Cargamos el carrusel de imagenes
const carrusel = data =>{
  $("#carrusel").html(" ");
  let html = '';
  for (let index = 0; index < data.length; index++) {
    html += '<div class="img-carrusel click-imagen">'+
              '<img src="../image/'+data[index].url+'" alt="">'+
            '</div>'; 
    
  }
  $("#carrusel").html(html);
  addEventImagen();
}


//Función para el cambio de imagen full
function addEventImagen (){
  
  $(".click-imagen").click(function(e){
    e.stopImmediatePropagation();
    let url = "";
    if(e.target.classList.contains('click-imagen')){
      let element = e.target;
      url = element.querySelector('img').getAttribute('src');
    }else{  
      url = e.target.getAttribute("src");
    }
    
    $("#img-full img").attr('src', url);
    $("#img-full img").attr('data-zoom', url);
    $("#imagen-full-zoom").elevateZoom({
      zoomType	: "lens",
      lensShape : "round",
      lensSize  : 200
    });
  });
}

function addEventAddCarrito(){
  $("#btn-add-carrito").click(function(e){
    verAlerta('#3498db', 'Producto agregado al carrito');
    e.stopImmediatePropagation();
    //Extraemos el carrito en caso de que exista informacion almacenada
    if(localStorage.getItem('carrito')){
      carrito = JSON.parse(localStorage.getItem('carrito'));
    }
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
  });


  $(".btn-fav").click(function(e){
    e.stopImmediatePropagation();
    verAlerta('#e74c3c', '¡Ahora es tu favorito!');
    const favorito = {
      url: data.data.imagen[0].url,
      nombre: data.data.nombre,
      precio: data.data.precio,
      idUsuario: idUsuario,
      idProducto: data.data.id
    };

    $.ajax({
      url: "../php/servicios/addFavorito.php",
      type: "POST",
      data: favorito,
      success: function (response){

      }
    });
    
  });


  $("#link-cat").click(function(e){
    e.preventDefault();
    let item = $(this).text();
    location.href = "productos.htm?todo=Ver Todo&categoria="+item;
  });

  $("#link-subcat").click(function(e){
    e.preventDefault();
    let item = $(this).text();
    location.href = "productos.htm?cat="+item;
  })
}

$("#input-question").change(function(){
    if($("#input-question").val() && sessionStorage.getItem('sesion')){
      const question = {
        producto:  data.data.id,
        comprador: idUsuario,
        vendedor: data.data.idUser,
        pregunta: $("#input-question").val(),
        nombre: data.data.nombre
      };
      $("#input-question").val('');
      $.ajax({
        url: "../php/servicios/setPregunta.php",
        type: "POST",
        data: question,
        success: function (response){
          extraerPreguntas();
        }
      });
    }
  });


  function extraerPreguntas(){
    $.ajax({
      url: "../php/servicios/getPreguntasProducto.php",
      type: "POST",
      data: {producto: data.data.id},
      success: function (response){
        let data = JSON.parse(response);
        pintarPreguntas(data);
      }
    });
  }

  const pintarPreguntas = (data) =>{
    $("#preguntas-usuario").html(" ");
    $("#preguntas-comunidad").html(" ");
    let htmlUsuario = '<h2>Tus preguntas</h2>';
    let htmlComunidad = '<h2>Otros usuarios preguntaron</h2>';
    for (let index = 0; index < data.data.length; index++) {
      if(data.data[index].comprador == idUsuario){
        htmlUsuario += '<div class="preguntas-div">'+
                          '<span>'+data.data[index].pregunta+'</span>'+
                          '<label>'+data.data[index].repuesta+'</label>'+
                        '</div>';
        $("#preguntas-usuario").html(htmlUsuario);
      }else{
        htmlComunidad += '<div class="preguntas-div">'+
                            '<span>'+data.data[index].pregunta+'</span>'+
                            '<label>'+data.data[index].repuesta+'</label>'+
                        '</div>';
        $("#preguntas-comunidad").html(htmlComunidad);
      }
    }

  }

  function getCalificacion(){
    $.ajax({
      url: "../php/servicios/getCalificacionProducto.php",
      type: "POST",
      data: {producto: data.data.id},
      success: function (response){
        let calificacion = JSON.parse(response);
        pintarCalificacion(calificacion);
      }
    });
  }

  const pintarCalificacion = (data) =>{
    $(".resenas-productos").html(" ");
    let html = ' <h2>Calificación de otros usuarios:</h2>';
    for (let index = 0; index < data.data.length; index++) {
      html += '<div class="card-resena">'+
      '<div class="title-resena">'+
        '<label>'+data.data[index].usuario+'</label>'+pintarEstrellas(data.data[index].calificacion)+'</div>'+
      '<p>'+data.data[index].texto+'</p>'  +
    '</div>';
    }
    $(".resenas-productos").html(html);

  }

  const pintarEstrellas = (estrellas) =>{
    let html = '';
    for (let index = 0; index < estrellas; index++) {
      html += '<i class="material-icons">star</i>';
    }
    return html;
  }

  //Animacion de alerta
  function verAlerta(color, text){
    $(".alert-mensaje").css('background-color', color)
    $(".alert-mensaje").text(text);
    $("#alerta").show("slow");
    setTimeout(function(){
      $("#alerta").hide("slow");
    }, 5000);
  };