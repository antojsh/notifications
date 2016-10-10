class Package < ActiveRecord::Base
  belongs_to :user
  validates :name,:description,:price,  presence: true
  validates :name,  uniqueness: { case_sensitive: false }

  before_create :activate_package


  private 

  def activate_package
    self.active = true
  end
end
