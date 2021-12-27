# frozen_string_literal: true

class UserAnswer < ApplicationRecord
  belongs_to :test
  belongs_to :question
end
