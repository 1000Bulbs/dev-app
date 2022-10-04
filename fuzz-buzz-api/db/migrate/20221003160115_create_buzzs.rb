class CreateBuzzs < ActiveRecord::Migration[7.0]
  def change
    create_table :buzzs do |t|
      t.string :name

      t.timestamps
    end
  end
end
