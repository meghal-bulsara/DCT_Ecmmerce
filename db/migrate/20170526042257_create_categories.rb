class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.timestamps
      #t.datetime :created_at
      #t.datetime :updated_at
    end
  end
end
