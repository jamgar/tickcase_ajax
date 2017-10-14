require "rails_helper"

RSpec.feature "Users sign-in" do
  before do
    @user = create(:user)
  end

  scenario "with valid credentials" do
    visit "/"

    click_link "Sign In"
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
  end
end
