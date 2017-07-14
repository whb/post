json.extract! payee, :id, :code, :name, :brief_name, :status, :created_at, :updated_at
json.url payee_url(payee, format: :json)
