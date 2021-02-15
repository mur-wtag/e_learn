# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject { create(:user) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end
end