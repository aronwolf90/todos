class AddCheckedToItems < ActiveRecord::Migration[8.0]
  def change
    add_column :items, :checked, :boolean
  end
end
