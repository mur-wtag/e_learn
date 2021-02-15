# frozen_string_literal: true

class Lesson < ApplicationRecord
  belongs_to :course

  validates :name, presence: true

  def to_s
    name
  end
end
