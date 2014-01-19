class CreateProductsTags < ActiveRecord::Migration
  def change
    create_table :products_tags, :id => false do |t|
      t.references :product, :tag
    end

    add_index :products_tags, [:product_id, :tag_id],
      name: "products_tags_index"
  end
end
