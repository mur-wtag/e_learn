# frozen_string_literal: true

class CoursesController < ApplicationController
  load_and_authorize_resource

  def index; end

  def create
    if @course.save
      render :create
    else
      render json: { errors: @course.errors }
    end
  end

  def update
    if @course.update(course_params)
      render :update
    else
      render json: { errors: @course.errors }
    end
  end

  def destroy
    @course.destroy
  end

  private

  def course_params
    params.require(:course).permit(:name)
  end
end