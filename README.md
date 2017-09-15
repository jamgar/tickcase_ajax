# Tickcase

This is a simple Ticket tracking system built with Ruby on Rails.

### instructions
* Download or Clone the repository
* Run `bundle install`
* Start the server with `rails server`
* Sign up
  Note: The first user to signup with an email will be the administrator. All other users who signup will be defaulted to client role. The administrator can change the role of a user to either admin, technician, or client.

All signed in users can create a ticket. Clients can only view and edit their tickets. Clients can see all messages on a ticket, but can only edit their own. A technician can view and edit all tickets. Technicians can view all messages, but can only their own. A technician can only view users.
