class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :required_phrase

  def required_phrase
    regex = /Won't Believe|Secret|Top \d+|Guess/
    unless regex.match?(title)
      errors.add(:title, "must be clickbait")
    end
  end
end
