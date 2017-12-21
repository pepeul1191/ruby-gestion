var ajax_dao_unidad_medida = new AjaxPython(); 
ajax_dao_unidad_medida.Constructor("GET", BASE_URL + "estaciones/unidad_medida/listar_select", "", false);

var estacion_sesnor_array_json_th = [
	{titulo:"id", index: "id", estilos:"width: 10px; display:none;"},
	{titulo:"Nombre",index:"nombre",estilos:"width: 100px;"},
	{titulo:"Descripcion",index:"descripcion",estilos:"width: 250px;"},
	{titulo:"Unidad Medida",index:"unidad_medida_id",estilos:"width: 100px;"},
	{titulo:"Botones",index:"NA",estilos:"width: 100px;"}
];

var estacion_sesnor_array_json_td = [
	{tipo:"label_id",estilos:"color: blue; display:none;", index:"id", edicion:""},
	{tipo:"text",estilos:"width:100px;", index:"nombre", edicion:""},
	{tipo:"text",estilos:"width:250px;", index:"descripcion", edicion:""},
	{tipo:"select",estilos:"width:100px;", index:"unidad_medida_id", edicion:"",options:{ajax_rpta_data:ajax_dao_unidad_medida.ajax_rpta_data}},
	{tipo:"botones", index:"botones", edicion:"true"}
];

var estacion_sesnor_array_json_btn_td = [
	{clase:"fa fa-sort-numeric-desc",url:"",alt:"Mostrar Datos",estilos:"padding-left: 30px;", operacion:"IrURL", href:"#/estacion/sensor/datos/"},
	{clase:"fa fa-times",url:"",alt:"Eliminar Estación",estilos:"padding-left: 30px;", operacion:"QuitarFila"}
]; 

var estacion_sesnor_array_json_btn = [
	{tipo: "agrega_fila", operacion:"AgregarFila", icono: "fa fa-plus", label: "Agregar Registro", clase: "boton-tabla  mootools"},
	{tipo: "guardar_tabla", operacion:"GuardarTabla", icono: "fa fa-check", label: "Guardar Cambios", clase: "boton-tabla  mootools" }
];