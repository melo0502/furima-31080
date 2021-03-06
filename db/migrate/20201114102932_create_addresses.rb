class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table   :addresses do |t|
      t.integer    :ship_form_id,    null: false
      t.integer    :postal_code,     null: false
      t.string     :phone_number ,   null: false
      t.string     :municipality,    null: false
      t.string     :address,         null: false
      t.string     :building_name
      t.references :order,                        null: false, foreign_key: true
      t.timestamps
    end
  end
end
