# frozen_string_literal: false

# create test and assign UserAnswer by rails stepper method are working and submit Answer
class UserAnswersController < ApplicationController
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
    test = Test.find session[:test_id]
    questions = test.get_questions
    # questions = Test.get_random_questions

    @question = questions[session[:question_step]]
    @is_final_step = @step === questions.length - 1
    @user_answer = UserAnswer.find_or_initialize_by(test_id: test.id, question_id: @question.id)
    @question.current_step = session[:question_step]
  end

  def create
    test = Test.find session[:test_id]

    @step = session[:question_step]
    #    questions = Test.get_random_questions
    questions = test.get_questions
    @total_questions = questions.length
    @question = questions[session[:question_step]]
    @user_answer = UserAnswer.find_or_initialize_by(test_id: test.id, question_id: @question.id)

    if params.key?(:user_answer)
      @user_answer.option_id = params[:user_answer][:option_id]
      @user_answer.text_content = params[:user_answer][:text_content]
      correct_options = []
      debugger
      correct_options = Option.where(question_id: @question.id, correct_option: 'true').ids

      @user_answer.correct_answer = correct_options == @user_answer.option_id ? 'true' : 'false'
      debugger
      @marks = if @question.SCQ?
                 1
               elsif 0 || @question.MCQ?
                 2
               elsif 0 || @question.TEXT?
                 3
               else
                 0 || @question.CODE? ? 5 : 0
               end
      debugger
      session[:max_marks] += @marks
      if @user_answer.correct_answer?
        session[:total_marks] += @marks
        debugger
      end

      debugger
      @is_final_step = @step === questions.length - 1

      if @user_answer.save
        session[:question_step] = session[:question_step] + 1
        @step = session[:question_step]
        debugger
        if @is_final_step

          score = session[:total_marks] * 100 / session[:max_marks]
          debugger
          Test.update(overall_score: score.to_f, status: 'Completed')

          # test.update_data
          session[:question_step] = 0
          session[:max_marks] = 0
          session[:total_marks] = 0
          debugger
          redirect_to test_path(test)
        else
          redirect_to user_answers_path

        end

      end
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
