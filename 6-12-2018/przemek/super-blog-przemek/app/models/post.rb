class Post < ApplicationRecord
  validates :title, :content, presence: true

  belongs_to :user

  scope :this_month, -> {
    where('created_at BETWEEN ? AND ?', 30.days.ago, Time.current)
  }
end
