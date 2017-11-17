var campo_array_json_th = [
	{titulo:"id", index: "id", estilos:"width: 10px; display:none;"},
	{titulo:"Nombre",index:"nombre",estilos:"width: 100px;"},
	{titulo:"Area",index:"area",estilos:"width: 50px;"},
	{titulo:"Distrito",index:"distrito_id",estilos:"width: 280px;"},
	{titulo:"Botones",index:"NA",estilos:"width: 90px;"}
];

var campo_array_json_td = [
	{tipo:"label_id",estilos:"color: blue; display:none", index:"id", edicion:""},
	{tipo:"text",estilos:"width:100px;", index:"nombre", edicion:""},
	{tipo:"text",estilos:"width:50px;", index:"area", edicion:""},
  {tipo:"autocomplete",estilos:"width:200px;", index:"distrito", edicion:"",  url: BASE_URL  + "maestros/distrito/buscar?distrito=", llave: "id", valor: "distrito", formato_carga:{llave: "distrito_id", valor: "distrito"}},
	{tipo:"botones", index:"botones", edicion:"true"}
];

var campo_array_json_btn_td = [
  {clase:"fa fa-times",url:"",alt:"Eliminar asociación",estilos:"padding-left: 10px;", operacion:"QuitarFila"},
]; 

var campo_array_json_btn = [
	{tipo: "agrega_fila", operacion:"AgregarFila", icono: "fa fa-plus", label: "Agregar Registro", clase: "boton-tabla  mootools"},
	{tipo: "guardar_tabla", operacion:"GuardarTabla", icono: "fa fa-check", label: "Guardar Cambios", clase: "boton-tabla  mootools" }
];