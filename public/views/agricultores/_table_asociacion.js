var asociacion_array_json_th = [
	{titulo:"id", index: "id", estilos:"width: 10px; display:none;"},
	{titulo:"Nombre",index:"nombre",estilos:"width: 100px;"},
	{titulo:"Referencia Llegada",index:"referencia_llegada",estilos:"width: 300px;"},
	{titulo:"Area",index:"area",estilos:"width: 50px;"},
	{titulo:"Responsable",index:"responsable_id",estilos:"width: 280px;"},
	{titulo:"Botones",index:"NA",estilos:"width: 90px;"}
];

var asociacion_array_json_td = [
	{tipo:"label_id",estilos:"color: blue; display:none", index:"id", edicion:""},
	{tipo:"text",estilos:"width:100px;", index:"nombre", edicion:""},
	{tipo:"text",estilos:"width:300px;", index:"referencia_llegada", edicion:""},
	{tipo:"text",estilos:"width:50px;", index:"area", edicion:""},
  {tipo:"autocomplete",estilos:"width:200px;", index:"responsable", edicion:"",  url: BASE_URL  + "agricultores/responsable/buscar?responsable=", llave: "id", valor: "responsable", formato_carga:{llave: "responsable_id", valor: "responsable"}},
	{tipo:"botones", index:"botones", edicion:"true"}
];

var asociacion_array_json_btn_td = [
	{clase:"fa fa-square", href:"#/asociacion/campos/",alt:"Ver Campos",estilos:"padding-left: 15px;", operacion:"IrURL"},
	{clase:"fa fa-tachometer", href:"#/asociacion/estaciones/",alt:"Ver Estaciones",estilos:"padding-left: 10px;", operacion:"IrURL"},
  {clase:"fa fa-times",url:"",alt:"Eliminar asociación",estilos:"padding-left: 10px;", operacion:"QuitarFila"},
]; 

var asociacion_array_json_btn = [
	{tipo: "agrega_fila", operacion:"AgregarFila", icono: "fa fa-plus", label: "Agregar Registro", clase: "boton-tabla  mootools"},
	{tipo: "guardar_tabla", operacion:"GuardarTabla", icono: "fa fa-check", label: "Guardar Cambios", clase: "boton-tabla  mootools" }
];