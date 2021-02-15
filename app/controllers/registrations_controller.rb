# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController

  def create
    user = User.create(email: params[:email], password: params[:password])
    sign_in(user)
  end
end