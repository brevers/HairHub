json.extract! plan, :id, :title, :description, :image, :price, :created_at, :updated_at
json.url plan_url(plan, format: :json)