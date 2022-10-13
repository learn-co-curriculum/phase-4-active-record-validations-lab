class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }

    validate :clickbait

    def clickbait
        unless(title.include?("Won't Believe") || title.include?("Secret") || /Top \d/i.match(title) || title.include?("Guess"))
            errors.add(:title, "Must be clickbait")
        end
    end
end
