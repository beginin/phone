class CreateLoads < ActiveRecord::Migration
  def change
    create_table :loads do |t|
      t.string :admin

      t.timestamps
    end
  end
end
