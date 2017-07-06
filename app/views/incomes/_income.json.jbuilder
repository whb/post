json.extract! income, :id, :code, :payer_id, :abstract, :bill_date, :account_date, :income_amount, :settlement_amount, :invoice_date, :invoice_num, :tax_rate, :explain, :discount_rate, :available_amount, :created_at, :updated_at
json.url income_url(income, format: :json)
