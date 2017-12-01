var Router = Marionette.AppRouter.extend({
    routes: {
        "" : "index", 
        "responsable" : "responsableIndex",
        "asociacion" : "asociacionIndex",
        "asociacion/campos/:asociacion_id" : "asociacionCampo", 
        "asociacion/estaciones/:asociacion_id" : "asociacionEstacion", 
        "*actions" : "index"
    },
    responsableIndex: function(){
        var responsableView = new ResponsableView({});
        responsableView.render();
        responsableView.mostrarTabla();
    },
    asociacionIndex: function(){
        var asociacionView = new AsociacionView({});
        asociacionView.render();
        asociacionView.mostrarTabla();
    },
    asociacionCampo: function(asociacion_id){
        var campoView = new CampoView({});
        campoView.render();
        $("#txtIdeAsociacion").html(asociacion_id);
        campoView.mostrarTabla(asociacion_id);
    },
    asociacionEstacion: function(asociacion_id){
        var estacionView = new EstacionView({});
        estacionView.render(asociacion_id);
        $("#txtIdeAsociacion").html(asociacion_id);
        campoView.mostrarTabla(asociacion_id);
    },
});
    
var App = Marionette.Application.extend({
    region: '#body-app',
    onStart() {
        var router = new Router();
        Backbone.history.start();
    }
});

var myApp = new App();
myApp.start();