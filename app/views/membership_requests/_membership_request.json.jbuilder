json.extract! membership_request, :id, :user_id, :club_id, :approved, :created_at, :updated_at
json.url membership_request_url(membership_request, format: :json)
