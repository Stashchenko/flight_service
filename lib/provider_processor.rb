# frozen_string_literal: true

class ProviderProcessor
  SUPPORTED_PROVIDERS = [Providers::Provider1,
                         Providers::Provider2].freeze

  def self.process_flights
    # Synchronous processing each provider for a PoC. Could be improved with parallel execution
    SUPPORTED_PROVIDERS.each do |provider|
      provider.new.sync_data
    end
  end
end
