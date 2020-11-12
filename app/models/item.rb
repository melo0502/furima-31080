class Item < ApplicationRecord
  with_options presence: true do
    validates :title        
    validates :explanation        
    validates :category_id 
    validates :status_id        
    validates :delivery_fee_id        
    validates :ship_form_id
    validates :delivery_days_id
    validates :image
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end

  with_options numericality: { other_than: 1 } do
    validates :delivery_days_id 
    validates :delivery_fee_id 
    validates :category_id
    validates :ship_form_id      
    validates :status_id
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_days
  belongs_to :delivery_fee
  belongs_to :category
  belongs_to :ship_form
  belongs_to :status
end
