class User < ApplicationRecord
  validates :name, :last_name, :age, presence: true
end
