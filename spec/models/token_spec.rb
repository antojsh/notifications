require 'rails_helper'

RSpec.describe Token, type: :model do

  # it { should validate_presence_of(:token) }
  # it { should validate_presence_of(:expires_at) }
  it { should belong_to(:user) }
  
end
