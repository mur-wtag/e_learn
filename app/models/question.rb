# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :lesson
  has_many :question_options, dependent: :destroy
  has_many :answers, dependent: :destroy

  validates :content, :question_type, presence: true

  enum question_type: %i[mcq standard]
end
