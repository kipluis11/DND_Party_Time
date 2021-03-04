class PartyMembers < ActiveRecord::Migration[5.2]
  def change
        create_table :party_members do |t|
          t.string :name
          t.string :race
          t.string :equipment
          t.string :background
          t.integer :user_id 
    end
  end
end
