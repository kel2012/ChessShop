class AddPriceToProducts < ActiveRecord::Migration
  def change
    add_column(:products, :price, :float, :precision => 4, :scale => 2)
  end
end
