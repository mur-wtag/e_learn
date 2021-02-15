# frozen_string_literal: true

class QuestionOptionsController < ApplicationController
  load_and_authorize_resource :course
  load_and_authorize_resource :lesson, through: :course
  load_and_authorize_resource :question, through: :lesson
  load_and_authorize_resource :question_option, through: :question

  def index; end

  def create
    if @question_option.save
      render :create
    else
      render json: { errors: @question_option.errors }
    end
  end

  def update
    if @question_option.update(question_option_params)
      render :update
    else
      render json: { errors: @question_option.errors }
    end
  end

  def destroy
    @question_option.destroy
  end

  private

  def question_option_params
    params.require(:question_option).permit(:content, :correct_answer)
  end
end