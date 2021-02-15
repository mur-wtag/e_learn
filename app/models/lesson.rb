# frozen_string_literal: true

class Lesson < ApplicationRecord
  belongs_to :course
  has_many :questions, dependent: :destroy

  validates :name, presence: true

  def to_s
    name
  end
end
