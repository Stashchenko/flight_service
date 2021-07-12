# frozen_string_literal: true

class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.string :airline
      t.string :source_airport
      t.string :destination_airport
      t.string :code_share
      t.integer :stops
      t.string :equipment
      t.references :provider, null: false, foreign_key: true

      t.timestamps
    end
  end
end
