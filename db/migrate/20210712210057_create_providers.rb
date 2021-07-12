# frozen_string_literal: true

class CreateProviders < ActiveRecord::Migration[6.1]
  def change
    create_table :providers do |t|
      t.string :name

      t.timestamps
    end
  end
end
