require "rails_helper"

RSpec.feature "Close Ticket" do
  before do
    @admin = create(:user)
    @techie = create(:user)
    @techie.role = 'technician'
    @client1 = create(:user)

    @ticket1 = Ticket.create(subject: "New ticket", content: "NT content here", client_id: @client1.id, technician_id: @techie.id)
  end

  scenario "A 'client' user closes their ticket" do
    login_as @client1

    visit "/"

    click_link "My Ticket"
    click_link @ticket1.id
    find(:css, "#edit-ticket").click

    select 'closed', :from => 'Status'
    click_button "Update Ticket"

    expect(page).to have_content("Ticket was successfully updated!")
    expect(page).to_not have_link @ticket1.id
  end

  scenario "A 'technician' user closes 'client' ticket" do
    login_as @techie

    visit "/"

    click_link "My Ticket"
    click_link @ticket1.id
    find(:css, "#edit-ticket").click

    select 'closed', :from => 'Status'
    click_button "Update Ticket"

    expect(page).to have_content("Ticket was successfully updated!")
    expect(page).to_not have_link @ticket1.id
  end

  scenario "A 'admin' user closes 'client' ticket" do
    login_as @admin

    visit "/"

    click_link "My Ticket"
    click_link @ticket1.id
    find(:css, "#edit-ticket").click

    select 'closed', :from => 'Status'
    click_button "Update Ticket"

    expect(page).to have_content("Ticket was successfully updated!")
    expect(page).to_not have_link @ticket1.id
  end

end
