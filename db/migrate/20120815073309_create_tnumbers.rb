class CreateTnumbers < ActiveRecord::Migration
  def change
    create_table :tnumbers do |t|
      t.integer :voicenumber
      t.integer :sortnumber
      t.boolean :block
      t.integer :tarif_id
      t.timestamps
    end
  end
end
