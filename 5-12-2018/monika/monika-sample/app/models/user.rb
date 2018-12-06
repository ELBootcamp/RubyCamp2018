class User < ApplicationRecord
  validates :age, presence: true
  validates :name, presence: true
end
