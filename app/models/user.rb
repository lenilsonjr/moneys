class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :main_currency
  has_many :books
  after_create :create_book

  private
    def create_book
      self.books.create(
                        name: 'Finanças Pessoais', 
                        kind: :personal, 
                        main_currency: self.main_currency
                       )
    end

end
