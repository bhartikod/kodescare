# frozen_string_literal: false

class Option < ApplicationRecord
  belongs_to :question
  # has_many :user_answers, dependent: :destroy
  enum question_type: { SCQ: 1, MCQ: 2, TEXT: 3 }
  def set_correct_option; end
end
