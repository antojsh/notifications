require 'rails_helper'

RSpec.describe Token, type: :model do
  it "Deberia validar la fecha de expiracion del token" do
    token = FactoryGirl.create(:token, expires_at:DateTime.now + 5.months)
    expect(token.token_is_valid?).to eq(true)
  end
end
