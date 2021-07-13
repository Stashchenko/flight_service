# frozen_string_literal: true

require 'uri'
require 'net/http'

module Providers
  class Base
    def sync_data
      raise NotImplementedError
    end

    private

    def convert_data(input_hash)
      {
        airline: input_hash['airline'],
        source_airport: input_hash['sourceAirport'],
        destination_airport: input_hash['destinationAirport'],
        code_share: input_hash['codeShare'],
        stops: input_hash['stops'],
        equipment: input_hash['equipment'],
        created_at: Time.zone.now,
        updated_at: Time.zone.now
      }
    end

    def request_data(endpoint)
      uri = URI(endpoint)
      res = Net::HTTP.get_response(uri)
      raise res unless res.is_a?(Net::HTTPSuccess)

      JSON.parse(res.body)
    end
  end
end
