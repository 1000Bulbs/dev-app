class CreateFizzBuzzs < ActiveRecord::Migration[7.0]
  def change
    create_table :fizz_buzzs do |t|
      t.string :name

      t.timestamps
    end
  end
end
