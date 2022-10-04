class CreateFizzs < ActiveRecord::Migration[7.0]
  def change
    create_table :fizzs do |t|
      t.string :name

      t.timestamps
    end
  end
end
