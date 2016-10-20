class Package < ActiveRecord::Base
  
  has_many :ServicePackages
  has_many :services, through: :ServicePackages
  has_many :users
    
  validates :name,:description,:price,  presence: true
  validates :name,  uniqueness: { case_sensitive: false }

  before_create :activate_package
  after_create :save_services

  attr_accessor :services
  def set_services=(value)
    services = value
  end

 
  
  def get_services
    services
  end

  private 

  def save_services
    get_services.each do |service_id|
      @service = Service.find(service_id)
      ServicePackage.create(service_id: service_id, package_id: self.id, total: @service.total, unit_price: @service.price)
    end
  end

  def activate_package
    self.active = true
  end

end
