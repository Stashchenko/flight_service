# frozen_string_literal: true

namespace :flight_routes do
  desc 'sync flight routes from providers'
  task sync: :environment do
    ProviderProcessor.process_flights
  end
end
