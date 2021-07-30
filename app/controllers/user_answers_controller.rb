# frozen_string_literal: false

# create test and assign UserAnswer by rails stepper method are working and submit Answer
class UserAnswersController < ApplicationController
  def index
    session[:question_step] = session[:question_step] || 0
    if session[:timer] == ''
      session[:timer] = '01:00'
    else
      session[:timer] ||= '01:00'
    end
    # session[:timer] = session[:timer] || 60 * 5
    @step = session[:question_step]
    # Show questions by id's  like this [11,12,14,15,16]
    # @question = Question.where(id: [11,12,14,15,16])[session[:question_step]]
    test = Test.find session[:test_id]
    questions = test.get_questions
    @question = questions[session[:question_step]]
    @is_final_step = @step === questions.length - 1
    @user_answer = UserAnswer.find_or_initialize_by(test_id: test.id, question_id: @question.id)
    # @question = test.sample_questions[0]
    # @questions = Question.offset(rand(1..Question.length))[0..3]
    # @question = @questions.first
    @question.current_step = session[:question_step]
  end

  def create
    test = Test.find session[:test_id]
    @step = session[:question_step]
    # @question = Question.where(id: [11,12,14,15,16])[session[:question_step]]
    questions = test.get_questions
    @total_questions = questions.length
    @question = questions[session[:question_step]]
    @user_answer = UserAnswer.find_or_initialize_by(test_id: test.id, question_id: @question.id)
    if params.key?(:user_answer) && params[:user_answer].key?(:option_id)
      @user_answer.option_id = params[:user_answer][:option_id]
    end
    @is_final_step = @step === questions.length - 1
    if @user_answer.save
      session[:question_step] = session[:question_step] + 1
      @step = session[:question_step]
      if @is_final_step
        test.update_data
        session[:question_step] = 0
        redirect_to test_path(test)
      else
        redirect_to user_answers_path
      end
    else
      render :index
    end
  end

  def set_timer
    session[:timer] = params[:timer]
  end

  def back
    session[:question_step] = session[:question_step] - 1
    redirect_to user_answers_path
  end
end
