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

  describe 'validation of maximum number of questions to the lesson' do
    let(:lesson) { create(:lesson) }

    context 'created more than 10 question' do
      before do
        create_list(:question, 10, lesson: lesson)
        @question = Question.new(lesson_id: lesson.id, content: 'some text')
        @question.valid?
      end

      it 'raises an error' do
        expect(@question.errors.full_messages).to include("A lesson can't have more than 10 questions")
      end
    end

    context 'created less than 10 question' do
      before do
        create_list(:question, 9, lesson: lesson)
        @question = Question.new(lesson_id: lesson.id, content: 'some text')
        @question.valid?
      end

      it 'should not raise validation error' do
        expect(@question.errors.full_messages).to be_empty
      end
    end
  end
end
