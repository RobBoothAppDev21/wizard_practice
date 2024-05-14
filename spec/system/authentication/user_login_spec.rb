# frozen_string_literal: true

require "rails_helper"

RSpec.describe "user login", type: :system do
  it "logs in a user" do
    user = create(:user)
    user.confirm
    visit root_path

    login_as(user)
    expect(page).to have_content("Signed in successfully.")
  end

  it "when user with email not found" do
    visit root_path
    click_link "Login"
    expect(page).to have_text("Log in")

    fill_in "Email", with: "non-user@example.com"
    fill_in "Password", with: Faker::Internet.password
    click_button "Log in"

    expect(page).to have_content("Invalid Email or password.")
    expect(page).to have_current_path("/users/sign_in")
  end

  it "when password wrong" do
    user = create(:user)

    visit root_path

    click_link "Login"
    
    expect(page).to have_text("Log in")
    
    fill_in "Email", with: user.email
    fill_in "Password", with: "wrong-password"
    click_button "Log in"

    expect(page).to have_content("Invalid Email or password.")
    expect(page).to have_current_path("/users/sign_in")
  end
end