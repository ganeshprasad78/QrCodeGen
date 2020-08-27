class CreateMasterLists < ActiveRecord::Migration[6.0]
  def change
    create_table :master_lists do |t|
      t.string :name
      t.text :application
      t.belongs_to :user, null: false, foreign_key: true
      t.string :package
      t.string :data_sheet_url
      t.string :safety_sheet_url
      t.boolean :archived, default: false, null: false

      t.timestamps
    end
  end
end
