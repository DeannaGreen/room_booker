class CreateRoombookings < ActiveRecord::Migration[5.2]
  def change
    create_table :roombookings do |t|
      t.integer :roomid
      t.datetime :starttime
      t.datetime :endtime

      t.timestamps
    end
  end
end
