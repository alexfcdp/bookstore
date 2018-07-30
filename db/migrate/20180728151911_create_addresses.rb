# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :firstname
      t.string :lastname
      t.string :address
      t.string :city
      t.string :zip
      t.string :phone
      t.string :address_type
      t.references :addressable, polymorphic: true

      t.timestamps
    end
  end
end
