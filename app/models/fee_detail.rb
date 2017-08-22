class FeeDetail < ApplicationRecord
  belongs_to :fee
  belongs_to :income
end
