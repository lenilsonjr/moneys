class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :type
      t.string :logo
      t.string :main_currency

      t.timestamps
    end
  end
end
