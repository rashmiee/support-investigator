require "rails_helper"

RSpec.describe "Inbox", type: :system do
  it "lists tickets with the newest first" do
    create(:ticket, subject: "Can't book Saturday at 10", customer_email: "sam@example.com", created_at: 2.hours.ago)
    create(:ticket, subject: "Lesson shows twice", customer_email: "ana@example.com", created_at: 5.minutes.ago)

    visit root_path

    expect(page).to have_css("h1", text: "Inbox")
    subjects = all("[data-test=ticket-subject]").map(&:text)
    expect(subjects).to eq([ "Lesson shows twice", "Can't book Saturday at 10" ])
    expect(page).to have_text("sam@example.com")
  end

  it "says so when there are no tickets" do
    visit root_path

    expect(page).to have_text("No tickets yet")
  end
end
