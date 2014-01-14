class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :company
      t.integer :count
      t.boolean :published, default: false

      t.timestamps
    end
  end
end
