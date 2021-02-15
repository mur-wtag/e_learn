# frozen_string_literal: true

class Course < ApplicationRecord
  validates :name, presence: true

  def to_s
    name
  end
end
