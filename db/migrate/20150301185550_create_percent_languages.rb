class CreatePercentLanguages < ActiveRecord::Migration
  def change
    create_table :percent_languages do |t|
      t.references :percentage, index: true
      t.references :language, index: true
      
      t.timestamps null: false
    end
    add_foreign_key :percent_languages, :percentages
    add_foreign_key :percent_languages, :languages
  end
end
