class ChangeQuantityDefault < ActiveRecord::Migration
  def up
  	change_column :line_items, :quantity, :integer, default: 1, null: false
  end

  def down
  	change_column :line_items, :quantity, :integer, default: 1
  end
end
