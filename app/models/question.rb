# frozen_string_literal: false

class Question < ApplicationRecord
  has_many :options, dependent: :destroy
  has_many :user_answers, dependent: :destroy

  # Using Enum
  enum question_type: { SQC: 1, MQC: 2, TEXT: 3 }
  enum level_id: { Beginner: 1, Competent: 2, Proficient: 3, Expert: 4 }

  attr_accessor :current_step

  # this method calling for RailsAdmin
  def set_active_question; end

  def current_step
    @current_step || 0
  end
end
