FactoryGirl.define do
  factory :frank_profile, :class => 'Frank::Profile' do
    firstname { Faker::Name.first_name }
    lastname  { Faker::Name.last_name }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.phone_number }

    trait :with_entries do
      after :create do |profile|
        FactoryGirl.create_list :frank_entry, 30, profile: profile
      end
    end

    trait :with_partner_entries do
      after :create do |profile|
        FactoryGirl.create_list :frank_entry, 30, :rating => 3, :created_at => 1.day.ago, :updated_at => 1.day.ago, linked_profile_id: profile.id
      end
    end

    #
    trait :with_partner_entries_last_week do
      after :create do |profile|
        FactoryGirl.create_list :frank_entry, 30, :rating => 2, :created_at => 1.week.ago, :updated_at => 1.week.ago, linked_profile_id: profile.id
      end
    end
  end

end
