require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:identification) }
  it { should validate_presence_of(:api_key) }
  it { should validate_presence_of(:api_secret) }
  it { should_not allow_value("anto@gmail").for(:email) }
  it { should allow_value("anto@gmail.com").for(:email) }



end
