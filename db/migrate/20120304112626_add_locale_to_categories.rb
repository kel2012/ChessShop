class AddLocaleToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :locale, :string
  end
end