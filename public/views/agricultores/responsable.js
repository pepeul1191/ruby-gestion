var tablaResponsable = new Grid();

var ResponsableView = Backbone.View.extend({
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
		   url: STATICS_URL + 'templates/agricultores/responsable.html', 
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
		tablaResponsable.BorrarTable();
   	var ajax_dao_responsable = new AjaxPython(); 
   	ajax_dao_responsable.Constructor("GET", BASE_URL + "agricultores/responsable/listar", "", false);
   	tablaResponsable.SetTableId("tablaResponsable");
   	tablaResponsable.SetTableObj("tablaResponsable");
   	tablaResponsable.SetTableHeader(responsable_array_json_th);
   	tablaResponsable.SetTableBody(responsable_array_json_td, responsable_array_json_btn_td, ajax_dao_responsable);
   	tablaResponsable.SetTableFooter(responsable_array_json_btn, false);
   	tablaResponsable.SetLabelMensaje("#txtMensajeRpta");
   	tablaResponsable.SetURLGuardar(BASE_URL + "agricultores/responsable/guardar");

   	tablaResponsable.MostrarTable();
	}
});
