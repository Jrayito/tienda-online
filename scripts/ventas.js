$(document).ready(function () {
  
  $("#alerta").hide();
  let datosUsuario;
  //VALIDAMOS SI EXISTE UNA SESIÓN ACTIVA
  if (!sessionStorage.getItem('sesion')) {
    location.href = "../../index.htm";
  } else {
    datosUsuario = JSON.parse(JSON.parse(localStorage.getItem('infoUser')));
    $("#all").prop('checked', true);
    getProductosVendidos();
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

  function getProductosVendidos() {
    $.ajax({
      url: "../../php/servicios/getVentas.php",
      type: "POST",
      data: { id: datosUsuario.informacion[0].id },
      success: function (response) {
        let data = JSON.parse(response);
        pintarProductoVenta(data);
      }
    });
  }

  const pintarProductoVenta = data => {
    $("#body-ventas").html(' ');
    for (let index = 0; index < data.data.length; index++) {
      if (data.data[index].estado == "0") {
        ventaPendiente(data, index);
      } else {
        ventaFinalizada(data, index);
      }
    }
  }
  const ventaFinalizada = (data, index) => {
    let html = '';
    html += '<tr>' +
      '<td>' +
      '<img src="../../image/' + data.data[index].url + '" alt="">' +
      '</td>' +
      '<td>' + data.data[index].titulo + '</td>' +
      '<td>' + data.data[index].cantidad + '</td>' +
      '<td>Finalizado</td>' +
      '</tr>';

    $("#body-ventas").append(html);
  }

  const ventaPendiente = (data, index) => {
    let html = '';
    html += '<tr>' +
      '<td>' +
      '<img src="../../image/' + data.data[index].url + '" alt="">' +
      '</td>' +
      '<td>' + data.data[index].titulo + '</td>' +
      '<td>' + data.data[index].cantidad + '</td>' +
      '<td><button class="btn-entregar" data-id="'+data.data[index].id+'">Entregar</button></td>' +
      '</tr>';

    $("#body-ventas").append(html);
    addEventEntregar();
  }

  function addEventEntregar(){
    $(".btn-entregar").on('click', function(e){
      e.stopImmediatePropagation();
      let id = $(this).attr('data-id');
      $.ajax({
        url: "../../php/servicios/updateVentaEstado.php",
        type: "POST",
        data: {id: id},
        success: function (response) {
          if(response != "400"){
            verAlerta('#3498db', 'Extrega realizada');
          }

          $("#all").prop('checked', true);
          getProductosVendidos(); 
        }
      });
    })
  }
    $("#all").change(function(){
      getProductosVendidos();
    });

    $("#pen").change(function(){
      $.ajax({
        url: "../../php/servicios/getVentasEstado.php",
        type: "POST",
        data: { id: datosUsuario.informacion[0].id, estado: 0},
        success: function (response) {
          let data = JSON.parse(response);
          pintarProductoVenta(data);
        }
      });
    });

    $("#finish").change(function(){
      $.ajax({
        url: "../../php/servicios/getVentasEstado.php",
        type: "POST",
        data: { id: datosUsuario.informacion[0].id, estado: 1},
        success: function (response) {
          let data = JSON.parse(response);
          pintarProductoVenta(data);
        }
      });
    });

    function verAlerta(color, text){
      $(".alert-mensaje").css('background-color', color)
      $(".alert-mensaje").text(text);
      $("#alerta").show("slow");
      setTimeout(function(){
        $("#alerta").hide("slow");
      }, 5000);
    };

});