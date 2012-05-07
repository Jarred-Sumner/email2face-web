Email2faceWeb::Application.routes.draw do
  resources :faces
  root :to => 'faces#index'
  match '/find' => 'faces#find'
end
