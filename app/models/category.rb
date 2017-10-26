class Category < ApplicationRecord
  belongs_to :book
  belongs_to :parent, class_name: 'Category', foreign_key: :parent_id, optional: true
  has_many :children, class_name: 'Category', foreign_key: :parent_id, dependent: :destroy

  validates_presence_of :name, :color, :kind

  scope :top_level, -> { where(parent_id: nil) }

  def kind_color
    case kind
      when 'income', :income
        'success'
      when 'expense', :expense
        'danger'
      when 'investment', :investment
        'info'
    end
  end

  def self.parents_available
    self.where(parent_id: nil)
  end

  def self.available_kinds
    [
      [self.match_kind(:income), :income],
      [self.match_kind(:expense), :expense],
      [self.match_kind(:investment), :investment]      
    ]
  end

  def self.match_kind(kind)
    case kind
      when 'income', :income
        'Entrada'
      when 'expense', :expense
        'Saída'
      when 'investment', :investment
        'Investimento'
    end
  end

  def self.available_colors
    [
      '#ac725e',
      '#d06b64',
      '#f83a22',
      '#fa573c',
      '#ff7537',
      '#ffad46',
      '#42d692',
      '#16a765',
      '#7bd148',
      '#b3dc6c',
      '#fbe983',
      '#fad165',
      '#92e1c0',
      '#9fe1e7',
      '#9fc6e7',
      '#4986e7',
      '#9a9cff',
      '#b99aff',
      '#c2c2c2',
      '#cabdbf',
      '#cca6ac',
      '#f691b2',
      '#cd74e6',
      '#a47ae2'
    ]
  end

end
