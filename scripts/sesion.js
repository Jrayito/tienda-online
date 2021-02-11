Formulario();

//Obtenermos los valores de la URL
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

//Comprobar para mostar un formulario
function Formulario() {
  let valores = getURL();
  let formulario = valores['sesion'];
  if (formulario == 'Iniciar Sesión') {
    $("#reg").hide();
    $("#ins").css('visibility', 'visible');
  } else {
    $("#ins").hide();
    $("#reg").css('visibility', 'visible');
  }
}

//CARGAMOS LOS DATOS DE LA LA COLONIA EN BASE A CP
$("#input-cp").change(function () {
  let cp = $("#input-cp").val();
  if (cp.length == 5) {
    $.ajax({
      url: "https://api-sepomex.hckdrk.mx/query/info_cp/" + cp + "?type=simplified",
      type: "GET",
      data: {},
      success: function (response) {
        RemoveOption();
        let asentamiento = response.response.asentamiento;
        for (let index = 0; index < asentamiento.length; index++) {
          let colonia = $("<option />", { text: asentamiento[index], value: asentamiento[index] });
          $("#select-col").append(colonia);
        }
        $("#estado").val(response.response.estado);
        $("#ciudad").val(response.response.ciudad);
        $("#municipio").val(response.response.municipio);
      }
    })
  }
});

//REMOVEMOS LAS COLONIA DEL SELECT POR CASO DE EQUIVOCACIÓN
const RemoveOption = () => {
  $("#select-col option").each(function () {
    $(this).remove();
  });
}
//VARIABLE PARA GUARDAR INFORMACION EN LOCALSTORAGE
let infoRegistro = {};
//ACCIONES CUANDO EL DOCUMENTO YA ESTA CARGADO
$(document).ready(function () {
  //ACCIÓN DEL BOTON REGISTRAR PARA GUARDAR LOS DATOS EN DB
  $("#btn-registro").click(function () {
    infoRegistro = {
      nombre: $("#nombre").val(),
      apellido: $("#apellido").val(),
      correo: $("#email-registro").val(),
      cp: $("#input-cp").val(),
      estado: $("#estado").val(),
      ciudad: $("#ciudad").val(),
      municipio: $("#municipio").val(),
      colonia: $("#select-col option:selected").val(),
      calle: $("#calle").val(),
      password: $("#password").val(),
    }

    $.ajax({
      url: "../php/servicios/setUsuario.php",
      type: "POST",
      data: infoRegistro,
      success: function (response) {
        if (response == 200) {
          let info = {
            email: infoRegistro.correo,
            password: infoRegistro.password
          }
          createSesion(info);
        } else {
          alert("No se ha podido hacer el registro");
        }

      }
    })
  });


  $("#btn-log").click(function () {
    let infoSesion = {
      email: $("#email-log").val(),
      password: $("#pass-log").val()
    }
    createSesion(infoSesion);

  });

  const createSesion = (data) => {
    $.ajax({
      url: "../php/servicios/getUsuario.php",
      type: "POST",
      data: data,
      success: function (response) {
        let info = JSON.parse(response);
        console.log(info);
        if(info.informacion[0].id != 1000){
          
          sessionStorage.setItem('sesion', '1');
          localStorage.setItem('infoUser', JSON.stringify(response));
          location.href = "../index.htm";
          
        }else{
          alert("Usuarios y/o contraseña erronea");
        }
        
        
      }
    });
  }
});