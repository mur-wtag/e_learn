# frozen_string_literal: true

require 'rails_helper'

RSpec.describe QuestionOption, type: :model do
  subject { create(:question_option) }

  describe 'associations' do
    it { should belong_to(:question) }
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a content' do
    subject.content = nil
    expect(subject).to_not be_valid
  end
end
