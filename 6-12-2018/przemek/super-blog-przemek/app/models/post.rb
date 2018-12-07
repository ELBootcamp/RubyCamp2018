class Post < ApplicationRecord
  validates :title, :content, presence: true

  belongs_to :user
  has_many :comments

  scope :this_month, -> {
    where('created_at BETWEEN ? AND ?', 30.days.ago, Time.current)
  }
end
