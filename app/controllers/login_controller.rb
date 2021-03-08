class LoginController < ApplicationController

    get '/login' do
        erb :'users/login'
    end

     
        #if params["username"].empty? || params["password_digest"].empty?
            #@error = "Please enter valid username and password"
            #erb :'users/login'
        #else
        #end
    post '/login' do
            user = User.find_by(username: params["username"])
            if user && user.authenticate(params[:password])
                session[:user_id] = user.id
                redirect '/party_members'
                
            else
                @error = "That adventurer doesn't exist"
                erb :'users/login' 
            end
    end

    get '/logout' do
        session.clear
        redirect '/'
    end

end