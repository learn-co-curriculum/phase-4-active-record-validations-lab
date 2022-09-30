class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :clickbait_y

    def clickbait_y
        if title
            unless title.include?("Won't Believe") || title.include?("Secret") || title.match?(/Top\s\d/) || title.include?("Guess")
                errors.add(:title, "Not clickbiat-y enough")
            end
        end
    end
end
