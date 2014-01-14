class CreateProductsSizes < ActiveRecord::Migration
  def change
    create_table :products_sizes, :id => false do |t|
      t.references :product, :size
    end

    add_index :products_sizes, [:product_id, :size_id],
      name: "products_sizes_index"
  end
end
