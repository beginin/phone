class CreateOperators < ActiveRecord::Migration
  def change
    create_table :operators do |t|
      t.string :opername

      t.timestamps
    end
  end
end
