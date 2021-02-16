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
      let(:not_correct_answer_question_option) { create(:question_option, question: question) }
      let(:user_answer) { create(:answer, user: student, question: question, answered_question_option_ids: [not_correct_answer_question_option.id]) }

      subject { user_answer.answer_matched? }

      it 'it should be wrong answer' do
        expect(subject).to eq(false)
      end
    end
  end

  describe 'validation of valid_question_option_ids' do
    let!(:student) { create(:user) }
    let!(:question) { create(:question) }
    let!(:another_question) { create(:question) }

    let(:question_option_of_other_question) { create(:question_option, question: another_question) }
    let(:answered_question_option_id) { question_option_of_other_question.id }

    before do
      @user_answer = Answer.new(user_id: student.id,
                                question_id: question.id,
                                answered_question_option_ids: [answered_question_option_id])
      @user_answer.valid?
    end

    context 'provided question option of other question' do
      it 'raises an error' do
        expect(@user_answer.errors.full_messages).to include('Answered question option ids answered question-option must be present in question')
      end
    end

    context 'provided question option of appropriate question' do
      let(:question_option_of_appropriate_question) { create(:question_option, question: question) }
      let(:answered_question_option_id) { question_option_of_appropriate_question.id }

      it 'should not raise validation error' do
        expect(@user_answer.errors.full_messages).to be_empty
      end
    end
  end
end
