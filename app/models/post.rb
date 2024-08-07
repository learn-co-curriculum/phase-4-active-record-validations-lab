class Post < ApplicationRecord
  CLICKBAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top \d+/i,
    /Guess/i
  ]

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, presence: true, inclusion: { in: ["Fiction", "Non-Fiction"] }
  validate :title_is_clickbait

  private

  def title_is_clickbait
    unless CLICKBAIT_PATTERNS.any? { |pattern| pattern.match(title) }
      errors.add(:title, "must be sufficiently clickbait-y")
    end
  end
end
