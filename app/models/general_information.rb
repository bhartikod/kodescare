# frozen_string_literal: false

class GeneralInformation < ApplicationRecord
  belongs_to :user
  attr_accessor :current_step

  def courses
    { '1': 'Full Stack Web Web Development', '2': 'Web Designing' }
  end

  def current_step
    @current_step || steps.first
  end

  def steps
    %w[program info]
  end

  def next_step
    self.current_step = steps[steps.index(current_step) + 1]
  end

  def previous_step
    self.current_step = steps[steps.index(current_step) - 1]
  end

  def second_step?
    current_step === steps[1]
  end

  # def first_step?
  #   current_step === steps.first
  # end

  # def is_registration_step?
  #   current_step === steps.second
  # end

  # def last_step?
  #   current_step == steps.last
  # end
end
