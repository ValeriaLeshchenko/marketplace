class ChangeProductPublishedDefault < ActiveRecord::Migration
  def up
    change_column_default :products, :published, true
  end

  def down
    change_column_default :products, :published, false
  end
end
