class CreateColllogs < ActiveRecord::Migration
  def change
    create_table :colllogs do |t|
      t.column :tnumber, 'BIGINT'
      t.integer :load_id
      t.datetime :date
      t.time :duration 
      t.decimal :coast ,:precision => 8, :scale => 2
      t.integer :tnumber_out , :limit => 8
      t.integer :tnumber_in , :limit => 8
      t.integer :typecall_id
      t.integer :descriptioncall_id
      t.integer :typeconnect_id
      t.integer :base
      t.decimal :valuemb ,:precision => 8, :scale => 2

      t.timestamps
    end
  end
end
