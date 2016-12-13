require 'rails_helper'

describe "creating posts" do

  before do
    visit root_path
    click_link "New Post"
  end

  scenario "create a post with valid details" do
    fill_in "Title", with: "title"
    fill_in "body", with: "body"

    click_button "Post"
    expect(page).to have_content "Post has been created."
  end
end
