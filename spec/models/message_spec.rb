require 'spec_helper'

describe Message do
  let(:recipient) { FactoryGirl.create(:user) }
  let(:sender) { FactoryGirl.create(:user, first_name: "James", last_name: "Spader", username: "someguy") }
  let(:message1) { FactoryGirl.create(:message, recipient_id: recipient.id, sender_id: sender.id, read_at: nil) }
  let(:message2) { FactoryGirl.create(:message, recipient_id: recipient.id, sender_id: sender.id) }


  it { should belong_to(:sender) }
  it { should belong_to(:recipient) }

  context 'is message read?' do
    it "returns false if message is not read" do
      expect(message1.read?).to eql(false)
    end
    it "returns true if message is read" do
      expect(message2.read?).to eql(true)
    end
  end
end
