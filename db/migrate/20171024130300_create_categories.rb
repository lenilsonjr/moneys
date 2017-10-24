class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :color
      t.string :type
      t.integer :parent_id
      t.belongs_to :book, foreign_key: true

      t.timestamps
    end
  end
end
