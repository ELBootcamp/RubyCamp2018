class User < ApplicationRecord
  validates :name, :last_name, presence: true
end
