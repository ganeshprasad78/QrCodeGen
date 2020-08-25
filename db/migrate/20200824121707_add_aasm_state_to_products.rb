class AddAasmStateToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :aasm_state, :string
  end
end
