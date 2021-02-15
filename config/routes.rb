# frozen_string_literal: true

Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    devise_for :users, controllers: { sessions: :sessions }

    resource :user, only: %i[show update]
    resources :courses, only: %i[index create update show destroy] do
      resources :lessons, only: %i[index create update show destroy]
    end
  end
end
