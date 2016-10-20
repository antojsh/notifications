require 'rest-client'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  def authenticate
    token_str = params[:token]
    token = Token.find_by(token: token_str)

    if token.nil? || !token.token_is_valid?
        render json: { error: 'Tu token es invalido' }, :status => 403
    else
        @current_user = token.user
    end
  end
end
