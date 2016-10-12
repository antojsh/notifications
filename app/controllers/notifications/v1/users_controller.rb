class Notifications::V1::UsersController < ApplicationController
    

    def create
        user = User.new({
            :name => params[:name],
            :last_name => params[:last_name],
            :identification => params[:identification],
            :email => params[:email]
        })

        if user.save
            render json: User.last
        else
            render :json => { :errors => user.errors.full_messages }, :status => 422
        end
    end


    def login
        user = User.find_by(api_key: params[:api_key], api_secret: params[:api_secret])
        
        if user.nil?
            render :json => { error: 'Las credenciales no son validas '}, :status => 403
        else
            @token_user = user.tokens.create()
        end
        
    end
end