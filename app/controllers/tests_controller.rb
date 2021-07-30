# frozen_string_literal: false

class TestsController < ApplicationController
  before_action :validate_test_path

  def new
    @invalid_test = current_user.tests.length.positive? && current_user.tests.last.created_at && current_user.tests.last.created_at > (Time.zone.now + 90.days)
    @test = current_user.tests.new(status: 'Processing')
  end

  def show
    @mark_of_qusetion = 10
    @test = Test.find(params[:id])
    @user_answers = @test.user_answers
    @correct_answers = @user_answers.joins(:option).where(options: { correct_option: true }).count
  end

  def create
    @test = current_user.tests.new(status: 'processing', sample_questions: Test.get_random_questions)
    if @test.save
      session[:test_id] = @test.id
      redirect_to user_answers_path
    else
      render :new
    end
  end
end
