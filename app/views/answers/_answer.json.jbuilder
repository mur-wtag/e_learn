# frozen_string_literal: true

json.call(answer, :id, :user_id, :question_id, :answered_question_option_ids)
json.answer_matched answer.answer_matched?
