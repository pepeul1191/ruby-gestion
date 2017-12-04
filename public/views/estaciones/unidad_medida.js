var tablaUnidadMedida = new Grid();

var UnidadMedidaView = Backbone.View.extend({
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
		   url: STATICS_URL + 'templates/estaciones/unidad_medida.html', 
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
		var ajax_unidad_medida = new AjaxPython(); 
		ajax_unidad_medida.Constructor("GET", BASE_URL + "estaciones/unidad_medida/listar", "", false);
		tablaUnidadMedida.BorrarTable();

   	tablaUnidadMedida.SetTableId("tablaUnidadMedida");
		tablaUnidadMedida.SetTableObj("tablaUnidadMedida");
		tablaUnidadMedida.SetTableHeader(unidad_medida_array_json_th);
		tablaUnidadMedida.SetTableBody(unidad_medida_array_json_td, unidad_medida_array_json_btn_td, ajax_unidad_medida);
		tablaUnidadMedida.SetTableFooter(unidad_medida_array_json_btn, false);
		tablaUnidadMedida.SetLabelMensaje("#txtMensajeRpta");
		tablaUnidadMedida.SetURLGuardar(BASE_URL + "estaciones/unidad_medida/guardar");

		tablaUnidadMedida.MostrarTable();
	}
});