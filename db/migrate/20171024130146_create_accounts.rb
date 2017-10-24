class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :description
      t.string :type
      t.string :logo
      t.string :balance_cents
      t.string :currency
      t.belongs_to :book, foreign_key: true

      t.timestamps
    end
  end
end
