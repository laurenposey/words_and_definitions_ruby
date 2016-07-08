require('Capybara/rspec')
require('./app')
require('launchy')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("add word path", {:type => :feature}) do
  it("adds a word to the list of words") do
    visit("/words/new")
    fill_in("word_name", :with => "kitten")
    click_button("Add")
    expect(page).to have_content("kitten")
  end
end

describe("new word list path", {:type => :feature}) do
  it("adds a word and displays it in the browser list with all other words") do
    visit("/words/new")
    fill_in("word_name", :with => "puppy")
    click_button("Add")
    expect(page).to have_content("puppy")
  end
end
