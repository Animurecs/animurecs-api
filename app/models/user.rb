class User < ApplicationRecord
  devise :confirmable,
    :database_authenticatable,
    :lockable,
    :registerable,
    :recoverable,
    :rememberable,
    :trackable,
    :validatable

  validates :email,
    presence: true,
    format: {
      with: /\A.*@.*\..*\z/,
      message: "Must be a valid email address"
    },
    length: {
      minimum: 6,
      maximum: 100
    }

  validates :username,
    presence: true,
    uniqueness: true,
    length: {
      minimum: 1,
      maximum: 50
    }
end
