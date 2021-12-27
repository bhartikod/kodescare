# frozen_string_literal: false

class TestsController < ApplicationController
  before_action :validate_test_path

  def new
    #@invalid_test = current_user.tests.length.positive? && current_user.tests.last.created_at < (Time.zone.now + 90.days)
    @test = current_user.tests.new(status: 'Processing')
    @testfors = TestFor.all
  end

  def show
    @test = Test.find(params[:id])
  end

  def create
    @testfor = TestFor.find_by(level: params[:test][:status])    
    @test = current_user.tests.new(status: 'processing', sample_questions: Test.get_random_questions(@testfor))  
    if @test.save
      session[:test_id] = @test.id
      redirect_to user_answers_path
    else
      render :new
    end
  end
end
