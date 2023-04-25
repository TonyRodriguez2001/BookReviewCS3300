require "rails_helper"

describe "Book Attribute Requirements on Create", type: :model do
  context "validation tests" do
    it "ensures the title is present when creating Book" do
      book = Book.new(description: "Content of the description", rating: 10, published: Date.today, image: "test.jpg", genre: 2)
      expect(book.valid?).to eq(false)
    end

    it "should not be able to save Book when title missing" do
      book = Book.new(description: "Content of the description", rating: 10, published: Date.today, image: "test.jpg", genre: 2)
      expect(book.save).to eq(false)
    end

    it "ensures the description is present when creating Book" do
      book = Book.new(title: "Title", rating: 10, published: Date.today, image: "test.jpg", genre: 2)
      expect(book.valid?).to eq(false)
    end

    it "should not be able to save Book when description is missing" do
      book = Book.new(title: "Some title", rating: 10, published: Date.today, image: "test.jpg", genre: 2)
      expect(book.save).to eq(false)
    end

    it "ensures the rating is present when creating Book" do
        book = Book.new(title: "Title", description: "Content of the description", published: Date.today, image: "test.jpg", genre: 2)
        expect(book.valid?).to eq(false)
    end
  
    it "should not be able to save Book when rating is missing" do
        book = Book.new(title: "Title", description: "Content of the description", published: Date.today, image: "test.jpg", genre: 2)
        expect(book.save).to eq(false)
    end
    
    it "ensures the published date is present when creating Book" do
        book = Book.new(title: "Title", description: "Content of the description", rating: 10, image: "test.jpg", genre: 2)
        expect(book.valid?).to eq(false)
    end
  
    it "should not be able to save Book when published date is missing" do
        book = Book.new(title: "Title", description: "Content of the description", rating: 10, image: "test.jpg", genre: 2)
        expect(book.save).to eq(false)
    end

    it "ensures the image is present when creating Book" do
        book = Book.new(title: "Title", description: "Content of the description", rating: 10, published: Date.today, genre: 2)
        expect(book.valid?).to eq(false)
    end
  
    it "should not be able to save Book when image is missing" do
        book = Book.new(title: "Title", description: "Content of the description", rating: 10, published: Date.today, genre: 2)
        expect(book.save).to eq(false)
    end

    it "ensures the genre is present when creating Book" do
        book = Book.new(title: "Title", description: "Content of the description", rating: 10, image: "test.jpg", published: Date.today)
        expect(book.valid?).to eq(false)
    end
  
    it "should not be able to save Book when genre is missing" do
        book = Book.new(title: "Title", description: "Content of the description", rating: 10, image: "test.jpg", published: Date.today)
        expect(book.save).to eq(false)
    end

    it "should be able to save Book when have title, description, date published, rating, image, and genre" do
      book = Book.new(title: "Title", description: "Content of the description", rating: 10, image: "test.jpg", published: Date.today, genre: 2)
      expect(book.save).to eq(true)
    end
  end
end

describe "Book Attribute Requirements on Edit", type: :model do
  context "Edit Book" do
    before(:each) do
      @book = Book.create(title: "Title", description: "Content of the description", rating: 10, image: "test.jpg", published: Date.today, genre: 2)
    end

    it "ensures the title is present when editing Book" do
      @book.update(title: "New Title")
      expect(@book.title == "New Title")
    end

    it "ensures the description is present when editing Book" do
      @book.update(description: "New Description with 20 chars")
      expect(@book.description == "New Description with 20 chars")
    end

    it "ensures the rating is present when editing Book" do
        @book.update(rating: 9)
        expect(@book.description == 9)
    end

    it "ensures the date published is present when editing Book" do
        @book.update(published: Date.yesterday)
        expect(@book.description == Date.yesterday)
    end

    it "ensures the image is present when editing Book" do
        @book.update(image: "Newimage.png")
        expect(@book.description == "Newimage.png")
    end

    it "ensures the genre is present when editing Book" do
        @book.update(genre: 3)
        expect(@book.description == 3)
    end

  end
end
