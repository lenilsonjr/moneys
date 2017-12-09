class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :target_account, class_name: 'Account', optional: true
  belongs_to :category
  
  belongs_to :parent, class_name: 'Transaction', optional: true, foreign_key: :parent_transaction_id
  has_many :children, class_name: 'Transaction', foreign_key: :parent_transaction_id, dependent: :destroy

  monetize :amount_cents

  validates_presence_of :date, :amount_cents, :recurrence_type

  def color
    self.category.color
  end

  def self.available_kinds
    [
      [self.match_kind(:income), :income],
      [self.match_kind(:expense), :expense],
    ]
  end

  def self.match_kind(kind)
    case kind
      when 'income', :income
        'Entrada'
      when 'expense', :expense
        'Saída'
    end
  end

  def self.available_recurrences
    [
      [self.match_recurrence(:none), :none],
      [self.match_recurrence(:monthly), :monthly],
    ]
  end

  def self.match_recurrence(recurrence)
    case recurrence
      when 'none', :none
        'Nenhuma'
      when 'monthly', :monthly
        'Mensal'
    end
  end

end
