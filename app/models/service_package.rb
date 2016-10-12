class ServicePackage < ActiveRecord::Base
  belongs_to :service
  belongs_to :package
end
