class User < ActiveRecord::Base
    has_many :party_members
    has_secure_password
end