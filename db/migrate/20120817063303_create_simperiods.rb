class CreateSimperiods < ActiveRecord::Migration
  def change
    create_table :simperiods do |t|
      t.timestamp :datein
      t.timestamp :dateout

      t.timestamps
    end
  end
end
