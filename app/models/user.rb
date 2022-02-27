class User < ApplicationRecord
  # encrypt password
  has_secure_password

  # Model associations
  has_many :todos, :dependent => :destroy, foreign_key: :created_by
  # Validations
  validates_presence_of :name, :email, :password_digest

  # Making each user unique
  validates :name, presence: true
  validates :name, uniqueness: {message: "Name has already been taken"}
end