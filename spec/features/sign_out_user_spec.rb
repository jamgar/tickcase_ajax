require "rails_helper"

RSpec.feature "User sign out" do
  before do
    user = create(:user)
    visit "/"

    click_link "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
  end

  scenario "redirects to home" do
    visit "/"
    click_link "Sign Out"
    expect(page).to have_content("Signed out successfully.")
  end
end
