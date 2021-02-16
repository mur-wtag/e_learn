# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CompletedLesson, type: :model do
  subject { create(:completed_lesson) }

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:lesson) }
  end
end