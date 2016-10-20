FactoryGirl.define do
  factory :notification do
    message "MyText"
    receiver "MyString"
    send_date "2016-10-19"
    sent false
    response "MyString"
    response_date "2016-10-19"
    user nil
    service nil
  end
end
