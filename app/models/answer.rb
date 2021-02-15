# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  def to_s
    content.presence || question_option.to_s
  end

  def answer_matched?
    return false if answered_question_option_ids.blank?

    question.question_options.where(correct_answer: true).ids.sort == answered_question_option_ids.map(&:to_i).sort
  end
end
