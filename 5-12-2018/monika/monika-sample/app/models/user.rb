class User < ApplicationRecord
  validates :age, :name, presence: true
end
