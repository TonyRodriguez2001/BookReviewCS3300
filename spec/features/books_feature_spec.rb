require "rails_helper"

RSpec.feature "Books", type: :feature do
  context "Update books" do
    let(:book) { Book.create(title: "Title", description: "Content of the description", rating: 10, image: "test.jpg", published: Date.today, genre: 2) }
    
    before(:each) do
      user = FactoryBot.create(:user)
      login_as(user)
      visit edit_book_path(book)
    end
    
    scenario "should be successful" do
      within("form") do
        fill_in "Description", with: "New description content"
        fill_in "Title", with: "New title"
        fill_in "Published", with: "2022-05-01"
        fill_in "Rating", with: "4.50"
        attach_file("Image", Rails.root + "test_image.png")
        select "Romance", from: "Genre"
      end
      click_button "Update Book"
      expect(page).to have_content("Book was successfully updated")
    end
    
    scenario "should fail if description is empty" do
      within("form") do
        fill_in "Description", with: ""
      end
      click_button "Update Book"
      expect(page).to have_content("Description can't be blank")
    end
    
    scenario "should fail if title is empty" do
      within("form") do
        fill_in "Title", with: ""
      end
      click_button "Update Book"
      expect(page).to have_content("Title can't be blank")
    end

    scenario "should fail if published is empty" do
        within("form") do
          fill_in "Published", with: ""
        end
        click_button "Update Book"
        expect(page).to have_content("Published can't be blank")
    end

    scenario "should fail if rating is empty" do
        within("form") do
            fill_in "Rating", with: ""
        end
        click_button "Update Book"
        expect(page).to have_content("Rating can't be blank")
    end

    scenario "should fail if image is empty" do
        within("form") do
            attach_file("Image", Rails.root + "")
        end
        click_button "Update Book"
        expect(page).to have_content("Rating can't be blank")
    end
  
    scenario "should fail if genre is empty" do
        within("form") do
            select "", from: "Genre"
        end
        click_button "Update Book"
        expect(page).to have_content("Genre can't be blank")
    end
  
  context "Create book" do
    before(:each) do
      user = FactoryBot.create(:user)
      login_as(user)
      visit new_book_path
    end
    
    scenario "should be successful" do
      within("form") do
        fill_in "Description", with: "New description content"
        fill_in "Title", with: "New title"
        fill_in "Published", with: "2022-05-01"
        fill_in "Rating", with: "4.50"
        attach_file("Image", Rails.root + "spec/fixtures/test_image.png")
        select "Romance", from: "Genre"
      end
      click_button "Create Book"
      expect(page).to have_content("Book
       was successfully created")
    end
    
    scenario "should fail if description is empty" do
      within("form") do
        fill_in "Description", with: ""
      end
      click_button "Create Book"
      expect(page).to have_content("Description can't be blank")
    end
    
    scenario "should fail if title is empty" do
      within("form") do
        fill_in "Title", with: ""
      end
      click_button "Create Book"
      expect(page).to have_content("Title can't be blank")
    end

    scenario "should fail if published is empty" do
        within("form") do
          fill_in "Published", with: ""
        end
        click_button "Update Book"
        expect(page).to have_content("Published can't be blank")
    end

    scenario "should fail if rating is empty" do
        within("form") do
            fill_in "Rating", with: ""
        end
        click_button "Update Book"
        expect(page).to have_content("Rating can't be blank")
    end

    scenario "should fail if image is empty" do
        within("form") do
            attach_file("Image", Rails.root + "")
        end
        click_button "Update Book"
        expect(page).to have_content("Rating can't be blank")
    end
  
    scenario "should fail if genre is empty" do
        within("form") do
            select "", from: "Genre"
        end
        click_button "Update Book"
        expect(page).to have_content("Genre can't be blank")
    end
  end
end

RSpec.feature "Books", type: :feature do
  context "Login" do
    scenario "should sign up" do
      visit root_path
      click_link 'Sign up'
      within("form") do
        fill_in "Email", with: "testing@test.com"
        fill_in "Password", with: "123456"
        fill_in "Password confirmation", with: "123456"
        click_button "Sign up"
      end
      expect(page).to have_content("Welcome! You have signed up successfully.")
    end
    
    scenario "should log in" do
      user = FactoryBot.create(:user)
      login_as(user)
      visit root_path
      expect(page).to have_content("Logged in")
    end
  end
end
