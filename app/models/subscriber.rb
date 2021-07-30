# frozen_string_literal: false

class Subscriber < ApplicationRecord
  validates :email, presence: true
end
