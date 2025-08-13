class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w[Fiction Non-Fiction] }

  validate :title_must_contain_keywords

  private

  def title_must_contain_keywords
    keywords = ["Won't Believe", 'Secret', 'Top', 'Guess']
    return if keywords.any? { |word| title&.include?(word) }

    errors.add(:title, 'No matching titles')
  end
end
