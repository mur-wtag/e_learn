# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Lesson, type: :model do
  subject { create(:lesson) }

  describe 'associations' do
    it { should belong_to(:course) }
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end