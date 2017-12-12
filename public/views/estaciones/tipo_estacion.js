var tablaTipoEstacion = new Grid();

var TipoEstacionView = Backbone.View.extend({
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
		   url: STATICS_URL + 'templates/estaciones/tipo_estacion.html', 
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
		var ajax_tipo_estacion = new AjaxPython(); 
		ajax_tipo_estacion.Constructor("GET", BASE_URL + "estaciones/tipo_estacion/listar", "", false);
		tablaTipoEstacion.BorrarTable();

   	tablaTipoEstacion.SetTableId("tablaTipoEstacion");
		tablaTipoEstacion.SetTableObj("tablaTipoEstacion");
		tablaTipoEstacion.SetTableHeader(tipo_estacion_array_json_th);
		tablaTipoEstacion.SetTableBody(tipo_estacion_array_json_td, tipo_estacion_array_json_btn_td, ajax_tipo_estacion);
		tablaTipoEstacion.SetTableFooter(tipo_estacion_array_json_btn, false);
		tablaTipoEstacion.SetLabelMensaje("#txtMensajeRpta");
		tablaTipoEstacion.SetURLGuardar(BASE_URL + "estaciones/tipo_estacion/guardar");

		tablaTipoEstacion.MostrarTable();
	}
});