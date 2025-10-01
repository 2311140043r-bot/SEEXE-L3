Rails.application.routes.draw do
  root "tasks#index"
  resources :tasks  # 7アクション（index/new/create/show/edit/update/destroy）
end
