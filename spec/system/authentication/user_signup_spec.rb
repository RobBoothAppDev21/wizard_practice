# frozen_string_literal: true

require "rails_helper"

RSpec.describe "account setup", type: :system do
  it "creates new account" do
    visit root_path
    click_link "Sign up"

    # expect(page).to have_text("Create a new account")
  end
end