require "jwt"
require "net/http"
class Chart < ApplicationRecord
  has_many :items
  has_one  :billing_address

  def create_token(data = {})
    params = {name: data[:name], address: data[:address], email: data[:email], phone_number: data[:phone_number], card_number: data[:card_number], code: data[:code], amount: data[:amount]}
    payload = {username: "tokovidia@gmail.com", secret_key: "58862ee8c639bb485e9e6b1bcf5b487a"}

    token = JWT.encode payload, "oFXxTQGCeL", "HS256"

    url                        = "http://localhost:3000/api/v1/partner/transactions"
    uri                        = URI.parse(url)
    http                       = Net::HTTP.new(uri.host, uri.port)
    response                   = http.post(uri.path, params.to_json, {"Content-Type"  => "application/json", "Token" => token, "auth_key" => "HvOsNCLZDSquVyvKPnBP5OCRVqif1fNUFCTTa5s0Qd04k90aXn"})
    result = JSON.parse(response.body)
    self.billing_address.update_attributes(va_number: result["data"]["va_number"])
  end
end
