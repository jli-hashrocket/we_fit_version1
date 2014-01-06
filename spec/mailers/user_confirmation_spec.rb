require "spec_helper"

describe UserConfirmation do
  describe "member_info" do
    let(:user) { FactoryGirl.create(:user) }
    let(:mail) { UserConfirmation.member_info(user) }

    it "renders the headers" do
      mail.subject.should eq("Member Confirmation")
      mail.to.should eq([user.email])
      mail.from.should eq(["no_reply@wefit.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  it 'sends a confirmation email when user sign up is successful' do
    ActionMailer::Base.deliveries = []
    FactoryGirl.build(:user).send_mail
    expect(ActionMailer::Base.deliveries.count).to eql(1)
  end
end
