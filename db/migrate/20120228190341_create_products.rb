class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :category_id
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
