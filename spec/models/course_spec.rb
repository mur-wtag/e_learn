# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Course, type: :model do
  subject { create(:course) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end