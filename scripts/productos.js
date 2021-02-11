//URL A BUSCAR EN CASO DE EXISTIR O NO UNA SESION
//let getURLProductos = "../php/servicios/getProductos.php";
//Usamos ID = 0 CUANDO EL USUARIO NO ESTA LOGEADO
let idUsuario = 0;
//ALMACENA TODA LA INFORMACIÓN DE USUARIO
let datosUsuario;
//ARRAY PARA LLENAR EL FILTRO DE BUSQUEDA
let addCategorias = [];
//VARIABLE PARA SABER EN CUAL CATEGORIA ESTAMOS Y HAER BUSQUEDA TOTAL
let categoria;
let data;
//VALIDAMOS SI EXISTE UNA SESIÓN ACTIVA

$("#alerta").hide();
if (sessionStorage.getItem('sesion')){
  datosUsuario = JSON.parse(JSON.parse(localStorage.getItem('infoUser')));
  idUsuario = datosUsuario.informacion[0].id;
  $("#is").text('Perfil');
  $("#cc").text('Cerrar Sesión');
  //getURLProductos = "../php/servicios/getProductosSesion.php";
}

  //const colores =  ['Rojo','Negro','Blanco','Azul','Verde','Naranja','Amarillo','Marrón','Naranja','Rosa'];
  const cete = ['Celulares y smartphones', 'Audifonos', 'Carcasas y fundas', 'Smartwatches y smartbands'];
  const camp = ['Laptos', 'Tablets y accesorios', 'Impresión', 'Monitores', 'Mouses y teclados', 'Webcam y audio'];
  const caac = ['Accesorios para cámaras', 'Cámaras'];
  const eav = ['Audifonos', 'Bocinas', 'Minicomponentes', 'Teatro casa', 'Accesorios electrónica'];
  const cv = ['Consolas', 'Juegos', 'Accesorios consolas'];

getProductos();
$("#link-cat").html(" ");

//ENLACES EN NAVBAR
$('a').click(function(){
  $('body .nav-banner').on('click', 'a', function(e){
    e.preventDefault();
    let sesion = $(this).text();
    if(sesion != "Perfil" && sesion != "Cerrar Sesión"){
      if(sesion == "shopping_cart"){
        location.href = "carrito.htm";
      }else{
        location.href = "sesion.htm?sesion="+sesion;
      }
    }else{
      if(sesion == "Perfil"){
        location.href = "perfil/compras.htm";
      }else{
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

function getProductos(){
  let valores = getURL();
  if(valores['cat']){
    $.ajax({
      url: "../php/servicios/getProductosCat.php",
      type: "POST",
      data: {categoria: valores['cat'], idUsuario: idUsuario},
      success: function (response){
        data = JSON.parse(response);
        pintarProductos(data);
      }
    });
  }else if(valores['todo']){
    $.ajax({
      url: "../php/servicios/getProductosAll.php",
      type: "POST",
      data: {categoria: valores['categoria'], idUsuario: idUsuario},
      success: function (response){
        data = JSON.parse(response);
        pintarProductos(data);
      }
    });
  }else if(valores['catKey']){
    $.ajax({
      url: "../php/servicios/getProductosKey.php",
      type: "POST",
      data: {categoria: valores['catKey'], idUsuario: idUsuario, key: valores['key']},
      success: function (response){
        data = JSON.parse(response);
        pintarProductos(data);
      }
    });
  }else if(valores['catPrecio']){
    $.ajax({
      url: "../php/servicios/getProductosPrecio.php",
      type: "POST",
      data: {categoria: valores['catPrecio'], idUsuario: idUsuario, min: valores['min'],  max: valores['max']},
      success: function (response){
        data = JSON.parse(response);
        pintarProductos(data);
      }
    });
  }
}


const pintarProductos = (data) =>{
  $("#items").html(" ");
  let html = '';
  for (let index = 0; index < data.data.length; index++) {
    let descuento = validarDescuento(data.data[index].descuento);
    html += '<div class="card-item view-producto" data-id="'+data.data[index].id+'" data-item="'+data.data[index].nombre+'">'+
              '<div class="content-img">'+
                '<img src="../image/'+data.data[index].url+'" alt="">'+
                '<button title="Favorito" data-index="'+index+'" class="btn-fav"><i class="material-icons">favorite</i></button>'+
             ' </div>'+
              '<div class="items-info">'+
                '<label>'+data.data[index].nombre+'</label>'+
                '<span>$'+data.data[index].precio+'</span><span>'+descuento+'</span>'+
                '</div>'+
            '</div>';
  }
  $("#items").html(html);
  addEventLinks();
  mostrarSubcategorias(data.data[0].categoria);
}

const validarDescuento = data =>{
  let descuento = parseInt(data);
  if(descuento > 0){
    return data + "% Descuento";
  }
  return "";
}

const mostrarSubcategorias = (addCategorias) =>{
    categoria = addCategorias;
    $("#title").text(categoria);
    switch(addCategorias){
      case 'Celulares y Telefonía':
        arrayFinal(cete);
        //arrayCategorias.push(cete);
        break;
      case 'Computación':
        arrayFinal(camp);
        //arrayCategorias.push(camp);
        break;
      case 'Cámara y accesorios':
        arrayFinal(caac);
        //arrayCategorias.push(caac);
        break;
      case 'Electrónica,audio y video':
        arrayFinal(eav);
        //arrayCategorias.push(eav);
        break;
      case 'Consolas y videojuegos':
        arrayFinal(cv);
        //arrayCategorias.push(cv);
        break;
    }
}
let categoriasFinal = [];
const arrayFinal = data =>{
  let html = '<a href="#" class="link" >Ver Todo</a>';
  for (let index = 0; index < data.length; index++) {
    html += '<a href="#" class="link">'+data[index]+'</a>';
  }
  $("#link-cat").append(html);
  addEventLinks();
}


function addEventLinks(){

  $(".link").on('click', function(e){
    e.preventDefault();
    let text = $(this).text();
    let cURL;
    if(text != "Ver Todo"){
      cURL = "cat="+text;
    }else{
      cURL = "todo="+text+"&categoria="+categoria;
    }
    location.href = "productos.htm?"+cURL;
  });

  $(".view-producto").click(function(e){
    e.stopImmediatePropagation();
    let idProducto = $(this).attr("data-id");
    let producto = $(this).attr("data-item");
    location.href = "compra.htm?producto="+producto+"&id="+idProducto;
  });

  $(".btn-fav").click(function(e){
    e.stopImmediatePropagation();
    let index = $(this).attr('data-index');
    verAlerta('#e74c3c', '¡Ahora es tu favorito');
    const favorito = {
      url: data.data[index].url,
      nombre: data.data[index].nombre,
      precio: data.data[index].precio,
      idUsuario: idUsuario,
      idProducto: data.data[index].id
    };

    $.ajax({
      url: "../php/servicios/addFavorito.php",
      type: "POST",
      data: favorito,
      success: function (response){

      }
    });
    
  });
}


$("#key").change(function(){
  if($("#key").val()){
    location.href = "productos.htm?catKey="+categoria+"&key="+$("#key").val();
  }
});

$("#aplicarPrecio").click(function(){
  let min = 0;
  let max = 50000;
  if($("#min").val()){
    min = parseInt($("#min").val());
  }
  if($("#max").val()){
    max = parseInt($("#max").val());
  }
  location.href = "productos.htm?catPrecio="+categoria+"&min="+min+"&max="+max;
});

function verAlerta(color, text){
  $(".alert-mensaje").css('background-color', color)
  $(".alert-mensaje").text(text);
  $("#alerta").show("slow");
  setTimeout(function(){
    $("#alerta").hide("slow");
  }, 5000);
};