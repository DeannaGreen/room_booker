class AddUserToRoombooking < ActiveRecord::Migration[5.2]
  def change
    add_column :roombookings, :user, :string
  end
end
