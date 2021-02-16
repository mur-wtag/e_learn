# frozen_string_literal: true

class CompletedLessonsController < ApplicationController
  load_and_authorize_resource :user
  load_and_authorize_resource :completed_lesson, through: :user

  def index; end

  def create
    if @completed_lesson.save
      render :create
    else
      render json: { errors: @completed_lesson.errors }
    end
  end

  def show; end

  def destroy
    @completed_lesson.destroy
  end

  private

  def completed_lesson_params
    params.require(:completed_lesson).permit(:lesson_id)
  end
end