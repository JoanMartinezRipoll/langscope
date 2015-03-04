class CreateLanguageEntities < ActiveRecord::Migration
  def change
    create_table :language_entities do |t|
      t.string :name
      t.string :street
      t.string :plz
      t.string :email
      t.references :country, index: true

      t.timestamps null: false
    end
    add_foreign_key :language_entities, :countries
  end
end
