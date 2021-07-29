Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Development mode views
  if Rails.env.development? || Rails.env.test?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  devise_for :users
end
