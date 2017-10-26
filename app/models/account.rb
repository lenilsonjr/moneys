class Account < ApplicationRecord
  belongs_to :book

  def self.available_kinds
    [
      ["Conta Corrente", :checking],
      ["Conta Investimento", :investment],
      ["Caixinha", :box],      
      ["Outro", :other]
    ]
  end

end
