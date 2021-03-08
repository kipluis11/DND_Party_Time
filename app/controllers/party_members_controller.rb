class PartyMembersController < ApplicationController
    # Create

        #New
        # make a 'GET' request to '/party_members/new' 
        get '/party_members/new' do
            if logged_in? 
                erb :'party_members/new'
            else 
                redirect '/login'
            end 
        end
     
         #Create
         #!!!!!! I added "/:user_id" to all af the code to try and fix the issue of making edits only available to the User's players.
         #!!!! The user_id didn't work and broke the code ... to Google and review of lessons we go.  
         # make a 'POST' request to '/party_members'
        post '/party_members' do
            @party_member = current_user.party_members.build(params)
            if !@party_member.name.empty? && !@party_member.race.empty?
                 @party_member.save
                 redirect '/party_members'
           else
                 @error = "Invalid data, please add valid Name and Race."
                 erb :'party_members/new'
            end
        end
 #
     # Read
 
         # Index
         # make a 'GET' request to '/party_members' - shows all
         get '/party_members' do
            if logged_in?
              @party_members = PartyMember.all
              erb :'party_members/index'
            else 
                redirect '/login'
            end
         end
         # Show
         # make a 'GET' request to '/party_members/:id' - shows a single party member
         get '/party_members/:id' do
            if logged_in?
                @party_member = PartyMember.find_by(id: params[:id])
                if @party_member
                    erb :'party_members/show'
                else
                    redirect '/party_members'
                end
            else
                redirect '/login'
            end
         end
     # Update
 
         #Edit form
         # make a 'GET' request to '/party_members/:id/edit'
         get '/party_members/:id/edit' do
            if logged_in? 
                @party_member = PartyMember.find(params[:id])
                erb :'/party_members/edit'
            else
                redirect '/login'
            end
         end

 
         #Update
         # make a 'PUT/PATCH' request to '/party_members/:id'
         patch '/party_members/:id' do
            @party_member = PartyMember.find(params[:id])
            if !params["party_member"]["name"].empty? && !params["party_member"]["race"].empty? && !params["party_member"]["equipment"].empty? && !params["party_member"]["background"].empty?  
                @party_member.update(params["party_member"])
                redirect "/party_members/:id"
          else
                @error = "Invalid data, please add valid Name and Race."
                erb :'party_members/edit'
           end
            @party_member.update(name: params["name"], race: params["race"], equipment: params["equipment"], background: params["background"])
         end

       

 
     # Delete
         # make a 'DELETE' request to '/party_members/:id'
         delete '/party_members/:id' do
           
            party_member = PartyMember.find(params[:id])
            party_member.destroy
            redirect '/party_members'
         end
    
end