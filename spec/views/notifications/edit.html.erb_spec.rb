require 'rails_helper'

RSpec.describe "notifications/edit", type: :view do
  before(:each) do
    @notification = assign(:notification, Notification.create!(
      :message => "MyText",
      :receiver => "MyString",
      :sent => false,
      :response => "MyString",
      :user => nil,
      :service => nil
    ))
  end

  it "renders the edit notification form" do
    render

    assert_select "form[action=?][method=?]", notification_path(@notification), "post" do

      assert_select "textarea#notification_message[name=?]", "notification[message]"

      assert_select "input#notification_receiver[name=?]", "notification[receiver]"

      assert_select "input#notification_sent[name=?]", "notification[sent]"

      assert_select "input#notification_response[name=?]", "notification[response]"

      assert_select "input#notification_user_id[name=?]", "notification[user_id]"

      assert_select "input#notification_service_id[name=?]", "notification[service_id]"
    end
  end
end
