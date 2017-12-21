var tablaEstacionesCampo = new Grid();

var EstacionView = Backbone.View.extend({
	el: '#modal-container',
	initialize: function(){
		//this.render();
		//console.log("initialize");
	},
	events: {
	    "change #cbmCampos": "cargarEstaciones", 
	},
	render: function(asociacion_id) {
		$("#btnModal").click(); 
		var context = this.getCampos(asociacion_id);
		if(context == null){
			window.location.replace(BASE_URL + "error/access/404");
		}
		this.$el.html(this.getTemplate());
		var source = $("#estacion-template").html();
		var template = Handlebars.compile(source);
		var html = template(context);
		this.$el.html(html);
	},
	getTemplate: function() {
		var data = { };
		var template = null;
		$.ajax({
		   url: STATICS_URL + 'templates/agricultores/estacion.html', 
		   type: "GET", 
		   async: false, 
		   success: function(source) { 
			   template = source
		   }
		});
		return template;
	},
	mostrarTabla: function(asociacion_id){
		var array_extra_data_campo = [
			{tipo: "label", llave: "asociacion_id", id : "txtIdeAsociacion"}
		];	
	},
	getCampos: function(asociacion_id){
		var campos_json = { };
		$.ajax({
		   url: BASE_URL + 'agricultores/campo/listar/' + asociacion_id, 
		   type: "GET", 
		   async: false, 
		   success: function(data) {
		   		if (data == "null"){
		   			campos_json = null;
		   		}else{
		   			campos_json = JSON.parse(data);
		   		}
		   }
		});
		var rpta = [];
		for(var i = 0; i < campos_json.length; i++){
			var temp = {id:campos_json[i]['id'], nombre:campos_json[i]['nombre']};
			rpta.push(temp);
		}
		return {campos:rpta};
	},
	cargarEstaciones: function(event) {
		var campo_id = $(event.currentTarget).val();
		$('#txtIdeCampo').html(campo_id);

		if(campo_id == 'E'){
			$("#txtMensajeRptaModal").addClass("color-rojo");
			$("#txtMensajeRptaModal").removeClass("oculto");
     	$("#txtMensajeRptaModal").html("Debe seleccionar un campo para poder continuar");
		}else{
			$("#txtMensajeRptaModal").removeClass("color-rojo");
			$("#txtMensajeRptaModal").addClass("oculto");
     	$("#txtMensajeRptaModal").html("");

			tablaEstacionesCampo.BorrarTable();
			var ajax_dao_campo_estacion = new AjaxPython(); 
			ajax_dao_campo_estacion.Constructor("GET", BASE_URL + "agricultores/campo/estacion/" + campo_id , "", false);

			tablaEstacionesCampo.SetTableId("tablaEstacionesCampo");
			tablaEstacionesCampo.SetTableObj("tablaEstacionesCampo");
			tablaEstacionesCampo.SetTableHeader(campo_estacion_array_json_th);
			tablaEstacionesCampo.SetTableBody(campo_estacion_array_json_td, campo_estacion_array_json_btn_td, ajax_dao_campo_estacion);
			tablaEstacionesCampo.SetTableFooter(campo_estacion_array_json_btn, false);
			tablaEstacionesCampo.SetURLGuardar(BASE_URL + "estaciones/estacion/guardar");
			tablaEstacionesCampo.SetExtraData(array_extra_data_tabla_estacion);
			tablaEstacionesCampo.SetLabelMensaje("#txtMensajeRptaModal");
           
      tablaEstacionesCampo.MostrarTable();
		}
	}, 
});
