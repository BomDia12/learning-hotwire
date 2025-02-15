require "application_system_test_case"

# E2E tests
class QuotesTest < ApplicationSystemTestCase
  setup do 
    @quote = Quote.ordered.first
  end

  test "Creating a new quote" do
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    click_on "New quote"

    fill_in "Name", with: "Capybara quote"
    click_on "Create quote"

    assert_selector "h1", text: "Quotes"
    assert_text "Capybara quote"
  end

  test "Showing a quote" do
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    click_link @quote.name

    assert_selector "h1", text: @quote.name
  end

  test "Updating a quote" do 
    visit quotes_path
    assert_selector "h1", text: "Quotes"
    
    assert_text @quote.name
    
    click_on "Edit", match: :first
    assert_selector "h1", text: "Quotes"
    
    fill_in "Name", with: "Updated quote"
    click_on "Update quote"
    
    assert_selector "h1", text: "Quotes"
    assert_text "Updated quote"
  end

  test "Deleting a quote" do
    visit quotes_path
    assert_selector "h1", text: "Quotes"
    
    assert_text @quote.name
    
    click_on "Delete", match: :first

    assert_no_text @quote.name
  end
end
