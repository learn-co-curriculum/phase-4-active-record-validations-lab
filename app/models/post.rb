class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
  validate :must_have_title

   def must_have_title 
      clickbaits = ["Won't Believe", "Secret", "Top [number]", "Guess"]
      unless clickbaits.any?{ |clickbait| title.togs.include?(clickbait) }
      errors.add(:title, "Sorry Not A Title!")
      end
    end
end
