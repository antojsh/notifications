# curl -s --user 'api:key-2f0ccd726724286d7d6448bbff8e271a' \
#     https://api.mailgun.net/v3/antoniosierra.co/messages \
#     -F from='Excited User <asierra@antoniosierra.co>' \
#     -F to=antoniojsh93@gmail.com \
#     -F to=antoniojsh93@gmail.com \
#     -F subject='Hello' \
#     -F text='Testing some Mailgun awesomness!'
class Notifications::V1::NotificationsController < ApplicationController
  before_action :authenticate
  before_action :set_notification, only: [:show, :edit, :update, :destroy]
  before_action :validate_length_sms, only: [:send_sms]
  before_action :validate_package, only: [:send_sms]
  # GET /notifications
  # GET /notifications.json
  def send_message
    @service = @current_user.services.where(id: params[:id]).take
    self.send(@service.method)
  end

  def index
    @notifications = @current_user.notifications
  end

  # GET /notifications/1
  # GET /notifications/1.json
  def show
  end

  # GET /notifications/new
  def new
    @notification = Notification.new
  end

  # GET /notifications/1/edit
  def edit
  end

  # POST /notifications
  # POST /notifications.json
  def create
    @notification = Notification.new(notification_params)

    respond_to do |format|
      if @notification.save
        format.html { redirect_to @notification, notice: 'Notification was successfully created.' }
        format.json { render :show, status: :created, location: @notification }
      else
        format.html { render :new }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notifications/1
  # PATCH/PUT /notifications/1.json
  def update
    respond_to do |format|
      if @notification.update(notification_params)
        format.html { redirect_to @notification, notice: 'Notification was successfully updated.' }
        format.json { render :show, status: :ok, location: @notification }
      else
        format.html { render :edit }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notifications/1
  # DELETE /notifications/1.json
  def destroy
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to notifications_url, notice: 'Notification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notification_params
      params.require(:notification).permit(:message, :receiver)
    end

    def validate_package
      @service = @current_user.operations.where(service_id: params[:id]).take
       if @service
        p @service.total 
          if !@service.ilimitado
            if @service.total <= 0
              validate_money()
            end
          end
       else
        validate_money()
       end
    end

    def validate_money
      render :json => {:message => 'No tienes Saldo'}
    end

    def validate_length_sms
      if params[:notification][:message].length > 160
        render :json => {:errors => 'the message can not be longer than 160 characters'}
      end
    end


    def send_sms
      @notification = Notification.new(notification_params)
      @notification.set_user = @current_user
      @notification.set_id_service = params[:id]
      if @notification.save
        encoded_url = URI.encode('https://apismsi.aldeamo.com/smsr/r/hcws/smsSendGet/Geotech/octubre2016*/'+ params[:notification][:receiver]+'/57/'+params[:notification][:message])
        res = RestClient.get encoded_url
        response = res.split('|')
        if response[0].to_i > 0
          @notification.update(sent: true, response: response[1])
        else
          @notification.update(sent: false, response: response[1])
        end 
        render :json => {:message => response[1]}
      else
        render :json => {:message => 'No se pudo enviar, intentelo nuevamente'}
      end
    end
end
