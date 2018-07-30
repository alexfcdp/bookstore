# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.decimal :price, precision: 6, scale: 2
      t.integer :quantity
      t.string :materials
      t.string :dimensions
      t.integer :published_at

      t.timestamps
    end
  end
end
