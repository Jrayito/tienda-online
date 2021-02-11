$("#alerta").hide();

let datosUsuario;
let carrito = {};
let totalProducto = 0;
let descuento = 0;
let subtotal = 0;
let total = 0;
let FormaPago = "";
let idOrden;
let puntos;
let idUsuario;



if (sessionStorage.getItem('sesion')) {
  datosUsuario = JSON.parse(JSON.parse(localStorage.getItem('infoUser')));
  console.log(datosUsuario);
  idUsuario = datosUsuario.informacion[0].id;
  $("#puntos-disponibles").text(datosUsuario.informacion[0].puntos + " Puntos");
  puntos = datosUsuario.informacion[0].puntos;
  $("#is").text('Perfil');
  $("#cc").text('Cerrar Sesión');
}


ValidarCarrito();
function ValidarCarrito() {
  if (localStorage.getItem('carrito')) {
    carrito = JSON.parse(localStorage.getItem('carrito'));
    pintarCarrito();
  }
}

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
function precioTotal(id) {
  if (carrito[id].oferta == "0") {
    totalProducto = carrito[id].precio * carrito[id].cantidad;
  } else {
    totalProducto = parseFloat(carrito[id].descuento * carrito[id].cantidad);
    descuento += carrito[id].precio - carrito[id].descuento;
  }
  
  subtotal += totalProducto;
  totalProducto = totalProducto.toFixed(2);
  $("#subtotal").text("$" + subtotal.toFixed(2));
  $("#descuento").text("$" + descuento.toFixed(2));
  total = subtotal - descuento;
  $("#total").text("$" + total.toFixed(2));
  $("#mTotal").text("$" + total.toFixed(2));
}

function pintarCarrito() {
  $("#body-carrito").html(" ");
  let html = '';
  Object.values(carrito).forEach(producto => {
    precioTotal(producto.id);
    html += '<tr>' +
      '<td>' +
      '<img src="../image/' + producto.url + '" alt="">' +
      '</td>' +
      '<td>' + producto.nombre + '</td>' +
      '<td>' +
      '<input type="number" value="' + producto.cantidad + '" data-id="' + producto.id + '" class="input-cantidad">' +
      '</td>' +
      '<td>' +
      '<label>$' + totalProducto + '</label>' +
      '<label>$' + producto.precio + '</label>' +
      '</td>' +
      '<td><button class="btn-eliminar" data-id="' + producto.id + '">Eliminar</button></td>' +
      '</tr>';
  });
  $("#body-carrito").html(html);
  addEventBotonesEliminar();
}

function addEventBotonesEliminar() {

  $(".btn-eliminar").click(function (e) {
    e.stopImmediatePropagation();
    verAlerta('#e74c3c', 'Producto eliminado')
    delete carrito[$(this).attr('data-id')];
    localStorage.setItem('carrito', JSON.stringify(carrito));
    carrito = JSON.parse(localStorage.getItem('carrito'));
    //Coregimos el total
    $("#subtotal").text("--");
    $("#descuento").text("--");
    $("#total").text("--");
    $("#mTotal").text("--");
    totalProducto = 0;
    descuento = 0;
    subtotal = 0;
    total = 0;
    pintarCarrito();
  });

  $(".input-cantidad").change(function () {
    let id = $(this).attr('data-id');
    let producto = carrito[id];
    let cantidad = parseInt($(this).val());
    console.log(producto);
    if ( cantidad <= 0) {
      $(this).val(producto.cantidad);
    } else {
      if(cantidad > producto.cantidad){
        producto.cantidad = cantidad;
      }else{
        producto.cantidad = cantidad;
      }
      
      carrito[producto.id] = { ...producto };
      localStorage.setItem('carrito', JSON.stringify(carrito));
      carrito = JSON.parse(localStorage.getItem('carrito'));
      totalProducto = 0;
      descuento = 0;
      subtotal = 0;
      total = 0;
      pintarCarrito();
    }
  });
}

$("#return").click(function () {
  location.href = "../index.htm";
});

$("#btn-pagar").click(function () {

  if($.isEmptyObject(carrito)){
    verAlerta('#e74c3c', 'Carrito de compras vacío');
  }else{
    if (sessionStorage.getItem('sesion')) {
      $(".modal").css('opacity', '1');
      $(".modal").css('visibility', 'visible');
    } else {
      alert("Iniciar Sesión");
      location.href = "sesion.htm?sesion=Iniciar Sesión";
    }
  }

  

});

$(".close-modal").click(function () {
  $(".modal").css('opacity', '0');
  $(".modal").css('visibility', 'hidden');
});

$("#dom").change(function () {
  $("#mEntrega").text("Domicilio");
  $("#mTipo").text("Gratis");
});

$("#suc").change(function () {
  $("#mEntrega").text("Sucursal");
  $("#mTipo").text("Estandar");
});

$("#electro").change(function () {
  $("#mPago").text("Puntos Electro");
  FormaPago = "Puntos Electro";
});
$("#paypal").change(function () {
  $("#mPago").text("Paypal");
  FormaPago = "Paypal";
});
$("#card").change(function () {
  $("#mPago").text("Tarjeta Crédito");
  FormaPago = "VISA **** "
});
$("#oxxo").change(function () {
  $("#mPago").text("Pago Efectivo");
  FormaPago = "Efectivo Oxxo";
});

$("#btn-puntos").click(function (e) {
  e.stopImmediatePropagation();
  puntos = parseInt(datosUsuario.informacion[0].puntos);
  if (puntos < total) {
    verAlerta('#e74c3c', 'Puntos Insuficientes');

  } else {
    puntos = parseInt(puntos);
    puntos = puntos - total;
    crearOrden(datosCompra());
  }

});

$("#btn-card").click(function (e) {
  e.stopPropagation();
  e.stopImmediatePropagation();
  let bandera = 1;
  let datosCard = {
    nombreCard: $("#name-card").val(),
    numeroCard: $("#number-card").val(),
    mesCard: $("#mes-card").val(),
    anioCard: $("#anio-card"),
    cvv: $("#cvv-card").val()
  }
  let mes = parseInt(datosCard.mesCard);
  if (datosCard.nombreCard.length == 0 || datosCard.numeroCard.length == 0 ||
    datosCard.mesCard.length == 0 || datosCard.anioCard.length == 0 || datosCard.cvv.length == 0) {
    verAlerta('#e74c3c', 'Falta un campo por llenar');

    bandera = 0;
  } else if (datosCard.cvv.length > 3) {
    verAlerta('#e74c3c', 'CVV invalido');

    bandera = 0;
  } else if (mes <= 0 || mes > 12) {
    verAlerta('#e74c3c', 'Mes invalido');

    bandera = 0;
  } else if (datosCard.numeroCard.length > 16) {
    verAlerta('#e74c3c', 'Número de tarjeta invalido');

    bandera = 0;
  }

  if (bandera == 1) {
    FormaPago += datosCard.numeroCard.slice(datosCard.numeroCard.length - 4);
    puntos = parseInt(puntos);
    puntos += (total * 0.01);
    crearOrden(datosCompra());
  }
});

$("#btn-pago-paypal").click(function () {
  puntos = parseInt(puntos);
  puntos += (total * 0.01);
  crearOrden(datosCompra());
})

$("#btn-pago-oxxo").click(function () {
  puntos = parseInt(puntos);
  puntos += (total * 0.01);
  crearOrden(datosCompra());
})

const datosCompra = () => {
  let datosCompra = {
    orden: "ELEC-" + Math.floor(Math.random() * 100000000000),
    fecha: Fecha(),
    usuario: datosUsuario.informacion[0].nombre + " " + datosUsuario.informacion[0].apellidos,
    correo: datosUsuario.informacion[0].email,
    direccion: "Calle: " + datosUsuario.informacion[0].calle + " CP " + datosUsuario.informacion[0].cp + " - " + datosUsuario.informacion[0].estado + ", " + datosUsuario.informacion[0].ciudad + ", " + datosUsuario.informacion[0].municipio,
    pago: FormaPago,
    subtotal: subtotal.toFixed(2),
    descuento: descuento.toFixed(2),
    total: total.toFixed(2)
  };
  return datosCompra;
}

const Fecha = () => {
  let fecha = new Date();
  return fecha.getFullYear() + "-" + (fecha.getMonth() + 1) + "-" + fecha.getDate();
}


function crearOrden(inforOrden) {
  $.ajax({
    url: "../php/servicios/setOrder.php",
    type: "POST",
    data: inforOrden,
    success: function (response) {
      if (response == "400") {
        verAlerta('#e74c3c', 'Error en la transacción');
      } else {
        idOrden = parseInt(response);
        guardarOrden();
      }
    }
  });
}

const datosProductoOrden = (producto) => {
  const datos = {
    orden: idOrden,
    idProducto: producto.id,
    url: producto.url,
    titulo: producto.nombre,
    cantidad: producto.cantidad,
    idVendedor: producto.idVendedor
  };
  return datos;
}
function guardarOrden() {
  Object.values(carrito).forEach(producto => {
    $.ajax({
      url: "../php/servicios/setOrdenProductos.php",
      type: "POST",
      data: datosProductoOrden(producto),
      success: function (response) {
        verAlerta('#3498db', 'Compra realizada');
        updatePuntos();
        localStorage.removeItem('carrito');
        setTimeout(function () {
          location.href = "perfil/compras.htm";
        }, 2000);
      }
    });
  });
}


const updatePuntos = () => {
  $.ajax({
    url: "../php/servicios/updatePuntos.php",
    type: "POST",
    data: { puntos: puntos, idUsuario: idUsuario },
    success: function (response) {
    }
  });
}

function verAlerta(color, text) {
  $(".alert-mensaje").css('background-color', color)
  $(".alert-mensaje").text(text);
  $("#alerta").show("slow");
  setTimeout(function () {
    $("#alerta").hide("slow");
  }, 5000);
};