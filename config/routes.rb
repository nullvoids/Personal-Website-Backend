Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
  get '/messages'  => 'messages#index'
  post '/messages' => 'messages#create'
  put  '/messages' => 'messages#update'
  patch '/messages' => 'messages#update'

  get '/projects' => 'project#index'
end
