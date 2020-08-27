class AddMasterListToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :master_list_id, :integer, null: false
  end
end
