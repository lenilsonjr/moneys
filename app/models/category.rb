class Category < ApplicationRecord
  belongs_to :book
  belongs_to :parent, class_name: 'Category', foreign_key: :parent_id
  has_many :children, class_name: 'Category', foreign_key: :parent_id
end
