# frozen_string_literal: false

class Test < ApplicationRecord
  belongs_to :user
  has_many :user_answers, dependent: :destroy
  

  def self.get_random_questions(object)
    level = object.level
    @questions = Question.send(level)
    @test_questions = []
    @test_questions << @questions.SCQ.take(object.scq)
    @test_questions << @questions.MCQ.take(object.mcq)
    @test_questions << @questions.CODE.take(object.code)
    @test_questions << @questions.TEXT.take(object.text)

    return @test_questions.flatten.compact.map(&:id)
  end

  def get_questions
    Question.find(sample_questions)
  end
end
