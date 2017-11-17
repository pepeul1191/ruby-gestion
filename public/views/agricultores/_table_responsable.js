var responsable_array_json_th = [
	{titulo:"id", index: "id", estilos:"width: 10px; display:none;"},
	{titulo:"Nombres",index:"nombres",estilos:"width: 200px;"},
	{titulo:"Apellido Paterno",index:"paterno",estilos:"width: 200px;"},
	{titulo:"Apellido Paterno",index:"materno",estilos:"width: 200px;"},
  {titulo:"Teléfono",index:"telefono",estilos:"width: 200px;"},
  {titulo:"Correo",index:"correo",estilos:"width: 200px;"},
	{titulo:"Botones",index:"NA",estilos:"width: 90px;"}
];

var responsable_array_json_td = [
	{tipo:"label_id",estilos:"color: blue; display:none", index:"id", edicion:""},
	{tipo:"text",estilos:"width:100px;", index:"nombres", edicion:""},
	{tipo:"text",estilos:"width:100px;", index:"paterno", edicion:""},
	{tipo:"text",estilos:"width:100px;", index:"materno", edicion:""},
  {tipo:"text",estilos:"width:100px;", index:"telefono", edicion:""},
  {tipo:"text",estilos:"width:100px;", index:"correo", edicion:""},
	{tipo:"botones", index:"botones", edicion:"true"}
];

var responsable_array_json_btn_td = [
  {clase:"fa fa-times",url:"",alt:"Eliminar módulo",estilos:"padding-left: 30px;", operacion:"QuitarFila"}
]; 

var responsable_array_json_btn = [
	{tipo: "agrega_fila", operacion:"AgregarFila", icono: "fa fa-plus", label: "Agregar Registro", clase: "boton-tabla  mootools"},
	{tipo: "guardar_tabla", operacion:"GuardarTabla", icono: "fa fa-check", label: "Guardar Cambios", clase: "boton-tabla  mootools" }
];