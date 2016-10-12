require 'rails_helper'

RSpec.describe Package, type: :model do
    it { should have_many(:ServicePackages) }
    it { should have_many(:services).through(:ServicePackages) }
end
