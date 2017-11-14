Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'accesos' => 'accesos/view#index'
  get 'accesos/sistema/listar' => 'accesos/sistema#listar'
  get 'accesos/usuario/obtener_usuario_correo/:usuario_id' => 'accesos/usuario#obtener_usuario_correo'
  get 'accesos/usuario/logs/:usuario_id' => 'accesos/usuario#logs'
end
