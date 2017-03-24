json.extract! user, :id, :username, :displayname, :password_digest, :enabled, :organization_id, :created_at, :updated_at
json.url user_url(user, format: :json)
