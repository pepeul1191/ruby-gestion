var ajax_dao_tipo_estacion = new AjaxPython(); 
ajax_dao_tipo_estacion.Constructor("GET", BASE_URL + "estaciones/tipo_estacion/listar", "", false);

var array_extra_data_tabla_estacion = [
	{tipo: "label", llave: "campo_id", id : "txtIdeCampo"}
];	

var campo_estacion_array_json_th = [
	{titulo:"id", index: "id", estilos:"width: 10px; display:none;"},
	{titulo:"Nombre",index:"nombre",estilos:"width: 100px;"},
	{titulo:"Descripcion",index:"descripcion",estilos:"width: 250px;"},
	{titulo:"Latitud",index:"latitud",estilos:"width: 50px;"},
	{titulo:"Longitud",index:"longitud",estilos:"width: 50px;"},
	{titulo:"Altura",index:"altura",estilos:"width: 50px;"},
	{titulo:"Tipo",index:"tipo_estacion_id",estilos:"width: 100px;"},
	{titulo:"Botones",index:"NA",estilos:"width: 100px;"}
];

var campo_estacion_array_json_td = [
	{tipo:"label_id",estilos:"color: blue; display:none;", index:"id", edicion:""},
	{tipo:"text",estilos:"width:100px;", index:"nombre", edicion:""},
	{tipo:"text",estilos:"width:250px;", index:"descripcion", edicion:""},
	{tipo:"text",estilos:"width:50px;", index:"latitud", edicion:""},
	{tipo:"text",estilos:"width:50px;", index:"longitud", edicion:""},
	{tipo:"text",estilos:"width:50px;", index:"altura", edicion:""},
	{tipo:"select",estilos:"width:100px;", index:"tipo_estacion_id", edicion:"",options:{ajax_rpta_data:ajax_dao_tipo_estacion.ajax_rpta_data}},
	{tipo:"botones", index:"botones", edicion:"true"}
];

var campo_estacion_array_json_btn_td = [
{clase:"fa fa-times",url:"",alt:"Eliminar módulo",estilos:"padding-left: 30px;", operacion:"QuitarFila"}
]; 

var campo_estacion_array_json_btn = [
	{tipo: "agrega_fila", operacion:"AgregarFila", icono: "fa fa-plus", label: "Agregar Registro", clase: "boton-tabla  mootools"},
	{tipo: "guardar_tabla", operacion:"GuardarTabla", icono: "fa fa-check", label: "Guardar Cambios", clase: "boton-tabla  mootools" }
];