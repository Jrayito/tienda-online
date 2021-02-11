$(document).ready(function () {
  //VARIABLES PARA VALORES DE LA OFERTA

  $("#alerta").hide();
  let oferta = 0;
  let descuento = 0;
  let precio_descuento = 0;
  //ALMACENA LA INFORMACION DE USUARIO
  let infoUser;
  //ALMACENA TODA LA INFORMACIÓN DE LOS PRODUCTOS PARA MANIPULAR DIRECTO SIN CONSULTAR A DB
  let dataProductos;
  //ALMACENA SI SE HARÁ ACTUALIZACIÓN
  let update = 0;
  //ID DEL PRODUCTO CUANDO SERÁ ACTUALIZADO
  let producto = 0;
  
  //VALIDAMOS SI EXISTE UNA SESIÓN ACTIVA
  if (!sessionStorage.getItem('sesion')) {
    location.href = "../../index.htm";
  } else {
    //CARGAMOS LOS DATOS DE USUARIO DE LOCALSTORAGE
    let infoString = localStorage.getItem('infoUser');
    infoUser = JSON.parse(JSON.parse(infoString));

    getProductos();
  }
  const colores =  ['Rojo','Negro','Blanco','Azul','Verde','Naranja','Amarillo','Marrón','Naranja','Rosa'];
  const cete = ['Celulares y smartphones', 'Audifonos', 'Carcasas y fundas', 'Smartwatches y smartbands'];
  const camp = ['Laptos', 'Tablets y accesorios', 'Impresión', 'Monitores', 'Mouses y teclados', 'Webcam y audio'];
  const caac = ['Accesorios para cámaras', 'Cámaras'];
  const eav = ['Audifonos', 'Bocinas', 'Minicomponentes', 'Teatro casa', 'Accesorios electrónica'];
  const cv = ['Consolas', 'Juegos', 'Accesorios consolas'];

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
  const cambiarSubCategoria = () =>{
    let itemSubcategoria = [];
    let categoria = $("#categoria-items option:selected").val();
    console.log(categoria);
    switch (categoria) {
      case '10':
        itemSubcategoria = cete;
        break;
      case '20':
        itemSubcategoria = camp;
        break;
      case '30':
        itemSubcategoria = caac;
        break;
      case '40':
        itemSubcategoria = eav;
        break;
      case '50':
        itemSubcategoria = cv;
        break;
    }
    RemoveOption();
    for (let index = 0; index < itemSubcategoria.length; index++) {
      let sub = $("<option />", { text: itemSubcategoria[index], value: itemSubcategoria[index] });
      $("#subcategoria").append(sub);
    }
  }

  //CAPTURAMOS EL VALOR DE CATEGORIA AL CAMBIO PARA RELLENAR SUBCATEGORIA
  $("#categoria-items").change(function () {
    cambiarSubCategoria();
  });
  //REMOVEMOS DEL SELECT
  const RemoveOption = () => {
    $("#subcategoria option").each(function () {
      $(this).remove();
    });
  }
  const guardarProducto = () => {
    let infoProducto = {
      idProducto: producto,
      user: infoUser.informacion[0].id,
      nombre: $("#name-item").val(),
      resena: $("#res-item").val(),
      categoria: $("#categoria-items option:selected").text(),
      subcategoria: $("#subcategoria option:selected").val(),
      marca: $("#marca").val(),
      modelo: $("#modelo").val(),
      color: $("#color option:selected").text(),
      estado: $("#estado option:selected").text(),
      oferta: oferta,
      precio: $("#precio").val(),
      descuento: descuento,
      precioD: precio_descuento,
      stock: $("#stock").val(),
      descripcion: $("#desc").val()
    }
    return infoProducto;
  }

  $("#btn-guardar").click(function (e) {
    $(".close-modal").css('display', 'none');
    e.preventDefault();
    let bandera_error = 1;
    let infoProducto = guardarProducto();

    if (infoProducto.nombre.length == 0 || infoProducto.resena.length == 0 || infoProducto.marca.length == 0
      || infoProducto.modelo.length == 0 || infoProducto.precio.length == 0 || infoProducto.stock.length == 0
      || infoProducto.descripcion.length == 0) {
        verAlerta('#e74c3c', 'Falta campo por rellenar');
      bandera_error = 0;
    } else if (oferta == 1 && descuento == 0 || descuento < 0 || descuento > 100) {
      bandera_error = 0;
      verAlerta('#e74c3c', 'Descuento no valido');
      

    } else if ($("#categoria-items option:selected").val() == 0 || $("#subcategoria option:selected").val() == 0) {
      bandera_error = 0;
      verAlerta('#e74c3c', 'Es necesaria una categoria');
    } else if ($("#color option:selected").val() == 0 || $("#estado option:selected").val() == 0) {
      bandera_error = 0;
      verAlerta('#e74c3c', 'Fala campo por rellenar');
    } else if (infoProducto.estado != "Nuevo" && infoProducto.estado != "Usado") {
      bandera_error = 0;
      verAlerta('#e74c3c','Estado de producto no valido');
    }

    if (bandera_error != 0) {
      let url = "../../php/servicios/setProducto.php";
      if(update == 1){
        url = "../../php/servicios/updateProducto.php";
      }
      
      $.ajax({
        url: url,
        type: "POST",
        data: guardarProducto(),
        success: function (response) {
          if(update != 1){
            if (response != "400.1" || response != "400.2") {
              verAlerta('#3498db', 'Sube imagenes del producto')
              $("#input-hide").val(response);
              $("#btn-guardar").css('display', 'none');
              $("#file").prop('disabled', false);
  
            }
          }else{
            if (response == "400"){
              verAlerta('#e74c3c', 'Error en la actualización');
            }else{
              verAlerta('#3498db', 'Actualización correcta');
              setTimeout(function(){
                location.href = "publicaciones.htm";
              }, 3000);
            }
          }
        }
      });
    }
  });


  //CHECAMOS SI EXISTE LA OFERTA
  $("#box-oferta").change(function () {
    if (this.checked) {
      $("#por_precio").prop('disabled', false);
      oferta = 1;
    } else {
      $("#por_precio").prop('disabled', true);
      oferta = 0;
      descuento = 0;
      precio_descuento = 0;
      $("#por_precio").val(oferta);
      $("#precio_oferta").val(precio_descuento);
    }
  });

  //OBTENEMOS EL VALOR DE LA OFERTA
  $("#por_precio").change(function (e) {
    e.preventDefault();
    descuento = $(this).val();
    if (descuento > 0 && descuento <= 100) {
      let precio = $("#precio").val();
      precio_descuento = precio - (precio * (descuento / 100));
      precio_descuento = precio_descuento.toFixed(2);
      $("#precio_oferta").val(precio_descuento);
    } else {
      alert("Valor de descuento no valido");
    }
  });

  //OBTENERMOS EL VALOR DEL PRODUCTO POR SI CAMBIA
  $("#precio").change(function () {
    if (oferta == 1) {
      let precio = $("#precio").val();
      precio_descuento = precio - (precio * (descuento / 100));
      precio_descuento = precio_descuento.toFixed(2);
      $("#precio_oferta").val(precio_descuento);
    }
  });

  //ACCION DEL BOTON FILES PARA SUBIR ARCHIVOS
  $(function () {
    $("#file").on('change', function () {
      //LIMPIAMOS VISTA PREVIA
      $(".vista-previa").html(' ');
      let archivos = document.getElementById('file').files;
      let navegador = window.URL || window.webkitURL;
      //RECORRER LOS ARCHIVOS
      for (let index = 0; index < archivos.length; index++) {
        let type = archivos[index].type;
        let name = archivos[index].name;
        if (type != 'image/jpeg' && type != "image/jpg" && type != "image/webp") {
          alert("El archivo" + name + " no es permitido (jpeg - jpg).")
        } else {
          let objeto_url = navegador.createObjectURL(archivos[index]);
          $(".vista-previa").append("<img src=" + objeto_url + ">");
          $("#btn-files").prop('disabled', false);
        }
      }
    });
  });

  $("#btn-files").click(function (e) {
    e.preventDefault();
    $(".modal").css('opacity', '0');
    $(".modal").css('visibility', 'hidden');
    let formData = new FormData($("#formulario")[0]);
    $.ajax({
      url: "../../php/servicios/setImage.php",
      type: "POST",
      data: formData,
      contentType: false,
      processData: false,
      success: function (response) {
        verAlerta('#3498db', 'Producto registrado con exito')
        setTimeout(function(){
          location.href = "publicaciones.htm";
        },3000);
      }
    });
  });

  function getProductos() {
    $.ajax({
      url: "../../php/servicios/getProductosUser.php",
      type: "POST",
      data: { idUsuario: infoUser.informacion[0].id },
      success: function (response) {
        dataProductos = JSON.parse(response)
        if (dataProductos.data.length != 0) {
          pintarProductos(dataProductos);
        }
      }
    });
  }
  const pintarProductos = data => {
    $("#body-productos").html(' ');
    let html = ' ';
    for (let index = 0; index < data.data.length; index++) {
      html += '<tr>'+
                '<td>'+data.data[index].nombre+'</td>'+
                '<td>'+data.data[index].cat+'</td>'+
                '<td>'+data.data[index].subcat+'</td>'+
                '<td>'+data.data[index].stock+'</td>'+
                '<td>$ '+data.data[index].precio+'</td>'+
                '<td>'+
                  '<button class="delete-item" title="Eliminar" data-id="'+data.data[index].id+'">'+
                    '<i class="material-icons">delete</i>'+
                  '</button>'+
                  '<button class="edit-item" title="Editar" data-id="'+data.data[index].id+'" data-index="'+index+'">'+
                    '<i class="material-icons">edit</i>'+
                  '</button>'+
                '</td>'+
              '</tr>'
    }
    $("#body-productos").html(html);
    addEventos();
  }
  //AGREGAMOS EVENTOS A LOS NUEVOS BOTONES QUE AGREGAMOS AL DOM
  function addEventos(){
    $(".delete-item").on('click', function(){
      let idEliminar = $(this).attr('data-id');
      $.ajax({
        url: "../../php/servicios/deleteProductoUser.php",
        type: "POST",
        data: { idProducto: idEliminar },
        success: function (response) {
          if(response == "400"){
            verAlerta('#74c3c', 'Producto no eliminado');
          }else{
            verAlerta('#3498db','Producto eliminado')
          }

          setTimeout(function(){
            location.href = "publicaciones.htm";
          }, 3000);
        }
      });
    });

    $(".edit-item").on('click', function(){
      let indexProducto = $(this).attr('data-index');
      producto = $(this).attr('data-id');
      update = 1;
      //CAMBIAMOS LOS VALORES DE REGISTRAR-EDITAR PRODUCTO
      $(".modal").css("opacity", "1");
      $(".modal").css("visibility", "visible");
      $(".content-image-item").css("display", "none");
      $(".content-form-item").css("width", "100%");
      $(".content-modal-item-new").css("width", "70%");

      //CARGAMOS TODOS LOS DATOS EN LOS INPUTS
      $("#name-item").val(dataProductos.data[indexProducto].nombre);
      $("#res-item").val(dataProductos.data[indexProducto].resena);
      $("#marca").val(dataProductos.data[indexProducto].marca);
      $("#modelo").val(dataProductos.data[indexProducto].modelo);
      $("#precio").val(dataProductos.data[indexProducto].precio);
      $("#stock").val(dataProductos.data[indexProducto].stock);
      $("#desc").val(dataProductos.data[indexProducto].desc);
      let value = aditarCategoria(dataProductos.data[indexProducto].cat);
      $("#categoria-items option[value='"+value+"']").attr("selected",true)
      cambiarSubCategoria();
      let color = recorarColores(dataProductos.data[indexProducto].color);
      $("#color option[value='"+color+"']").attr("selected",true);
      let estado = estadoProducto(dataProductos.data[indexProducto].estado);
      $("#estado option[value='"+estado+"']").attr("selected",true);
      $("#subcategoria option[value='"+dataProductos.data[indexProducto].subcat+"']").attr("selected",true);
      marcarOferta(dataProductos.data[indexProducto].oferta, indexProducto);
    });
  }

  const aditarCategoria = (informacion) =>{
    let subCat = '0';
    switch(informacion){
      case 'Celulares y Telefonía':
        subCat = '10';
        break;
      case 'Computación':
        subCat = '20';
        break;
      case 'Cámara y accesorios':
        subCat = '30';
        break;
      case 'Electrónica,audio y video':
        subCat = '40';
        break;
      case 'Consolas y videojuegos':
        subCat = '50';
        break;
    }
    return subCat;
  }
  const recorarColores = (color) =>{
    for (let index = 0; index < colores.length; index++) {
        if(color == colores[index]){
          return index+1;
        }
    }
    return 0;
  }
  const estadoProducto = (estado) =>{
    if(estado == "Nuevo"){
      return 1;
    }
    return 2;
  }
  const marcarOferta = (ofertaE, index) =>{
    if(ofertaE != 0){
      $("#box-oferta").prop('checked', true);
      $("#por_precio").val(dataProductos.data[index].descuento);
      $("#por_precio").prop('disabled', false);
      $("#precio_oferta").val(dataProductos.data[index].precio_descuento);
      oferta = 1;
      descuento = dataProductos.data[index].descuento;
      precio_descuento = dataProductos.data[index].precio_descuento;
    }
  }

  const resetModal = () => {
    $("#name-item").val("");
    $("#res-item").val("");
    $("#categoria-items option[value=0]").attr('selected', true);
    cambiarSubCategoria();
    $("#color option[value=0]").attr('selected', true);
    $("#estado option[value=0]").attr('selected', true);
    oferta = 0;
    descuento = 0;
    precio_descuento = 0;
    $("#box-oferta").prop('checked', false);
    $("#marca").val("");
    $("#modelo").val("");
    $("#desc").val("");
    $("#precio").val("");
    $("#por_precio").val("");
    $("#precio_oferta").val("");
    $("#stock").val("");
  }

  $("#new-item").click(function(){
    update = 0;
    $(".modal").css('opacity', '1');
    $(".modal").css('visibility', 'visible');
    $(".content-image-item").css("display", "block");
    $(".content-form-item").css("width", "70%");
    $(".content-modal-item-new").css("width", "90%");
    //REINICIAMOS EL FORMULARIO AL CERRAR
    resetModal();
  });

  $(".close-modal").click(function(){
    $(".modal").css('opacity', '0');
    $(".modal").css('visibility', 'hidden');
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
