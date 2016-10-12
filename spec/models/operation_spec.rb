require 'rails_helper'

RSpec.describe Operation, type: :model do
  it { should belong_to(:service) }
  it { should belong_to(:user) }
  it { should validate_presence_of(:total) }
  it { should validate_presence_of(:ilimitado) }
end
