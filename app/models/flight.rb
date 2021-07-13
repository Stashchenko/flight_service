# frozen_string_literal: true

class Flight < ApplicationRecord
  belongs_to :provider

  scope :from_airport, ->(from) { where(source_airport: from) }

  validates :airline, :source_airport, :destination_airport, presence: true
  validates :airline, :source_airport, :destination_airport, :code_share, :stops, :equipment, :provider_id,
            uniqueness: true
end
