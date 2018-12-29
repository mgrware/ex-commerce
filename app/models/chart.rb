require "jwt"
class Chart < ApplicationRecord
  has_many :items
  has_one  :billing_address

  def create_token(data = {})
    payload = {name: data[:name], address: data[:address], email: data[:email], phone_number: data[:phone_number], card_number: data[:card_number], code: data[:code], amount: data[:amount]}
    token = JWT.encode payload, nil, 'none'
    return token
  end
end
