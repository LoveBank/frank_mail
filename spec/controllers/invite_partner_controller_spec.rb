require 'rails_helper'

RSpec.describe InvitePartnerController, type: :controller do

  context 'create' do
    before(:each) do
      ActionMailer::Base.deliveries = []
    end

    after(:each) do
      ActionMailer::Base.deliveries.clear
    end

    let(:user) { FactoryGirl.create(:frank_profile) }

    it 'creates an invite email' do
      json = { :format => 'json', :invite => { :email => Faker::Internet.email, :id => user.id } }
      post :create, json
      expect(response.status).to eq(200)
      expect(ActionMailer::Base.deliveries.count).to eql 1
    end

    it 'invalid profile' do
      json = { :format => 'json', :invite => { :email => Faker::Internet.email, :id => 9999 } }
      post :create, json
      expect(JSON.parse(response.body)["status"]).to eql 401
      expect(JSON.parse(response.body)["message"]).to eql 'Could not find matching profile'
    end
  end
end
