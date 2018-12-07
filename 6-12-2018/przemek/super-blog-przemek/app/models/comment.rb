class Comment < ApplicationRecord
  validates_length_of :body, :within => 2..250

  belongs_to :post
  belongs_to :user
end
