require 'rails_helper'

feature "sign_up" do

  before do
    visit root_path
  end

  scenario "visiting the site to sign up" do
    click_link "Sign up"
    expect(page.current_path).to eq('/users/sign_up')
    fill_in("Email", with: "tester1@test.com")
    fill_in("Password", with: "password123", :match => :prefer_exact)
    fill_in("Password confirmation", with: "password123", :match => :prefer_exact)
    click_button('Register')
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end
end
