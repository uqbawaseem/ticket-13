class CreateSuggestions < ActiveRecord::Migration[7.0]
  def change
    create_table :suggestions do |t|
      t.integer :suggestionable_id
      t.string :suggestionable_type
      t.string :suggestion

      t.timestamps
    end
  end
end
