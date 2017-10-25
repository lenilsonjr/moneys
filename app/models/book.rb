class Book < ApplicationRecord

  validates_presence_of :name
  validates_presence_of :kind
  validates_presence_of :main_currency
  
  def self.available_kinds
    %w[ Conta\ Pessoal Microempreendedor Pequena\ Empresa Condomínio Finanças\ Da\ Casa Finanças\ Do\ Casal Outro ]
  end

end
