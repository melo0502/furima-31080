class AddressOrder
  include ActiveModel::Model
  attr_accessor :ship_form_id, :postal_code, :phone_number, :municipality, :address, :building_name, :user_id, :item_id, :token

  with_options presence: true do
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: "is invalid. Input full-width characters."}
    validates :municipality, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :postal_code, format:  {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :address
    validates :ship_form_id
    validates :token
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, phone_number: phone_number, municipality: municipality, address: address, building_name: building_name, ship_form_id: ship_form_id, order_id: order.id)
  end
end
