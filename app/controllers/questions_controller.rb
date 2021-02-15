# frozen_string_literal: true

class QuestionsController < ApplicationController
  load_and_authorize_resource :course
  load_and_authorize_resource :lesson, through: :course
  load_and_authorize_resource :question, through: :lesson

  def index; end

  def create
    if @question.save
      render :create
    else
      render json: { errors: @question.errors }
    end
  end

  def update
    if @question.update(question_params)
      render :update
    else
      render json: { errors: @question.errors }
    end
  end

  def destroy
    @question.destroy
  end

  private

  def question_params
    params.require(:question).permit(:content, :question_type)
  end
end