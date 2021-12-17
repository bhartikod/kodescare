# frozen_string_literal: false

class Test < ApplicationRecord
  belongs_to :user
  has_many :user_answers, dependent: :destroy
  def self.get_random_questions
    questions = Question.where(active_question: 'true').limit(5).order('RANDOM()').uniq
    questions.map(&:id)
  end

  def self.get_level(object)
    debugger
    level = object.level

    @questions = Question.send(level)
    # Check difference b/q sample and take

    @test_questions = []
    @test_questions << @questions.SCQ.take(object.scq)
    @test_questions << @questions.MCQ.take(object.mcq)
    @test_questions << @questions.CODE.take(object.code)
    @test_questions << @questions.TEXT.take(object.text)

    return @test_questions.flatten.compact.map(&:id)
    debugger

    # ques_scq = Question.where(question_type: "SCQ",level_id: object.level).take(object.scq)
    # ques_mcq = Question.where(question_type: "MCQ",level_id: object.level).take(object.mcq)
    # ques_code = Question.where(question_type: "CODE",level_id: object.level).take(object.code)
    # ques_text = Question.where(question_type: "TEXT",level_id: object.level).take(object.text)
    # total_ques = ques_scq + ques_mcq + ques_code + ques_text
    # debugger
    # return total_ques.map(&:id)
    # debugger
  end

  # for Questions (User_answers controller)
  def get_questions
    Question.find(sample_questions)
  end

  # This methos used to update correct_answers and overall_score assign TEST table/ model (User_answers controller)
  # def update_data
  #   mark_of_qusetion = 10
  #   correct_answers = user_answers.joins(:option).where(options: { correct_option: true }).count
  #   socre = correct_answers * mark_of_qusetion
  #   update(correct_answers: correct_answers, overall_score: socre, status: 'Completed')
  # end
end
