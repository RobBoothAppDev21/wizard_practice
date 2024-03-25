# frozen_string_literal: true

require "rails_helper"

RSpec.describe "visit home", type: :system do
  scenario "visit root path" do
    visit root_path

    expect(page).to have_content("Hello world")
  end
end