# frozen_string_literal: true

module Providers
  class Provider2 < Base
    NAME = 'provider2'
    # TODO: should get from conf env, + encrypted
    ENDPOINT = 'http://ec2-54-246-224-31.eu-west-1.compute.amazonaws.com:8000/provider/flights2'

    def sync_data
      provider = Provider.find_or_create_by(name: NAME)
      request_data(ENDPOINT).each_slice(1000) do |batch|
        batch_data = []
        batch.each do |f|
          batch_data << convert_data(f).merge(provider_id: provider.id)
        end
        Flight.upsert_all(batch_data, unique_by: %i[airline
                                                    source_airport
                                                    destination_airport
                                                    code_share
                                                    equipment
                                                    stops
                                                    provider_id]).rows.count
      end
    end
  end
end
