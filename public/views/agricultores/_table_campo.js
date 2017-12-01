var campo_array_json_th = [
	{titulo:"id", index: "id", estilos:"width: 10px; display:none;"},
	{titulo:"Nombre",index:"nombre",estilos:"width: 100px;"},
	{titulo:"Area",index:"area",estilos:"width: 50px;"},
	{titulo:"Distrito",index:"distrito_id",estilos:"width: 280px;"},
	{titulo:"ImagenId",index:"imagen_id",estilos:"display:none"},
	{titulo:"Botones",index:"NA",estilos:"width: 130px;"}
];

var campo_array_json_td = [
	{tipo:"label_id",estilos:"color: blue; display:none", index:"id", edicion:""},
	{tipo:"text",estilos:"width:100px;", index:"nombre", edicion:""},
	{tipo:"text",estilos:"width:50px;", index:"area", edicion:""},
  {tipo:"autocomplete",estilos:"width:280px;", index:"distrito", edicion:"",  url: BASE_URL  + "maestros/distrito/buscar?distrito=", llave: "id", valor: "nombre", formato_carga:{llave: "distrito_id", valor: "distrito"}},
  {tipo:"label_id",estilos:"color: blue; display:none", index:"imagen_id", edicion:""},
	{tipo:"botones", index:"botones", edicion:"true", estilos:"width: 130px;"}
];

var campo_array_json_btn_td = [
	{clase:"fa fa-picture-o",url:"",alt:"Seleccionar archivo",estilos:"padding-left: 5px;", operacion:"SeleccionarArchivoFila"},
	{clase:"fa fa-cloud-upload",url:"",alt:"Subir archivo",estilos:"padding-left: 5px;", operacion:"SubirArchivoFila", url: BASE_URL + "agricultores/campo/subir_foto", validacion: {'extensiones':["image/jpeg", "image/jpg", "image/png"], 'tamanio': 30700}, 'td_archivo_id': 4},
	{clase:"fa fa-search",url:"",alt:"Ver archivo",estilos:"padding-left: 5px;", operacion:"VerArchivoTab", 'td_archivo_id': 4, 'url': BASE_URL + 'agricultores/campo/obtener_ruta_foto/'},
  {clase:"fa fa-times",url:"",alt:"Eliminar asociación",estilos:"padding-left: 5px;", operacion:"QuitarFila"},
]; 

var campo_array_json_btn = [
	{tipo: "agrega_fila", operacion:"AgregarFila", icono: "fa fa-plus", label: "Agregar Registro", clase: "boton-tabla  mootools"},
	{tipo: "guardar_tabla", operacion:"GuardarTabla", icono: "fa fa-check", label: "Guardar Cambios", clase: "boton-tabla  mootools" }
];