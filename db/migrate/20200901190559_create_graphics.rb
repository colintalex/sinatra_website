class CreateGraphics < ActiveRecord::Migration[6.0]
  def change
    create_table :graphics do |t|
      t.string :image
      t.string :date
      t.string :description
      t.integer :work_hours
    end
  end
end
