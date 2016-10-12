require 'rails_helper'

RSpec.describe Movement, type: :model do
  it { should belong_to(:user) }
  it { should validate_presence_of(:debito) }
  it { should validate_presence_of(:credito) }
  
end
