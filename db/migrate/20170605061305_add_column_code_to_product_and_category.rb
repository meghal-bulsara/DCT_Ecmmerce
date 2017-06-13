class AddColumnCodeToProductAndCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :code, :string
    add_column :categories, :code, :string
  end
end
