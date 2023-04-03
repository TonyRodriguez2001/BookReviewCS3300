class Book < ApplicationRecord
    validates :description, presence: true, length: { minimum: 20 }
    validates :title, presence: true
    validates :rating, numericality: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to:10 }
    validates :image, presence: true
    #validates :date, presence: true
    has_one_attached :image
end
