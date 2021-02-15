# frozen_string_literal: true

class UsersController < ApplicationController

  def show; end

  def update
    if current_user.update_attributes(user_params)
      render :show
    else
      render json: { errors: current_user.errors }, status: :unprocessable_entity
    end
  end

  def assign_role
    current_user.add_role params[:role].to_sym
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, role_ids: [])
  end
end