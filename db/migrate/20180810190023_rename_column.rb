class RenameColumn < ActiveRecord::Migration[5.2]
  def change
  	rename_column :roombookings, :user, :user_id
  end
end
