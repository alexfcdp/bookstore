# frozen_string_literal: true

class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.decimal :price, precision: 8, scale: 2
      t.integer :quantity
      t.belongs_to :book, index: true
      t.belongs_to :order, index: true

      t.timestamps
    end
  end
end
