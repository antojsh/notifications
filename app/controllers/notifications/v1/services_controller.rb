class Notifications::V1::ServicesController < ApplicationController
    before_action :authenticate
    #before_action :is_admin, only: [:create, :update, :destroy]
    before_action :get_service, only: [:show, :update, :destroy]
    
    def index
        @services = Service.all
    end

    def create
        service = Service.new(service_params)
        if service.save
            render :json => {:message => 'Servicio creado satisfactoriamente ', :service => service}
        else
            render :json => { :errors => service.errors.full_messages }, :status => 422
        end
    end

    def show
    end

    def update
        if @service.update(service_params)
            render :json => {:message => 'Servicio actualizado satisfactoriamente ', :service => @service}
        else
            render :json => { :errors => @service.errors.full_messages }, :status => 422
        end
    end

    def destroy
        @service.destroy
        render :json => {:message => 'Servicio eliminado'}
    end


    private
    def get_service
        begin
          @service = Service.find(params[:id])
        rescue ActiveRecord::RecordNotFound => e
          render :json => {:message => 'Service not found'}
        end
    end

    def is_admin
        if @current_user.user_type != 'admin'
            render :json => {:message => 'Necesitas permisos de administracion'}
        end
    end

    def service_params
        params.require(:service).permit(:name, :description, :total, :price, :method, :ilimitado)
    end
end