require './config/environment'

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride  #aloows to use Patch and Put requests
use UsersController
use LoginController
use PartyMembersController  #needed to mount this/ALL controllers to use them.  Will have to mount others as well. 
run ApplicationController
