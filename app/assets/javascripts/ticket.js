function init() {
  getTickets()
}

function getTickets() {
  $.get('/tickets.json', function(data) {
    displayTickets(data)
  })
}

function getTicket(event, ticketId) {
  event.preventDefault()
  $.get('/tickets/' + ticketId + '.json', function(data) {
    displayTicket(data)
  })
}

function displayTickets(ticketsData) {
  var ticketsTable = document.getElementById("tickets-table")

  var tickets = ticketsData.map((ticket) => {
    return(
      `<tr>
        <td><a href="#" onclick="getTicket(event, ${ticket.id})">${ticket.id}</a></td>
        <td>${ticket.subject}</td>
        <td>${ticket.status}</td>
        <td>${ticket.technician.email}</td>
      </tr>`
    )
  }).join('')
  ticketsTable.innerHTML = tickets
}

function displayTicket(ticketData) {
  var ticketBody = document.getElementById("ticket-body")

  var ticket = `<p>${ticketData.id}</p>
                <p>${ticketData.subject}</p>
                <p>${ticketData.status}</p>
                <p>${ticketData.technician.email}</p>`
  ticketBody.innerHTML = ticket
}


$(function() {
  init()
})
