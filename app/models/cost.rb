class Cost < ApplicationRecord
  belongs_to :payee
  belongs_to :income
end
