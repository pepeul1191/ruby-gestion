var distrito_array_json_th = [
	{titulo:"id", index: "id", estilos:"width: 10px; display:none;"},
	{titulo:"Nombre",index:"nombre",estilos:"width: 90px;"},
	{titulo:"Botones",index:"NA",estilos:"width: 20px;"}
];

var distrito_array_json_td = [
	{tipo:"label_id",estilos:"color: blue; display:none;", index:"id", edicion:""},
	{tipo:"text",estilos:"width:90px;", index:"nombre", edicion:""},
	{tipo:"botones", index:"botones", edicion:"true"}
];

var distrito_array_json_btn_td = [
	{clase:"fa fa-times",url:"#",alt:"Quitar Fila",estilos:"padding-left: 27px;", operacion:"QuitarFila"}
]; 

var distrito_array_json_btn = [
	{tipo: "agrega_fila", operacion:"AgregarFila", icono: "fa fa-plus", label: "Agregar Registro", clase: "boton-tabla  mootools"},
	{tipo: "guardar_tabla", operacion:"GuardarTabla", icono: "fa fa-check", label: "Guardar Cambios", clase: "boton-tabla  mootools" }
];

var distrito_array_extra_data = [
	{tipo: "label", llave: "provincia_id", id : "provincia_id"}
];

var MostrarDistritos = new Class({
    Interfaces: [ IChainOperacion ],
    SetearSiguienteInstancia: function(instancia){
        //implementación de IChainOperacion
        this.siguiente_instancia = instancia;
    },
    SiguienteEslabon: function(operacion, thisDOM, objeto) {
        //implementación de IChainOperacion
        this.siguiente_instancia.EjecutarOperacion(operacion, thisDOM, objeto);
    }, 
    EjecutarOperacion: function(operacion, thisDOM, objeto) {
        //implementación de IChainOperacion
        //console.log("MostrarDistritos");
        var provincia_id = thisDOM.parent().parent().children(0).children(0).html();

      if(operacion == "MostrarDistritos"){
        tablaDistritos.BorrarTable();
		
				var ajax_dao_subtitulos = new AjaxPython(); 
				ajax_dao_subtitulos.Constructor("GET", BASE_URL + "maestros/distrito/listar/" + provincia_id, "", false);

				tablaDistritos.SetTableId("tablaDistritos");
				tablaDistritos.SetTableObj("tablaDistritos");
				tablaDistritos.SetTableHeader(distrito_array_json_th);
				tablaDistritos.SetTableBody(distrito_array_json_td, distrito_array_json_btn_td, ajax_dao_subtitulos);
				tablaDistritos.SetTableFooter(distrito_array_json_btn, false);
				tablaDistritos.SetURLGuardar(BASE_URL + "maestros/distrito/guardar");
				tablaDistritos.SetExtraData(distrito_array_extra_data);

				$("#provincia_id").html(provincia_id);
           
          tablaDistritos.MostrarTable();
           //ObservadorConcreto.NotificarObservadores(objeto.observador, tipo_arreglo, id_fila);
        }else{
          try {
          	this.SiguienteEslabon(operacion, thisDOM, objeto);
          }catch(error){
          	console.log("Operación no implementada");
          }
        }
    }
});