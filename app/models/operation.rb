class Operation < ActiveRecord::Base
  belongs_to :user
  belongs_to :service
  #validates  :total, presence: true
end
