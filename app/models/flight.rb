# frozen_string_literal: true

class Flight < ApplicationRecord
  belongs_to :provider

  validates :airline, :source_airport, :destination_airport, presence: true
end
