# frozen_string_literal: true

class LessonsController < ApplicationController
  load_and_authorize_resource :course
  load_and_authorize_resource :lesson, through: :course

  def index; end

  def create
    if @lesson.save
      render :create
    else
      render json: { errors: @lesson.errors }
    end
  end

  def update
    if @lesson.update(lesson_params)
      render :update
    else
      render json: { errors: @lesson.errors }
    end
  end

  def destroy
    @lesson.destroy
  end

  private

  def lesson_params
    params.require(:lesson).permit(:name, :content)
  end
end