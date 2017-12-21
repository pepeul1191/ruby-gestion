var tablaEstaciones = new Grid();

var SensoresView = Backbone.View.extend({
	el: '#workspace',
	initialize: function(){
		//this.render();
		//console.log("initialize");
	},
	render: function() {
		this.$el.html(this.getTemplate());
		return this;
	},
	getTemplate: function() {
		var data = { };
		var template_compiled = null;
		$.ajax({
		   url: STATICS_URL + 'templates/estaciones/sensores.html', 
		   type: "GET", 
		   async: false, 
		   success: function(source) {
		   	var template = Handlebars.compile(source);
		   	template_compiled = template(data);
		   }
		});
		return template_compiled;
	},
	mostrarTabla: function(){
		tablaEstaciones.BorrarTable();
   	var ajax_dao_responsable = new AjaxPython(); 
   	ajax_dao_responsable.Constructor("GET", BASE_URL + "estaciones/estacion/listar", "", false);
   	tablaEstaciones.SetTableId("tablaEstaciones");
   	tablaEstaciones.SetTableObj("tablaEstaciones");
   	tablaEstaciones.SetTableHeader(estacion_array_json_th);
   	tablaEstaciones.SetTableBody(estacion_array_json_td, estacion_array_json_btn_td, ajax_dao_responsable);
   	tablaEstaciones.SetTableFooter(estacion_array_json_btn, false);
   	tablaEstaciones.SetLabelMensaje("#txtMensajeRpta");
   	tablaEstaciones.SetURLGuardar(BASE_URL + "agricultores/responsable/guardar");

   	tablaEstaciones.MostrarTable();
	}
});