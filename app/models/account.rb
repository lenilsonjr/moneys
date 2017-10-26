class Account < ApplicationRecord
  belongs_to :book

  validates_presence_of :name
  validates_presence_of :kind
  validates_presence_of :currency
  validates_presence_of :logo
  
  def self.available_kinds
    [
      ["Conta Corrente", :checking],
      ["Conta Investimento", :investment],
      ["Caixinha", :box],      
      ["Outro", :other]
    ]
  end

end
