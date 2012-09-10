class ChangeTnumber < ActiveRecord::Migration
  def up
    change_table :tnumbers do |t|
      t.change :voicenumber,  'BIGINT'
    end
  end

  def down
    remove_column :tnumbers, :voicenumber
    add_column :tnumbers, :voicenumber, :integer
  end
end
