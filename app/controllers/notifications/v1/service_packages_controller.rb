class Notifications::V1::ServicePackagesController < ApplicationController
    before_action :authenticate
    before_action :is_admin, only: [:create, :update, :destroy, :index]

    def index

    end

    private 

    def set_parameteres
        params.require(:services_packages).permit(:id, :description)
    end
end