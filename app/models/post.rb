class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }, allow_blank: false
  validates :summary, length: { maximum: 250 }, allow_blank: false
  validates :category, inclusion: { in: ['Fiction', 'Non-Fiction']  }
  validates :title, exclusion: { in: ['True Facts']  }
end
