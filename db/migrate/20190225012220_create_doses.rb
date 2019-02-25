class CreateDoses < ActiveRecord::Migration[5.2]
  def change
    create_table :doses do |t|
      t.string :species
      t.float :pump_time

      t.timestamps
    end
  end
end
