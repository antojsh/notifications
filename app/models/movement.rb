class Movement < ActiveRecord::Base
  belongs_to :user
  validates :debito,:credito, presence: true
end
