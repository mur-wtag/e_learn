# frozen_string_literal: true

class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :completed_lessons, dependent: :destroy
  has_many :lessons, through: :completed_lessons

  validates :email, presence: true
  enum role: %i[admin student teacher]
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :student
  end

  def admin?
    has_role? :admin
  end

  def generate_jwt
    JWT.encode({ id: id, exp: 60.days.from_now.to_i }, Rails.application.secrets.secret_key_base)
  end
end
