# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Answer, type: :model do
  subject { create(:answer) }

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:question) }
  end

  describe '#answer_matched?' do
    let!(:student) { create(:user) }
    let!(:question) { create(:question) }

    context 'user answered correctly' do
      let!(:question_option) { create(:correct_question_option, question: question) }
      let(:user_answer) { create(:answer, user: student, question: question, answered_question_option_ids: [question_option.id]) }

      subject { user_answer.answer_matched? }

      it 'it should be correct answer' do
        expect(subject).to eq(true)
      end
    end

    context 'user answered wrongly' do
      let(:not_correct_answer_question_option) { create(:question_option) }
      let(:user_answer) { create(:answer, user: student, question: question, answered_question_option_ids: [not_correct_answer_question_option.id]) }

      subject { user_answer.answer_matched? }

      it 'it should be wrong answer' do
        expect(subject).to eq(false)
      end
    end
  end
end
