class Post < ApplicationRecord

    validates :title, presence: true, clickbait: true
    validates :content, length: {min: 250}
    validates :summary, length: {max: 250}
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }

    private
    def clickbait_title?
        clickbait_phrases = ["Won't Believe", "Secret", "Top", "Guess"]
        clickbait_phrases.any? { |phrase| title.include?(phrase) }
    end

    def clickbait_validator
        errors.add(:title, 'is not clickbait-y enough') unless clickbait_title?
      end
      
      validate :clickbait_validator
    
end
