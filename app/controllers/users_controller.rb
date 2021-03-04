class UsersController < ApplicationController
    get '/signup' do 
        erb :'users/signup'
    end

    post '/signup' do
        user = User.new(params)
        if user.username.empty? || user.password.empty?
            @error = "Please enter valid username and password"
            erb :'users/signup'
        elsif User.find_by(username: user.username)
            @error = "That username already exits, please enter a valid username"
            erb :'users/signup'
        else
            user.save
            session[:user_id] = user.id
            redirect '/party_members'
        end
    end
end