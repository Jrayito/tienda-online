$(document).ready(function () {
  let datosUsuario;
  let carrito = {};

  $("#alerta").hide();
  //VALIDAMOS SI EXISTE UNA SESIÓN ACTIVA
  if (!sessionStorage.getItem('sesion')) {
    location.href = "../../index.htm";
  } else {
    datosUsuario = JSON.parse(JSON.parse(localStorage.getItem('infoUser')));
    getInformacion();
    getCompras();
  }

  //ACCIONES DE LOS BOTONES PARA NEVAGAR POR EL PERFIL
  $('button').click(function () {
    $('body .action-buttons-perfil').on('click', 'button', function () {
      let button = $(this).attr('title');
      let page = button.toLowerCase();
      if (page != "cerrar sesion" && page != "inicio") {
        location.href = page + ".htm";
      }
      if (page == "cerrar sesión") {
        sessionStorage.removeItem('sesion');
        localStorage.removeItem('infoUser');
        location.href = "../../index.htm";
      }
      if (page == "inicio") {
        location.href = "../../index.htm";
      }
    });
  });

  function getInformacion() {
    $.ajax({
      url: "../../php/servicios/getUsuario.php",
      type: "POST",
      data: { email: datosUsuario.informacion[0].email, password: datosUsuario.informacion[0].password },
      success: function (response) {
        localStorage.setItem('infoUser', JSON.stringify(response));
      }
    });
  }


  function getCompras() {
    $.ajax({
      url: "../../php/servicios/getCompras.php",
      type: "POST",
      data: { email: datosUsuario.informacion[0].email },
      success: function (response) {
        let data = JSON.parse(response);
        pintarCompras(data);
      }
    });
  }


  const pintarCompras = (data) => {
    $("#container-compras-table").html(" ");
    let html = '';
    for (let index = 0; index < data.data.length; index++) {
      html += '<div class="info-compras-table">' +
        ' <div>' +
        ' <label>Orden ID: ' + data.data[index].idOrden + '</label>' +
        '<span>Fecha Orden: ' + data.data[index].fecha + '</span>' +
        '</div>' +
        '<table>' +
        '<thead>' +
        ' <tr>' +
        '<th>Entrega en</th>' +
        '<th>Pago</th>' +
        '</tr>' +
        '</thead>' +
        '<tbody>' +
        '<tr>' +
        '<td>' + data.data[index].usuario + '</td>' +
        '<td>' + data.data[index].pago + '</td>' +
        '</tr>' +
        '<tr>' +
        '<td>Correo: ' + data.data[index].email + '</td>' +
        ' <td>Subtotal: ' + data.data[index].subtotal + '</td>' +
        '</tr>' +
        '<tr>' +
        '<td>' + data.data[index].direccion + '</td>' +
        '<td>Descuento: ' + data.data[index].descuento + '</td>' +
        '</tr>' +
        '<tr>' +
        '<td></td>' +
        '<td>Total: ' + data.data[index].total + '</td>' +
        '</tr>' +
        '</tbody>' +
        ' </table>' +
        '<table>' +
        '<tbody id="body-' + index + '">' +
        '</tbody>' +
        '</table>' +
        '</div>';
        pintarProductosComrprado(data.data[index].id, index);
    }

    $("#container-compras-table").html(html);
  }

  const pintarProductosComrprado = (id, body) => {
    let html = '';
    $.ajax({
      url: "../../php/servicios/getOrdenesCompras.php",
      type: "POST",
      data: { id: id },
      success: function (response) {
        let data = JSON.parse(response);
        for (let index = 0; index < data.data.length; index++) {
          html += '<tr>' +
                    '<td>' +
                    ' <img src="../../image/'+data.data[index].url+'" alt="">' +
                    '</td>' +
                    '<td>'+data.data[index].titulo+'</td>' +
                    '<td>'+data.data[index].cantidad+'</td>' +
                    '<td></td>' +
                    ' <td>' +
                    '<button class="btn-comprar" data-id="'+data.data[index].producto+'">Volver comprar</button>' +
                    '<button class="btn-calificar" data-id="'+data.data[index].id+'" data-calificar="'+data.data[index].calificar+'" data-pro="'+data.data[index].producto+'">Calificar</button>' +
                    ' </td>' +
                  '</tr>'
        }
        $("#body-"+body).html(html);
        addEventComprar();
      }
    });
  }

  function addEventComprar(){

    $(".btn-comprar").click(function(e){
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
    })

    $(".btn-calificar").click(function(e){
      e.stopImmediatePropagation();
      let calificar = $(this).attr('data-calificar');
      let idProducto = $(this).attr('data-pro');
      let idCompra = $(this).attr('data-id');
      if(calificar == '0'){
        $(".modal").css('opacity', '1');
        $(".modal").css('visibility', 'visible');
        $("#btn-calificar-enviar").attr('data-pro', idProducto);
        $("#btn-calificar-enviar").attr('data-id', idCompra);
      }else{
        verAlerta('#3498db', 'Producto ya calificado');
      }
    });

  }

  $(".close-modal").click(function(){
    $(".modal").css('opacity', '0');
    $(".modal").css('visibility', 'hidden');
  });

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

  $("#btn-calificar-enviar").click(function(){
    let calificacion = $(".botones input:radio:checked").val();
    let texto = $("#calificar-text").val();
    let idCompra = $(this).attr('data-id');
    let idProducto = $(this).attr('data-pro')
    let obj = {
      calificacion: calificacion,
      texto: texto,
      producto: idProducto,
      usuario: datosUsuario.informacion[0].nombre+" "+datosUsuario.informacion[0].apellidos
    };
    actulizarCalificar(idCompra);
    addCalificar(obj);

    verAlerta('#3498db', '¡Gracias por calificar!');
    setTimeout(function(){
      location.href = "compras.htm";
    }, 3000);
  });


  const actulizarCalificar = (idCompra) =>{
    $.ajax({
      url: "../../php/servicios/updateCalificar.php",
      type: "POST",
      data: {idCompra: idCompra},
      success: function(response){
      }
    });
  }

  const addCalificar = (obj) =>{
    $.ajax({
      url: "../../php/servicios/setCalificacion.php",
      type: "POST",
      data: obj,
      success: function(response){
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