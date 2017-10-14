require "rails_helper"

RSpec.feature "Create Ticket" do
  before do
    login_as create(:user), scope: :user
    @techie = User.create!(email: "tech@example.com", password: "password", password_confirmation: "password", role: "technician")
  end

  scenario "A user creates a new ticket" do
    visit "/"

    click_link "New Ticket"

    fill_in "Subject", with: "Creating new ticket"
    select 'open', :from => 'Status'
    fill_in "Content", with: "Content for the new ticket"
    click_button "Create Ticket"

    expect(page).to have_content("Ticket was successfully created!")
    expect(page).to have_content("Creating new ticket")
    expect(page).to have_content("Content for the new ticket")
  end
end
