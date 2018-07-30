# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.decimal :total_price, precision: 10, scale: 2
      t.string :state
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
