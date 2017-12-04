var departamento_array_json_th = [
	{titulo:"id", index: "id", estilos:"width: 10px; display:none;"},
	{titulo:"Nombre",index:"nombre",estilos:"width: 90px;"},
	{titulo:"Botones",index:"NA",estilos:"width: 10px;"}
];

var departamento_array_json_td = [
	{tipo:"label_id",estilos:"color: blue; display:none", index:"id", edicion:""},
	{tipo:"text",estilos:"width:90px;", index:"nombre", edicion:""},
	{tipo:"botones", index:"botones", edicion:"true"}
];

var departamento_array_json_btn_td = [
	{clase:"fa fa-chevron-right",url:"#",alt:"Gestionar Provincias del Departamento",estilos:"padding-left: 20px;", operacion:"MostrarProvincias"},
	{clase:"fa fa-times",url:"#",alt:"Eliminar módulo",estilos:"padding-left: 10px;", operacion:"QuitarFila"}
]; 

var departamento_array_json_btn = [
	{tipo: "agrega_fila", operacion:"AgregarFila", icono: "fa fa-plus", label: "Agregar Registro", clase: "boton-tabla  mootools"},
	{tipo: "guardar_tabla", operacion:"GuardarTabla", icono: "fa fa-check", label: "Guardar Cambios", clase: "boton-tabla  mootools" }
];