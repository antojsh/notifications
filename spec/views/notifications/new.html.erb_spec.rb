require 'rails_helper'

RSpec.describe "notifications/new", type: :view do
  before(:each) do
    assign(:notification, Notification.new(
      :message => "MyText",
      :receiver => "MyString",
      :sent => false,
      :response => "MyString",
      :user => nil,
      :service => nil
    ))
  end

  it "renders new notification form" do
    render

    assert_select "form[action=?][method=?]", notifications_path, "post" do

      assert_select "textarea#notification_message[name=?]", "notification[message]"

      assert_select "input#notification_receiver[name=?]", "notification[receiver]"

      assert_select "input#notification_sent[name=?]", "notification[sent]"

      assert_select "input#notification_response[name=?]", "notification[response]"

      assert_select "input#notification_user_id[name=?]", "notification[user_id]"

      assert_select "input#notification_service_id[name=?]", "notification[service_id]"
    end
  end
end
