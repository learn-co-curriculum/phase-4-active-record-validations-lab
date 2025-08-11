class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w[Fiction Non-Fiction] }
  validate :validate_clickbaitiness

  def validate_clickbaitiness
    clickbait_phrases = [
      "Won't Believe",
      'Secret',
      'Top',
      'Guess'
    ]

    return unless title && clickbait_phrases.none? { |phrase| title.include?(phrase) }

    errors.add(:title, 'Not clickbaity enough')
  end
end
