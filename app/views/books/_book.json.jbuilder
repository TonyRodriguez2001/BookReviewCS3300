json.extract! book, :id, :title, :description, :rating, :published, :created_at, :updated_at
json.url book_url(book, format: :json)
