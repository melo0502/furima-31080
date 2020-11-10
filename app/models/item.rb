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

  validates :delivery_days_id, numericality: { other_than: 1 } 
  validates :delivery_fee_id,  numericality: { other_than: 1 } 
  validates :category_id,      numericality: { other_than: 1 } 
  validates :ship_form_id,     numericality: { other_than: 1 } 
  validates :status_id,        numericality: { other_than: 1 } 

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_day
  belongs_to :delivery_fee
  belongs_to :detail
  belongs_to :ship_form
  belongs_to :status
end
