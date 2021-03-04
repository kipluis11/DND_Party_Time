class LoginController < ApplicationController

    get '/login' do
        erb :'users/login'
    end

    post '/login' do 
        if params["username"].empty? || params["password"].empty?
            @error = "Please enter valid username and password"
            erb :'users/login'
        else
            if user = User.find_by(username: params["username"], password: params["password"])
                session[:user_id] = user.id
                redirect '/party_members'
            else
                @error = "That username already exits, please enter a valid username"
                erb :'users/login' 
            end
       
        end
    end

    get '/logout' do
        session.clear
        redirect '/'
    end

end