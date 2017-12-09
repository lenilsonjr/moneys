class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.string :description
      t.string :kind
      t.date :date
      t.date :due_at
      t.string :amount_cents
      t.string :currency
      t.belongs_to :parent_transaction, foreign_key: false
      t.string :recurrence_type
      t.integer :installment
      t.belongs_to :account, foreign_key: false, polymorphic: true
      t.belongs_to :target_account, foreign_key: false, polymorphic: true
      t.belongs_to :category, foreign_key: true

      t.timestamps
    end
  end
end
