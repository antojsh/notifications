class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :service
  before_create :update_response
  after_create :update_operation
  attr_accessor :response_aldeamo

  def set_response=(value)
    @response_aldeamo = value
  end


  def set_user=(value)
    @user = value
  end

  

  private

  def update_response
      #self.response = @response_aldeamo
      self.send_date = DateTime.now
      self.user_id = @user.id
      self.service_id = 1
  end

  def update_operation
      service = @user.operations.find_by(service_id: self.service_id)

      service.update(:total => service.total - 1)
  end
end
