# frozen_string_literal: false

class Option < ApplicationRecord
  belongs_to :question
  has_many :user_answers, dependent: :destroy
  enum question_type: { SCQ: 0, MCQ: 1, TEXT: 2 }
  def set_correct_option; end
end
