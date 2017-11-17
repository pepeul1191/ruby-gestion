var tablaAsociacion = new Grid();

var AsociacionView = Backbone.View.extend({
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
		   url: STATICS_URL + 'templates/agricultores/asociacion.html', 
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
		/*
		tablaAsociacion.BorrarTable();
   	var ajax_dao_asociacion = new AjaxPython(); 
   	ajax_dao_asociacion.Constructor("GET", BASE_URL + "accesos/usuario/listar", "", false);
   	tablaAsociacion.SetTableId("tablaAsociacion");
   	tablaAsociacion.SetTableObj("tablaAsociacion");
   	tablaAsociacion.SetTableHeader(usuario_array_json_th);
   	tablaAsociacion.SetTableBody(usuario_array_json_td, usuario_array_json_btn_td, ajax_dao_asociacion);
   	tablaAsociacion.SetTableFooter(usuario_array_json_btn, false);
   	tablaAsociacion.SetLabelMensaje("#txtMensajeRpta");
   	tablaAsociacion.SetURLGuardar(BASE_URL + "accesos/usuario/guardar");

   	tablaAsociacion.MostrarTable();
   	*/
	}
});
