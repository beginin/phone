class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :secondname
      t.string :midlename
      t.string :job

      t.timestamps
    end
  end
end
