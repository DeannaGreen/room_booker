class CreateHomes < ActiveRecord::Migration[5.2]
  def change
    create_table :homes do |t|
      t.string :paragraph_1
      t.string :paragraph_2
      t.string :paragraph_3

      t.timestamps
    end
  end
end
