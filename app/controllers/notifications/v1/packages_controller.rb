class Notifications::V1::PackagesController < ApplicationController
    before_action :authenticate, only: [:create]
    
    def index
        @packages = Package.where(active: true)
    end

    def create
        @package = @current_user.packages.build(my_packages_params)

        if package.save
            render json: @package 
        else
            render :json => { :errors => package.errors.full_messages }, :status => 422
        end
    end

    def update
        @package = Package.find(params[:id])
        if @package.nil?
            render :json => { :errors => 'Este paquete no existe'}, :status => 404
        else
            if @package.update(my_packages_params)
                render :json => { :message => 'Paquete Actualizado', :package => @package}, :status => 200
            else
                render :json => { :errors => @package.errors.full_messages }, :status => 422
            end
            
        end
    end

    private
    def my_packages_params
        params.require(:package).permit(:name,:description,:price,:active)
    end


end