class CreateInstructions < ActiveRecord::Migration[6.0]
  def change
    create_table :instructions do |t|
      t.text :content
      t.integer :step_number
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
