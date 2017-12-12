var Router = Marionette.AppRouter.extend({
    routes: {
        "" : "index", 
        "ubicaciones" : "ubicacionIndex",
        "unidad_medida" : "unidadMedidaIndex",
        "tipo_estacion" : "tipoEstacionIndex",
        "*actions" : "index"
    },
    ubicacionIndex: function(){
        var ubicacionView = new UbicacionView({});
        ubicacionView.render();
        ubicacionView.mostrarTabla();
    },
    unidadMedidaIndex: function(){
        var unidadMedidaView = new UnidadMedidaView({});
        unidadMedidaView.render();
        unidadMedidaView.mostrarTabla();
    },
    tipoEstacionIndex: function(){
        var tipoEstacionView = new TipoEstacionView({});
        tipoEstacionView.render();
        tipoEstacionView.mostrarTabla();
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