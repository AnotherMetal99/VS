Rails.application.routes.draw do
  resources :lab_reports do
    resources :marks
  end

  root 'lab_reports#index'
end
