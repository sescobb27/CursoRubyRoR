class AddBarCodeToProduct < ActiveRecord::Migration
  def change
    add_column :products, :bar_code, :integer, unique: true
  end
end
