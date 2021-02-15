# frozen_string_literal: true

require 'rails_helper'

describe Ability do
  context 'to manage courses' do
    describe 'by signing in as admin' do
      let(:admin) { create(:admin) }
      subject(:ability) { Ability.new(admin) }

      it { should be_able_to(:manage, Course) }
    end

    describe 'by signing in as student' do
      let(:student) { create(:user) }
      subject(:ability) { Ability.new(student) }

      it { should_not be_able_to(:create, Course) }
      it { should_not be_able_to(:update, Course) }
      it { should_not be_able_to(:destroy, Course) }
      it { should be_able_to(:read, Course) }
    end

    describe 'by signing in as teacher' do
      let(:teacher) { create(:teacher) }
      subject(:ability) { Ability.new(teacher) }

      it { should_not be_able_to(:create, Course) }
      it { should_not be_able_to(:update, Course) }
      it { should_not be_able_to(:destroy, Course) }
      it { should be_able_to(:read, Course) }
    end

    describe 'without signing in' do
      subject(:ability) { Ability.new(nil) }

      it { should_not be_able_to(:cud, Course) }
      it { should be_able_to(:read, Course) }
    end
  end
end