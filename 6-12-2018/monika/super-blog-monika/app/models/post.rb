class Post < ApplicationRecord
  belongs_to :user
  validates :title, :content, presence: true

  scope :this_week, -> {
    where('created_at BETWEEN ? AND ?', Time.current - 7.days, Time.current)
  }
end
