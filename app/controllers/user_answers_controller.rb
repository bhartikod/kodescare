# frozen_string_literal: false

class UserAnswersController < ApplicationController
  before_action :set_test
  def index
    session[:question_step] = session[:question_step] || 0
    session[:total_marks] = session[:total_marks] || 0
    session[:max_marks] = session[:max_marks] || 0
    if session[:timer] == ''
      session[:timer] = '01:00'
    else
      session[:timer] ||= '01:00'
    end

    @step = session[:question_step]
    questions = @test.get_questions
    @question = questions[session[:question_step]]
    @is_final_step = @step === questions.length - 1
    @user_answer = UserAnswer.find_or_initialize_by(test_id: @test.id, question_id: @question.id)
    @question.current_step = session[:question_step]
    
  end

  def create
    @step = session[:question_step]
    questions = @test.get_questions
    @total_questions = questions.length
    @question = questions[session[:question_step]]
    @user_answer = UserAnswer.find_or_initialize_by(test_id: @test.id, question_id: @question.id)
    if params.key?(:user_answer)
      @user_answer.option_id = params[:user_answer][:option_id]
      @user_answer.text_content = params[:user_answer][:text_content]
      correct_options = []
      correct_options = @question.options.correct.ids

      @user_answer.correct_answer = correct_options == @user_answer.option_id
    end
    @marks = helpers.question_marks(@question)

      session[:max_marks] += @marks
    
      if @user_answer.correct_answer?
        session[:total_marks] += @marks
      else
        session[:total_marks] += 0
      end
      
      @is_final_step = @step === questions.length - 1

      if @user_answer.save
        session[:question_step] = session[:question_step] + 1
        @step = session[:question_step]
        if @is_final_step
          score = session[:total_marks] * 100 / session[:max_marks]
          @user_answer.test.update(overall_score: score, status: 'Completed')
          session[:question_step] = 0
          session[:max_marks] = 0
          session[:total_marks] = 0
          redirect_to test_path(@test)
        else
          redirect_to user_answers_path
        end
      end
  end
  
  def set_test
    @test = Test.find session[:test_id]
  end

   def set_timer
    session[:timer] = params[:timer]
   end

  def back
    session[:question_step] = session[:question_step] - 1
    redirect_to user_answers_path
  end

end



