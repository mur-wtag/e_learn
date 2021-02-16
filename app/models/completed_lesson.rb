# frozen_string_literal: true

class CompletedLesson < ApplicationRecord
  belongs_to :user
  belongs_to :lesson

  def scored_marks
    lesson.questions.map do |question|
      user_answer = Answer.find_by(user_id: user.id, question_id: question.id)
      next 0 if user_answer.nil?

      correct_question_option_ids = question.question_options.correct_answer.ids.sort
      user_answered_question_option_ids = user_answer.answered_question_option_ids.map(&:to_i).sort

      correct_question_option_ids == user_answered_question_option_ids ? question.marks : 0
    end.sum
  end
end
