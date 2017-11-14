Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'accesos' => 'accesos/view#index'
  get 'accesos/item/listar/:subtitulo_id' => 'accesos/item#listar'
  post 'accesos/item/guardar' => 'accesos/item#guardar'
  get 'accesos/modulo/listar/:sistema_id' => 'accesos/modulo#listar'
  post 'accesos/modulo/guardar' => 'accesos/modulo#guardar'
  post 'accesos/permiso/guardar' => 'accesos/permiso#guardar'
  get 'accesos/permiso/listar/:sistema_id' => 'accesos/permiso#listar'
  get 'accesos/permiso/listar_asociados/:sistema_id/:rol_id' => 'accesos/permiso#listar_asociados'
  get 'accesos/rol/listar/:sistema_id' => 'accesos/rol#listar'
  post 'accesos/rol/guardar' => 'accesos/rol#guardar'
  post 'accesos/rol/asociar_permisos' => 'accesos/rol#asociar_permisos'
  get 'accesos/sistema/listar' => 'accesos/sistema#listar'
  post 'accesos/sistema/guardar' => 'accesos/sistema#guardar'
  get 'accesos/subtitulo/listar/:modulo_id' => 'accesos/subtitulo#listar'
  post 'accesos/subtitulo/guardar' => 'accesos/subtitulo#guardar'
  get 'accesos/usuario/listar' => 'accesos/usuario#listar'
  get 'accesos/usuario/listar_sistemas/:usuario_id' => 'accesos/sistema#usuario'
  get 'accesos/usuario/logs/:usuario_id' => 'accesos/usuario#logs'
  get 'accesos/usuario/listar_roles/:sistema_id/:usuario_id' => 'accesos/usuario#listar_roles'
  get 'accesos/usuario/listar_permisos/:sistema_id/:usuario_id' => 'accesos/usuario#listar_permisos'
  get 'accesos/usuario/obtener_usuario_correo/:usuario_id' => 'accesos/usuario#obtener_usuario_correo'
end
