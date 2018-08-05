class AddDescriptionToRoombooking < ActiveRecord::Migration[5.2]
  def change
    add_column :roombookings, :description, :string
  end
end
