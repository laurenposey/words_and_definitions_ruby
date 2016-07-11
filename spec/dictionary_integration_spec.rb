require('Capybara/rspec')
require('./app')
require('launchy')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("dictionary route path", {:type => :feature}) do
  it("routes from home page to dictionary") do
      visit("/")
      click_link("Dictionary")
      expect(page).to have_content("Your Dictionary")
  end
end

describe("add word path", {:type => :feature}) do
  it("adds a word to the list of words") do
    visit("/words/new")
    fill_in("word_name", :with => "kitten")
    click_button("Add")
    expect(page).to have_content("Success!")
  end
end

describe("new word list path", {:type => :feature}) do
  it("adds a word and displays it in the browser list with all other words") do
    visit("/words/new")
    fill_in("word_name", :with => "puppy")
    click_button("Add")
    expect(page).to have_content("Success!")
  end
end

describe("add definition to word path", {:type => :feature}) do
  it("adds a definition to a word in the dictionary") do
    visit("/words/1/definitions/new")
    fill_in("word_definition", :with => "fuzzy")
    click_button("Add Definition")
    expect(page).to have_content("Success!")
  end
end

describe("dictionary route path from add definition page", {:type => :feature}) do
  it("routes from add definition to dictionary") do
      visit("/words/1/definitions/new")
      click_link("Dictionary")
      expect(page).to have_content("Your Dictionary")
  end
end

describe("Main page route path from add definition page", {:type => :feature}) do
  it("routes from add definition to main page") do
      visit("/words/1/definitions/new")
      click_link("Return to Main Page")
      expect(page).to have_content("Welcome")
  end
end
