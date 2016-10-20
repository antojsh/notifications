require 'rails_helper'

RSpec.describe "notifications/index", type: :view do
  before(:each) do
    assign(:notifications, [
      Notification.create!(
        :message => "MyText",
        :receiver => "Receiver",
        :sent => false,
        :response => "Response",
        :user => nil,
        :service => nil
      ),
      Notification.create!(
        :message => "MyText",
        :receiver => "Receiver",
        :sent => false,
        :response => "Response",
        :user => nil,
        :service => nil
      )
    ])
  end

  it "renders a list of notifications" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Receiver".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Response".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
