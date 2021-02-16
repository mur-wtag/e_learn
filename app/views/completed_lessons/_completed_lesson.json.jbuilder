# frozen_string_literal: true

json.call(completed_lesson, :id, :user_id, :lesson_id)
json.obtained_marks completed_lesson.scored_marks
