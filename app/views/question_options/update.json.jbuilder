# frozen_string_literal: true

json.question_option do |json|
  json.partial! 'question_options/question_option', question_option: @question_option
end
