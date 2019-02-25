class CreateKvs < ActiveRecord::Migration[5.2]
  def change
    create_table :kvs do |t|
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
