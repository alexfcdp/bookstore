# frozen_string_literal: true

class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.string :number
      t.string :card_owner
      t.string :expiry_date
      t.belongs_to :user, foreign_key: true
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
