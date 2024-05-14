# frozen_string_literal: true

require "rails_helper"

RSpec.describe "account setup", type: :system do
  it "creates new account" do
    email = Faker::Internet.email
    password = Faker::Internet.password
    visit root_path
    click_link "Sign up"

    expect(page).to have_text("Create new account!")

    fill_in "Email", with: email
    fill_in "Password", with: password
    fill_in "Password confirmation", with: password
    click_button "Sign up"

    expect(page).to have_content("A message with a confirmation link has been sent to your email address")
    expect(User.count).to eq(1)
  end
end