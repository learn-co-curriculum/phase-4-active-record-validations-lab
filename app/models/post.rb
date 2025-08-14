class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w[Fiction Non-Fiction] }

  validate :clickbait

private

  def clickbait
    return unless title
    return if includes_clickbait_phrase(title) || includes_top_number(title)

    errors.add(:title, "is not clickbaity enough")
  end

  def includes_clickbait_phrase(title)
    phrases = ["Won't Believe", "Secret", "Guess"]
    phrases.any? { |phrase| title.include?(phrase) }
  end

  def includes_top_number(title)
    !!(title =~ /\bTop\s+\d+\b/)
  end
end
