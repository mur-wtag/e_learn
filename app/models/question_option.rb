# frozen_string_literal: true

class QuestionOption < ApplicationRecord
  belongs_to :question

  validates :content, presence: true

  scope :correct_answer, -> { where(correct_answer: true) }

  def to_s
    content
  end
end
