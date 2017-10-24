class RenameTypes < ActiveRecord::Migration[5.1]
  def change

    rename_column :accounts, :type, :kind    
    rename_column :categories, :type, :kind
    rename_column :books, :type, :kind
    
  end
end
