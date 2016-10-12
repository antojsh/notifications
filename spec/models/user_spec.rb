require 'rails_helper'
RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_least(3) }
  it { should validate_length_of(:last_name).is_at_least(3) }
  it { should validate_length_of(:identification).is_at_least(3) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:identification) }
   #it { should validate_presence_of(:api_key) }
   #it { should validate_presence_of(:api_secret) }
  it { should_not allow_value("anto@gmail").for(:email) }
  it { should allow_value("anto@gmail.com").for(:email) }
  it { should have_many(:tokens) }
  it { should have_many(:movements) }
  it { should have_many(:operations) }
  it { should have_many(:services).through(:operations) }
  
end
