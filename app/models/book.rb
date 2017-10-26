class Book < ApplicationRecord

  has_many :accounts
  has_many :categories
  
  validates_presence_of :name
  validates_presence_of :kind
  validates_presence_of :main_currency
  
  def self.available_kinds
    [
      ["Conta Pessoal", :personal],
      ["Microempreendedor", :freelancer],
      ["Pequena Empresa", :small_business],
      ["Condomínio", :condominium],
      ["Finanças da Casa", :house_finances],
      ["Finanças do Casal", :couple_finances],
      ["Outro", :other]
    ]
  end

end
