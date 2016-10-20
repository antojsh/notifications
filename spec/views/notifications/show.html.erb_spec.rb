require 'rails_helper'

RSpec.describe "notifications/show", type: :view do
  before(:each) do
    @notification = assign(:notification, Notification.create!(
      :message => "MyText",
      :receiver => "Receiver",
      :sent => false,
      :response => "Response",
      :user => nil,
      :service => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Receiver/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Response/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
