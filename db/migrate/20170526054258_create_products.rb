class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :price
      t.integer :category_id
      t.integer :stock
      t.boolean :cod_eligibility, default: true
      #arguments for methods we use colon before, option for the method we use colon after
      t.string :image_url

      t.timestamps
    end
  end
end
