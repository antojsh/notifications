require 'rails_helper'

RSpec.describe Service, type: :model do
    it { should have_many(:ServicePackages) }
    it { should have_many(:packages).through(:ServicePackages) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_length_of(:name).is_at_least(3) }
    it { should validate_length_of(:description).is_at_least(10) }
    it { should have_many(:operations) }
    it { should have_many(:users).through(:operations) }
end
