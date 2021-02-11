$(document).ready(function(){
  let infoUser;
  let carrito = {};

  $("#alerta").hide();
  //VALIDAMOS SI EXISTE UNA SESIÓN ACTIVA
  if (!sessionStorage.getItem('sesion')) {
    location.href = "../../index.htm";
  }else{
    $("#question-buy").prop('checked', true);
    
    $("#content-formulario-preguntas").css('display', 'none');
    //CARGAMOS LOS DATOS DE USUARIO DE LOCALSTORAGE
    let infoString = localStorage.getItem('infoUser');
    infoUser = JSON.parse(JSON.parse(infoString));
    getPreguntasCompra();
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


  function getPreguntasCompra(){
    $.ajax({
      url: "../../php/servicios/getPreguntasComprasUser.php",
      type: "POST",
      data: {usuario: infoUser.informacion[0].id},
      success: function(response){
        data = JSON.parse(response);
        pintarPreguntas(data, 'div-compra');
      }
    });
  }


  const pintarPreguntas = (data, btn) =>{
    $("#body-pregutas").html(' ');
    let html = '';
    for (let index = 0; index < data.data.length; index++) {
      html += '<tr>'+
      '<td>'+(index+1)+'</td>'+
      '<td>'+data.data[index].nombre+'</td>'+
      '<td>'+
       ' <button class="eye '+btn+'" title="Ver conversación" data-index="'+index+'"><i class="material-icons">remove_red_eye</i></button>'+
      '</td>'+
    '</tr>';
    }
    $("#body-pregutas").html(html);
    addEventVer();
  }

  function addEventVer(){

    $(".div-compra").on('click', function(){
      $("#content-formulario-preguntas").css('display', 'block');
      let index = $(this).attr('data-index');
      $("#content-formulario-preguntas").html(' ');
      let html = '';
      html += '<div class="title-question" id="question-compra">'+
                '<span>'+data.data[index].nombre+'</span>'+
                '</div>'+
                '<div class="content-dialog-conver">'+
                  '<div class="dialog-question">'+data.data[index].pregunta+'</div>'+
                  '<div class="dialog-answer">'+data.data[index].repuesta+'</div>'+
                  '<div class="input-dialog">'+
                    '<button class="btn-comprar" data-id="'+data.data[index].producto+'">Comprar ahora</button>'+
                  '</div>'+
              '</div>';+
      $("#content-formulario-preguntas").html(html);
      addEventComprar();
    });

    $(".div-venta").on('click', function(){
      let index = $(this).attr('data-index');
      $("#content-formulario-preguntas").css('display', 'block');
      
      $("#content-formulario-preguntas").html(' ');
      let html = '';
      html += '<div class="title-question" id="question-compra">'+
                '<span>'+data.data[index].nombre+'</span>'+
                '</div>'+
                '<div class="content-dialog-conver">'+
                  '<div class="dialog-question">'+data.data[index].pregunta+'</div>'+
                  '<div class="dialog-answer" id="div-respuesta-vendedor">'+data.data[index].repuesta+'</div>'+
                  '<div class="input-dialog">'+
                    ' <input type="text" name="" id="input-respuesta" data-id="'+data.data[index].id+'" placeholder="Escribe un mensaje">'+
                  '</div>'+
              '</div>';+
      $("#content-formulario-preguntas").html(html);
      if(data.data[index].repuesta.length > 0){
        $("#input-respuesta").prop('disabled', true);
      }
      addEventComprar();
    });

  }

  function addEventComprar(){

    $(".btn-comprar").on('click', function(e){
      e.stopImmediatePropagation();
      let producto = $(this).attr('data-id');
      $.ajax({
        url: "../../php/servicios/getProducto.php",
        type: "POST",
        data: {idProducto: producto},
        success: function(response){
          data = JSON.parse(response);
          guardarCarrito(data);
        }
      });
    });

    $("#input-respuesta").change(function(){
      if($("#input-respuesta").val()){
        $("#div-respuesta-vendedor").html($("#input-respuesta").val());
        $("#input-respuesta").prop('disabled', true);
        let id = $(this).attr('data-id');
        $.ajax({
          url: "../../php/servicios/updateRespuesta.php",
          type: "POST",
          data: {producto: id, respuesta: $("#input-respuesta").val()},
          success: function(response){
            preguntasVendedor();
          }
        });
      }
    })
  }

  const guardarCarrito = (data) =>{
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
    location.href = "../carrito.htm";
  }

  $("#question-sell").change(function(){
    preguntasVendedor();
  });

  $("#question-buy").change(function(){
    getPreguntasCompra();
  });

  const preguntasVendedor = () =>{
    $("#input-respuesta").val('');
    $.ajax({
      url: "../../php/servicios/getPreguntasVendedor.php",
      type: "POST",
      data: {usuario: infoUser.informacion[0].id},
      success: function(response){
        data = JSON.parse(response);
        pintarPreguntas(data, 'div-venta' );
      }
    });
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