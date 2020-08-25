class AddProductDetailsToProduct < ActiveRecord::Migration[6.0]
  def change
  	add_column :products, :package, :string
  	add_column :products, :manufacturing_date, :date
  	add_column :products, :product_code, :string
  	add_column :products, :data_sheet_url, :string
  	add_column :products, :safety_sheet_url, :string
  end
end
