class Book < ApplicationRecord
    validates :description, presence: true, length: { minimum: 20 }
    validates :title, presence: true
    validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to:10 }
    validates :rating, presence: true
    validates :image, presence: true
    validates :genre, presence: true
    validates :published, presence: true
    has_one_attached :image

    enum genre: [:fiction, :nonfiction, :mystery, :romance, :sci_fi, :fantasy, :horror, :history, :biography, :memoir]
end
