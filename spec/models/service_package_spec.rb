require 'rails_helper'

RSpec.describe ServicePackage, type: :model do
  it { should belong_to(:service) }
  it { should belong_to(:package) }
end
