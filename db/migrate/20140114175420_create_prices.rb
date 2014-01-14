class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.decimal :amount, :precision => 8, :scale => 2
      t.string :currency
      t.references :product, index: true

      t.timestamps
    end
  end
end
