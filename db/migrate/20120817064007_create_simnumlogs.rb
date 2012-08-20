class CreateSimnumlogs < ActiveRecord::Migration
  def change
    create_table :simnumlogs do |t|
      t.integer :tnumber_id
      t.integer :sim_id
      t.integer :simperiod_id

      t.timestamps
    end
  end
end
