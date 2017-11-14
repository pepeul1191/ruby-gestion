Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'accesos' => 'accesos/view#index'
  get 'accesos/sistema/listar' => 'accesos/sistema#listar'
end
