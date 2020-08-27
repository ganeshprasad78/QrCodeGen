class RemoveFieldFromProduct < ActiveRecord::Migration[6.0]
  def change
  	remove_column :products, :price
  	remove_column :products, :description
  	remove_column :products, :name
  	remove_column :products, :package
  	remove_column :products, :data_sheet_url
  	remove_column :products, :safety_sheet_url
  end
end
