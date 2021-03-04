class User < ActiveRecord::Base
    has_many :party_members
end