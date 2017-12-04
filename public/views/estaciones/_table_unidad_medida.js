var unidad_medida_array_json_th = [
	{titulo:"id", index: "id", estilos:"width: 10px; display:none;"},
	{titulo:"Nombre",index:"nombre",estilos:"width: 120px;"},
	{titulo:"Símbolo",index:"simbolo",estilos:"width: 90px;"},
	{titulo:"Botones",index:"NA",estilos:"width: 10px;"}
];

var unidad_medida_array_json_td = [
	{tipo:"label_id",estilos:"color: blue; display:none", index:"id", edicion:""},
	{tipo:"text",estilos:"width:120px;", index:"nombre", edicion:""},
	{tipo:"text",estilos:"width:90px;", index:"simbolo", edicion:""},
	{tipo:"botones", index:"botones", edicion:"true"}
];

var unidad_medida_array_json_btn_td = [
	{clase:"fa fa-times",url:"#",alt:"Eliminar Unidad de Medida",estilos:"padding-left: 10px;", operacion:"QuitarFila"}
]; 

var unidad_medida_array_json_btn = [
	{tipo: "agrega_fila", operacion:"AgregarFila", icono: "fa fa-plus", label: "Agregar Registro", clase: "boton-tabla  mootools"},
	{tipo: "guardar_tabla", operacion:"GuardarTabla", icono: "fa fa-check", label: "Guardar Cambios", clase: "boton-tabla  mootools" }
];