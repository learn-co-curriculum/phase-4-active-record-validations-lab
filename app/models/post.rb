class PostValidator < ActiveModel::Validator
  def validate(post)
    return if post.title != 'True Facts'

    post.errors.add(:title, 'must be something')
  end
end

class Post < ApplicationRecord
  include ActiveModel::Validations
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w[Fiction Non-Fiction] }
  validates_with PostValidator
end
