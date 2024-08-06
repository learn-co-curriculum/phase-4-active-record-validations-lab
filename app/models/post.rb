class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary,  length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction  Non-Fiction) }
  validates :title, exclusion: { in: %w(True Facts) }

  validate :title_is_clickbait

  def title_is_clickbait
    if title == "True Facts"
      errors.add(:title, "No clickbait allowed")
    end
  end
end
