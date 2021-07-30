# frozen_string_literal: false

class Test < ApplicationRecord
  belongs_to :user
  has_many :user_answers, dependent: :destroy

  def self.get_random_questions
    questions = Question.limit(100).order('RANDOM()').uniq
    questions.map(&:id)
  end

  # for Questions (User_answers controller)
  def get_questions
    Question.where(id: sample_questions)
  end

  # This methos used to update correct_answers and overall_score assign TEST table/ model (User_answers controller)
  def update_data
    mark_of_qusetion = 10
    correct_answers = user_answers.joins(:option).where(options: { correct_option: true }).count
    socre = correct_answers * mark_of_qusetion
    update(correct_answers: correct_answers, overall_score: socre, status: 'Completed')
  end
end
