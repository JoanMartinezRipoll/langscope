class CreateLanguageOffers < ActiveRecord::Migration
  def change
    create_table :language_offers do |t|
      t.references :school, index: true
      t.references :language, index: true
      t.string :level
      t.integer :price

      t.timestamps null: false
    end
    add_foreign_key :language_offers, :schools
    add_foreign_key :language_offers, :languages
  end
end
