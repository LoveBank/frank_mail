FactoryGirl.define do
  factory :frank_entry, :class => 'Frank::Entry' do
    note { Faker::Lorem.paragraph }
    rating { Faker::Number.between(1, 5)}
    private false
    received true
  end

end
