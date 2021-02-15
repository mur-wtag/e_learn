# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Question, type: :model do
  subject { create(:question) }

  describe 'associations' do
    it { should belong_to(:lesson) }
    it { should have_many(:question_options) }
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a content' do
    subject.content = nil
    expect(subject).to_not be_valid
  end
end