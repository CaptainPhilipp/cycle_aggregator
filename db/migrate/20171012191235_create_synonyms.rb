class CreateSynonyms < ActiveRecord::Migration[5.1]
  def change
    create_table :synonyms do |t|
      t.string :value, null: false
      t.references :owner, polymorphic: true, null: false

      t.timestamps
    end

    change_column_null :synonyms, :owner_type, false
  end
end