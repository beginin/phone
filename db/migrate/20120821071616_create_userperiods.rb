class CreateUserperiods < ActiveRecord::Migration
  def change
    create_table :userperiods do |t|
      t.timestamp :datein
      t.timestamp :dateout

      t.timestamps
    end
  end
end
