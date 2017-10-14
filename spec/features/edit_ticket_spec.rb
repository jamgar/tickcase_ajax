require "rails_helper"

RSpec.feature "Edit Ticket" do
  before do
    @user1 = create(:user)
    login_as @user1
    @techie = User.create!(email: "tech@example.com", password: "password", password_confirmation: "password", role: "technician")
    @ticket1 = Ticket.create(subject: "New ticket", content: "NT content here", client_id: @user1.id, technician_id: @techie.id)
  end

  scenario "A 'client' user updates their ticket" do
    visit "/"

    click_link "My Ticket"
    click_link @ticket1.id
    find(:css, "#edit-ticket").click

    fill_in "Subject", with: "Creating new ticket"
    select 'open', :from => 'Status'
    fill_in "Content", with: "Content for the new ticket - Updated"
    click_button "Update Ticket"

    expect(page).to have_content("Ticket was successfully updated!")
    expect(page).to have_content("Creating new ticket")
    expect(page).to have_content("Content for the new ticket - Updated")
  end

end
