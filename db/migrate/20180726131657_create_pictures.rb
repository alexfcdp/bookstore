# frozen_string_literal: true

class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.references :imageable, polymorphic: true
      t.string :file

      t.timestamps
    end
  end
end
