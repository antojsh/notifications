class Operation < ActiveRecord::Base
  belongs_to :user
  belongs_to :service
  validates :ilimitado,:total, presence: true
end
