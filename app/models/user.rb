# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :general_information
  has_many :tests, dependent: :destroy
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  after_create :user_mailer

  def user_mailer; end
end
