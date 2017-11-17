var asociacion_array_json_th = [
	{titulo:"id", index: "id", estilos:"width: 10px; display:none;"},
	{titulo:"Nombre",index:"nombre",estilos:"width: 100px;"},
	{titulo:"Referencia Llegada",index:"referencia_llegada",estilos:"width: 300px;"},
	{titulo:"Area",index:"area",estilos:"width: 50px;"},
	{titulo:"Responsable", tipo:"autocomplete",estilos:"width:200px;", index:"responsable", edicion:"",  url: BASE_URL  + "agricultores/asociacion/buscar/", llave: "id", valor: "nombre", formato_carga:{llave: "responsable_id", valor: "responsable"}},
	{titulo:"Botones",index:"NA",estilos:"width: 90px;"}
];

var asociacion_array_json_td = [
	{tipo:"label_id",estilos:"color: blue; display:none", index:"id", edicion:""},
	{tipo:"text",estilos:"width:100px;", index:"nombre", edicion:""},
	{tipo:"text",estilos:"width:300px;", index:"referencia_llegada", edicion:""},
	{tipo:"text",estilos:"width:50px;", index:"area", edicion:""},
  {tipo:"text",estilos:"width:200px;", index:"responsable", edicion:""},
	{tipo:"botones", index:"botones", edicion:"true"}
];

var asociacion_array_json_btn_td = [
  {clase:"fa fa-times",url:"",alt:"Eliminar módulo",estilos:"padding-left: 30px;", operacion:"QuitarFila"}
]; 

var asociacion_array_json_btn = [
	{tipo: "agrega_fila", operacion:"AgregarFila", icono: "fa fa-plus", label: "Agregar Registro", clase: "boton-tabla  mootools"},
	{tipo: "guardar_tabla", operacion:"GuardarTabla", icono: "fa fa-check", label: "Guardar Cambios", clase: "boton-tabla  mootools" }
];