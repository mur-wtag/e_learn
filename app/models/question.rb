# frozen_string_literal: true

class Question < ApplicationRecord
  MAXIMUM_NUMBER_OF_QUESTIONS = 10

  belongs_to :lesson
  has_many :question_options, dependent: :destroy
  has_many :answers, dependent: :destroy

  validates :content, :question_type, presence: true
  validate :maximum_number_of_question_to_lesson

  enum question_type: %i[mcq standard]

  private

  def maximum_number_of_question_to_lesson
    return unless lesson
    return if lesson.questions.count < MAXIMUM_NUMBER_OF_QUESTIONS

    errors.add(:base, "A lesson can't have more than #{MAXIMUM_NUMBER_OF_QUESTIONS} questions")
  end
end
