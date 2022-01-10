class Author < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :phone_number, length: { is: 10 }, allow_blank: false
end
