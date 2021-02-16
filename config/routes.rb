# frozen_string_literal: true

Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    devise_for :users, controllers: { sessions: :sessions }

    resource :user, only: %i[show update]
    resources :courses, only: %i[index create update show destroy] do
      resources :lessons, only: %i[index create update show destroy] do
        resources :questions, only: %i[index create update show destroy] do
          resources :question_options, only: %i[index create update show destroy]
        end
      end
    end

    post 'users/:user_id/questions/:question_id/answers', to: 'answers#create', as: :create_user_answer
    patch 'users/:user_id/questions/:question_id/answers/:id', to: 'answers#update', as: :update_user_answer
    get 'users/:user_id/questions/:question_id/answers/:id', to: 'answers#show', as: :user_answer

    get 'users/:user_id/completed_lessons', to: 'completed_lessons#index', as: :user_completed_lessons
    post 'users/:user_id/completed_lessons', to: 'completed_lessons#create', as: :create_user_completed_lessons
    get 'users/:user_id/completed_lessons/:id', to: 'completed_lessons#show', as: :user_completed_lesson
    delete 'users/:user_id/completed_lessons/:id', to: 'completed_lessons#destroy', as: :delete_user_completed_lesson
  end
end
