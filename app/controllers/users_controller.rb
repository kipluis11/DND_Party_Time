class UsersController < ApplicationController
    get '/signup' do 
        erb :'users/signup'
    end

    post '/signup' do
        user = User.new(params)
        if user.username.empty? || user.password_digest.empty?
            @error = "Please enter valid username and password"
            erb :'users/signup'
        elsif User.find_by(username: user.username)
            @error = "That adventurer already exits, please enter a different username for your adventurer"
            erb :'users/signup'
        else
            user.save #- not using this at this time
            session[:user_id] = user.id
            redirect '/party_members'
        end
    end
end