require 'rails_helper'

describe "Editing posts" do
  before do
    FactoryGirl.create(:post, title: "Sublime Text 3", body: "this is my time to shine")
    visit "/posts"
    click_link "read more"
    click_link "Edit"
  end

  scenario "with valid attributes" do
    fill_in "Title", with: "Sublime Text 4 beta"
    fill_in "body", with: "this time we gonna do it"
    click_button "Update Post"
    expect(page).to have_content "Post has been updated."
    expect(page).to have_content "Sublime Text 4 beta"
    expect(page).to have_content "this time we gonna do it"
  end

  # scenario "when providing invalid attributes" do
  #   fill_in "Title", with: ""
  #   fill_in "body", with: ""
  #   click_button "Update Post"
  #   expect(page).to have_content "Post has not been updated."
  # end
end
