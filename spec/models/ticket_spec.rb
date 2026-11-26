require "rails_helper"

RSpec.describe Ticket, type: :model do
  it "is valid from the factory" do
    expect(build(:ticket)).to be_valid
  end

  %i[subject body customer_email].each do |field|
    it "requires #{field}" do
      ticket = build(:ticket, field => "")

      expect(ticket).not_to be_valid
      expect(ticket.errors[field]).to include("can't be blank")
    end
  end

  it "starts as open" do
    expect(Ticket.new.status).to eq("open")
  end

  it "rejects an unknown status" do
    ticket = build(:ticket, status: "closed")

    expect(ticket).not_to be_valid
    expect(ticket.errors[:status]).to be_present
  end

  describe ".inbox" do
    it "puts the newest ticket first" do
      older = create(:ticket, created_at: 2.hours.ago)
      newer = create(:ticket, created_at: 5.minutes.ago)

      expect(Ticket.inbox).to eq([ newer, older ])
    end
  end
end
