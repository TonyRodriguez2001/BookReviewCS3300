require "rails_helper"

RSpec.describe BooksController, type: :controller do

  login_user

  describe "test web requests" do
    context "GET #index" do
      it "returns a success response" do
        get :index
        expect(response).to have_http_status(:ok)
      end
    end

    context "GET #edit" do
      let!(:book) { Book.create(title: "Title", description: "Content of the description", rating: 10, image: "test.jpg", published: Date.today, genre: 2) }
      it "returns a success response" do
        expect(response).to have_http_status(:ok)
      end
    end

    context "GET #new" do
      it "returns a success response" do
        get :new
        expect(response).to have_http_status(:ok)
      end
    end

    context "GET #show" do
      let!(:book) { Book.create(title: "Title", description: "Content of the description", rating: 10, image: "test.jpg", published: Date.today, genre: 2) }

      it "returns a success response" do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
