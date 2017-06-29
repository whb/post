json.extract! payer, :id, :code, :name, :brief_name, :status, :created_at, :updated_at
json.url payer_url(payer, format: :json)
