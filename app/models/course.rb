# frozen_string_literal: true

class Course < ApplicationRecord
  has_many :lessons, dependent: :destroy

  validates :name, presence: true

  def to_s
    name
  end
end
