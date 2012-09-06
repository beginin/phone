class CreateHollydays < ActiveRecord::Migration
  def change
    create_table :hollydays do |t|
      t.date :hollyday

      t.timestamps
    end
  end
end
