class Payee < ApplicationRecord
  validates :code, :name, presence: true
  validates :code, :name, uniqueness: true

   def code_name
  	return code + " " + name
  end
end
