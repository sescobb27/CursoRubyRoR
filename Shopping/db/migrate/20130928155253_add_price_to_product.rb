class AddPriceToProduct < ActiveRecord::Migration
  def change
    add_column :products, :price, :float, presence: true
  end
end
