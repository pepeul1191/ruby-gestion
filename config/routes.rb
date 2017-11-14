Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'accesos' => 'accesos/view#index'
  get 'accesos/modulo/listar/:sistema_id' => 'accesos/modulo#listar'
  get 'accesos/permiso/listar/:sistema_id' => 'accesos/permiso#listar'
  get 'accesos/sistema/listar' => 'accesos/sistema#listar'
  get 'accesos/usuario/listar' => 'accesos/usuario#listar'
  get 'accesos/usuario/logs/:usuario_id' => 'accesos/usuario#logs'
  get 'accesos/usuario/obtener_usuario_correo/:usuario_id' => 'accesos/usuario#obtener_usuario_correo'
end
