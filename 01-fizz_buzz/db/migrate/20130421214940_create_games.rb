class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :user_id
      t.integer :score
      t.integer :time_to_finish
      t.integer :high_number

      t.timestamps
    end
  end
end
