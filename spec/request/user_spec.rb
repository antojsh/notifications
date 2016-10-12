require "rails_helper"

RSpec.describe Notifications::V1::UsersController, :type => :request do
  describe "POST /users" do
    it { have_http_status(200) }
    
    it "Create New User" do
      user = {name:"Antonio" ,last_name:"Sierra",identification:"6544i6546",email:"antoniojsh93@gmail.com"}
      expect{
        post '/notifications/v1/users', user
      }.to change(User, :count).by(1)
    end

    it "No deberia crear un usuario sin los parametros" do
      expect{
        post '/notifications/v1/users'
      }.to change(User, :count).by(0)
    end
  end

  # describe "POST /users/login" do
  #   it { have_http_status(200) }
  #   it "No se envian las credenciales" do
  #    expect{
  #       post '/notifications/v1/users/login'
  #     }.to have_http_status(403)
  #   end
  # end
end