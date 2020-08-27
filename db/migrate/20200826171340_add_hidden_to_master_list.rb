class AddHiddenToMasterList < ActiveRecord::Migration[6.0]
  def change
  	add_column :master_lists, :name_hidden, :boolean, default: false, null: false
  	add_column :master_lists, :application_hidden, :boolean, default: false, null: false
  	add_column :master_lists, :package_hidden, :boolean, default: false, null: false
  	add_column :master_lists, :data_sheet_hidden, :boolean, default: false, null: false
  	add_column :master_lists, :safety_sheet_hidden, :boolean, default: false, null: false
  	add_column :products, :manufacturing_date_hidden, :boolean, default: false, null: false
  	add_column :products, :product_code_hidden, :boolean, default: false, null: false
  end
end
