class CreatePercentages < ActiveRecord::Migration
  def change
    create_table :percentages do |t|
      t.float :percent
      t.references :country, index: true

      t.timestamps null: false
    end
    add_foreign_key :percentages, :countries
  end
end
