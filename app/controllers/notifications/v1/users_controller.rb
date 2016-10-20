class Notifications::V1::UsersController < ApplicationController
    

    def create
        user = User.new(users_params)

        if user.save
            render json: User.last
        else
            render :json => { :errors => user.errors.full_messages }, :status => 422
        end
    end
    def update
        @user = User.find(params[:id])
        if @user.nil?
            render :json => { :errors => 'Usuario no existe'}, :status => 404
        else
            if @user.update(users_params)
                render :json => { :message => 'Usuario Actualizado', :package => @user}, :status => 200
            else
                render :json => { :errors => @user.errors.full_messages }, :status => 422
            end
            
        end
    end

    def login
        @user = User.find_by(login_params)
        
        if @user.nil?
            render :json => { error: 'Las credenciales no son validas '}, :status => 403
        else
            @token_user = @user.tokens.create()
        end
        
    end

    private 

    def users_params
        params.require(:user).permit(:name, :last_name, :identification, :email,:package_id)
    end

    def login_params
        params.require(:login).permit(:api_key, :api_secret)
    end

end