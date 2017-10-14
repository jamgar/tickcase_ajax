require "rails_helper"

RSpec.feature "Show Tickets List" do
  before do
    @admin = create(:user)
    @techie =  create(:user)
    @techie.role = 'technician'
    @client1 = create(:user)
    @client2 = create(:user)
    @ticket1 = Ticket.create(subject: "New ticket", content: "NT content here", client_id: @client1.id, technician_id: @techie.id)
    @ticket2 = Ticket.create(subject: "U2 New ticket", content: "U2 NT content here", client_id: @client2.id, technician_id: @techie.id)
  end

  scenario "client can only see their tickets" do
    login_as @client1

    visit "/"

    click_link "My Tickets"

    expect(page).to have_link(@ticket1.id)
    expect(page).to_not have_link(@ticket2.id)
  end

  scenario "technician can see all tickets" do
    login_as @techie

    visit "/"

    click_link "My Tickets"

    expect(page).to have_link(@ticket1.id)
    expect(page).to have_link(@ticket2.id)
  end


    scenario "admin can see all tickets" do
      login_as @admin

      visit "/"

      click_link "My Tickets"

      expect(page).to have_link(@ticket1.id)
      expect(page).to have_link(@ticket2.id)
    end

end
