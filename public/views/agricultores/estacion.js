var EstacionView = Backbone.View.extend({
	el: '#modal-container',
	initialize: function(){
		//this.render();
		//console.log("initialize");
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
});
