# frozen_string_literal: true

class AnswersController < ApplicationController
  load_and_authorize_resource

  def create
    @answer = Answer.new(answer_params.merge(user_id: @current_user_id))

    if @answer.save
      render :create
    else
      render json: { errors: @answer.errors }
    end
  end

  def show; end

  def update
    if @answer.update(answer_params)
      render :update
    else
      render json: { errors: @answer.errors }
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:question_id, :content, answered_question_option_ids: [])
  end
end