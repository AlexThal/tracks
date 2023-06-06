class ChangeCategoryIdToBeOptionalForBlocks < ActiveRecord::Migration[7.0]
  def change
    change_column :blocks, :category_id, :integer, null: true
  end
end
