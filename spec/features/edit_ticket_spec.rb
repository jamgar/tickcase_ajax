require "rails_helper"

RSpec.feature "Edit Ticket" do
  before do
    @admin = create(:user)
    @techie = create(:user)
    @techie.role = 'technician'
    @client1 = create(:user)

    @ticket1 = Ticket.create(subject: "New ticket", content: "NT content here", client_id: @client1.id, technician_id: @techie.id)
  end

  scenario "A 'client' user updates their ticket" do
    login_as @client1

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

  scenario "A 'technician' user updates 'client' ticket" do
    login_as @techie

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

  scenario "A 'admin' user updates 'client' ticket" do
    login_as @admin

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
