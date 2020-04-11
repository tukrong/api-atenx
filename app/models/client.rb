class Client < ApplicationRecord
  belongs_to :user
  validates :name, :age, :description, :duration, :user, presence: true
end
