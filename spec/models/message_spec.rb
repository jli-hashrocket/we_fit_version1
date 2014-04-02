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

  context 'is reading message' do
    it 'returns message with updated read_at attribute' do
      read_message = Message.reading_message(message1.id, message1.recipient_id)
      expect(read_message.read_at).to eql(read_message.read_at)
    end
  end

  context 'is the message an inbox message?' do
    it 'returns true if recipient' do
      is_inbox_message = message1.is_inbox_message?(recipient.id)
      expect(is_inbox_message).to eql(true)
    end

    it 'returns false if sender' do
      is_inbox_message = message1.is_inbox_message?(sender.id)
      expect(is_inbox_message).to eql(false)
    end
  end
end
