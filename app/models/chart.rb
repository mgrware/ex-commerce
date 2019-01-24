require "jwt"
require "net/http"
class Chart < ApplicationRecord
  has_many :items
  has_one  :billing_address

  def create_token(data = {})
    payload = {name: data[:name], address: data[:address], email: data[:email], phone_number: data[:phone_number], card_number: data[:card_number], code: data[:code], amount: data[:amount]}
    token = JWT.encode payload, nil, 'none'
    url                        = "http://localhost:3000/api/v1/partner/transactions"
    uri                        = URI.parse(url)
    http                       = Net::HTTP.new(uri.host, uri.port)
    response                   = http.post(uri.path, payload.to_json, {"Content-Type"  => "application/json"})
    return token
  end
end
