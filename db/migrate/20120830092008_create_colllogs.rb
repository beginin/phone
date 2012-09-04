class CreateColllogs < ActiveRecord::Migration
  def change
    create_table :colllogs do |t|
      t.integer :load_id
      t.datetime :date
      t.decimal :duration
      t.decimal :coast
      t.integer :tnumber_out
      t.integer :tnumber_in
      t.integer :typecall_id
      t.integer :decriptioncall_id
      t.integer :typeconnect_id
      t.integer :base
      t.decimal :valuemb

      t.timestamps
    end
  end
end
