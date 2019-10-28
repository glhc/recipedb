class CreateJoinTableInstructionRecipe < ActiveRecord::Migration[6.0]
  def change
    create_join_table :instructions, :recipes do |t|
      # t.index [:instruction_id, :recipe_id]
      # t.index [:recipe_id, :instruction_id]
    end
  end
end
