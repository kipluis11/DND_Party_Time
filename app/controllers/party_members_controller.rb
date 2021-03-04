class PartyMembersController < ApplicationController
    # Create

        #New
        # make a 'GET' request to '/party_members/new' 
        get '/party_members/new' do 
            erb :'party_members/new' 
         end
     
         #Create
         # make a 'POST' request to '/party_members'
        post '/party_members' do
            party_member = PartyMember.new(params)
            if !party_member.name.empty? && !party_member.race.empty?
                 party_member.save
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
            
             @party_members = PartyMember.all
             erb :'party_members/index'
         end
         # Show
         # make a 'GET' request to '/party_members/:id' - shows a single party member
         get '/party_members/:id' do
            @party_member = PartyMember.find(params[:id])
             erb :'party_members/show'
         end
     # Update
 
         #Edit form
         # make a 'GET' request to '/party_members/:id/edit'
         get '/party_members/:id/edit' do 
            @party_member = PartyMember.find(params[:id])
            erb :'/party_members/edit'
         end

 
         #Update
         # make a 'PUT/PATCH' request to '/party_members/:id'
         patch '/party_members/:id' do
            @party_member = PartyMember.find(params[:id])
            if !params["party_member"]["name"].empty? && !params["party_member"]["race"].empty? && !params["party_member"]["equipment"].empty? && !params["party_member"]["background"].empty?  
                @party_member.update(params["party_member"])
                redirect "/party_members"
          else
                @error = "Invalid data, please add valid Name and Race."
                erb :'party_members/edit'
           end
            party_member.update(name: params["name"], race: params["race"], equipment: params["equipment"], background: params["background"])
         end

       

 
     # Delete
         # make a 'DELETE' request to '/party_members/:id'
         delete '/party_members/:id' do
            
            party_member = PartyMember.find(params[:id])
            party_member.destroy
            redirect '/party_members'
            
         end
end