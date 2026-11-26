[
  [ "Can't book Saturday at 10 with Sam", "sam.student@example.com", "The booking page says there are no slots on Saturday at 10, but Sam told me he is free then.", 3.hours.ago ],
  [ "My lesson shows up twice", "ana@example.com", "Next Tuesday's lesson is in my list two times. Do I have two lessons or one?", 90.minutes.ago ],
  [ "Instructor says the car is not available", "priya@example.com", "I booked a lesson for Thursday but my instructor says the automatic car is already taken.", 20.minutes.ago ]
].each do |subject, email, body, received_at|
  Ticket.find_or_create_by!(subject: subject) do |ticket|
    ticket.customer_email = email
    ticket.body = body
    ticket.created_at = received_at
  end
end
