class CreateColorsProducts < ActiveRecord::Migration
  def change
    create_table :colors_products, :id => false do |t|
      t.references :color, :product
    end

    add_index :colors_products, [:color_id, :product_id],
      name: "colors_products_index"
  end
end
