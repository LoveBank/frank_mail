require 'rails_helper'

RSpec.describe LoveReport do
  describe 'report' do
    let(:user) { FactoryGirl.build_stubbed(:frank_profile) }
    let(:mail) { LoveReport.send_daily_report(user) }
    let(:entry) { FactoryGirl.build_stubbed(:frank_entry, :note => 'My awesome comment') }

    before(:each) do
      ActionMailer::Base.deliveries = []
    end

    after(:each) do
      ActionMailer::Base.deliveries.clear
    end

    it 'should send an email' do
      mail.deliver_now
      expect(ActionMailer::Base.deliveries.count).to eql 1
    end

    it 'renders the subject' do
      expect(mail.subject).to eql('Your daily LoveBank report')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql([user.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql(['report@treasury.love'])
    end

    it 'assigns @name' do
      expect(mail.body.encoded).to match(user.firstname)
    end

    it 'assigns @confirmation_url' do
      expect(mail.body.encoded).to match("<h1>Hi, #{user.firstname}</h1>")
    end
  end
end