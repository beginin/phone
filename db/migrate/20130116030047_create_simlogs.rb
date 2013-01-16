class CreateSimlogs < ActiveRecord::Migration
  def change
    create_table :simlogs do |t|
      t.integer :sim_id
      t.integer :user_id
      t.integer :period_id
      t.boolean :pda

      t.timestamps
    end
  end
end
