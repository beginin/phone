class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.date :datein
      t.date :dateout

      t.timestamps
    end
  end
end
