class Payee < ApplicationRecord
  validates :code, :name, presence: true
  validates :code, :name, uniqueness: true
end
