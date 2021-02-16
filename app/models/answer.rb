# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  # user can write answer for a specific question for once
  validates :user_id, uniqueness: { scope: :question_id }
  validate :valid_question_option_ids

  def to_s
    content.presence || question.question_options.where(id: answered_question_option_ids).map(&:to_s).join(', ')
  end

  def answer_matched?
    return false if answered_question_option_ids.blank?

    question.question_options.where(correct_answer: true).ids.sort == answered_question_option_ids.map(&:to_i).sort
  end

  private

  def valid_question_option_ids
    return if answered_question_option_ids.blank?
    return if (answered_question_option_ids.map(&:to_i) - question&.question_options&.ids).blank?

    errors.add(:answered_question_option_ids, 'answered question-option must be present in question')
  end
end
