require 'rails_helper'

RSpec.describe "User login form" do
  it "logs in an registered User" do
  user = User.create!(username: "hungryhippo", password: "test")

  visit root_path
# save_and_open_page
  click_link "Log In"

  expect(current_path).to eq(login_path)

  fill_in "username", with: user.username
  fill_in "password", with: user.password
  click_button "Log In"

  expect(current_path).to eq(root_path)
  expect(page).to have_content("Signed in as #{user.username}")
  expect(page).to have_link("Log Out")
  end
end
