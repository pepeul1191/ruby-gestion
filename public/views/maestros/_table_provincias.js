var provincia_array_json_th = [
	{titulo:"id", index: "id", estilos:"width: 10px; display:none;"},
	{titulo:"Nombre",index:"nombre",estilos:"width: 40%;"},
	{titulo:"Botones",index:"NA",estilos:"width: 20%;"}
];

var provincia_array_json_td = [
	{tipo:"label_id",estilos:"color: blue; display:none;", index:"id", edicion:""},
	{tipo:"text",estilos:"width:100%;", index:"nombre", edicion:""},
	{tipo:"botones", index:"botones", edicion:"true"}
];

var provincia_array_json_btn_td = [
	{clase:"fa fa-th-list",url:"#",alt:"Cargar Distritos",estilos:"padding-left: 23px;", operacion:"MostrarDistritos"}, 
	{clase:"fa fa-times",url:"#",alt:"Quitar Fila",estilos:"padding-left: 23px;", operacion:"QuitarFila"}
]; 

var provincia_array_json_btn = [
	{tipo: "agrega_fila", operacion:"AgregarFila", icono: "fa fa-plus", label: "Agregar Registro", clase: "boton-tabla  mootools"},
	{tipo: "guardar_tabla", operacion:"GuardarTabla", icono: "fa fa-check", label: "Guardar Cambios", clase: "boton-tabla  mootools" }
];

var provincia_array_extra_data = [
	{tipo: "label", llave: "departamento_id", id : "departamento_id"}
];

var MostrarProvincias = new Class({
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
        //console.log("MostrarProvincias");
        var departamento_id = thisDOM.parent().parent().children(0).children(0).html();

      if(operacion == "MostrarProvincias"){
      	tablaProvincias.BorrarTable();
      	tablaDistritos.BorrarTable();

				var ajax_subtitulos = new AjaxPython(); 
				ajax_subtitulos.Constructor("GET", BASE_URL + "maestros/provincia/listar/" + departamento_id, "", false);

				tablaProvincias.SetTableId("tablaProvincias");
				tablaProvincias.SetTableObj("tablaProvincias");
				tablaProvincias.SetTableHeader(provincia_array_json_th);
				tablaProvincias.SetTableBody(provincia_array_json_td, provincia_array_json_btn_td, ajax_subtitulos);
				tablaProvincias.SetTableFooter(provincia_array_json_btn, false);
				tablaProvincias.SetURLGuardar(BASE_URL + "maestros/provincia/guardar");
				tablaProvincias.SetExtraData(provincia_array_extra_data);

				$("#departamento_id").html(departamento_id);
         
        tablaProvincias.MostrarTable();
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