FactoryGirl.define do
  factory :token do
    expires_at "2016-10-06 16:53:31"
    association :user, factory: :user
  end
end
