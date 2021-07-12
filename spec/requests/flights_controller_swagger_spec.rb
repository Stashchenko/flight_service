# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'flights_controller_swagger', type: :request do
  after do |example|
    example.metadata[:response][:examples] = {
      'application/json' => JSON.parse(response.body, symbolize_names: true)
    }
  end

  path '/flights' do
    get('Fetch all flights') do
      tags 'Flights'
      description 'Get all flights'
      produces 'application/json'
      consumes 'application/json'

      response '200', 'Success' do
        schema type: :object,
               properties: {
                 data: {
                   type: :array,
                   items: {
                     type: :object,
                     properties:
                       {
                         type: :flight,
                         id: { type: :integer, example: 1 },
                         airline: { type: :string, example: '2B' },
                         source_airport: { type: :string, example: 'AER' },
                         destination_airport: { type: :string, example: 'KZN' },
                         code_share: { type: :string, example: 'W13' },
                         stops: { type: :integer, example: 0 },
                         equipment: { type: :string, example: 'Q1' },
                         provider_name: { type: :string, example: 'booking' },
                         created_at: { type: :date, example: '2021-07-12T22:26:08.828Z' },
                         updated_at: { type: :date, example: '2021-07-12T22:26:08.828Z' }
                       },
                     required: %w[airline source_airport destination_airport stops equipment provider]
                   }
                 },
                 meta: {
                   type: :object,
                   properties: {
                     total_pages: { type: :integer, example: 1 }
                   }
                 }
               }
        run_test!
      end
    end

    post('Create a new flight') do
      tags 'Flights'
      description 'Create a new flight'
      produces 'application/json'
      consumes 'application/json'

      parameter name: :flight, in: :body, schema: {
        type: :object,
        properties: {
          airline: { type: :string, example: '2B' },
          source_airport: { type: :string, example: 'AER' },
          destination_airport: { type: :string, example: 'KZN' },
          code_share: { type: :string, example: 'W13' },
          stops: { type: :integer, example: 0 },
          equipment: { type: :string, example: 'Q1' },
          provider_id: { type: :integer, example: '1' }
        },
        required: %w[airline source_airport destination_airport stops equipment provider_id]
      }

      response '201', 'flight created' do
        let(:provider) { Provider.create!(name: 'test') }
        let(:flight) do
          { id: 1, airline: '2B', source_airport: 'AER', destination_airport: 'KZN', code_share: 'W13', stops: 0,
            equipment: 'Q1', provider_id: provider.id }
        end
        schema type: :object,
               properties: {
                 id: { type: :integer, example: 1 },
                 airline: { type: :string, example: '2B' },
                 source_airport: { type: :string, example: 'AER' },
                 destination_airport: { type: :string, example: 'KZN' },
                 code_share: { type: :string, example: 'W13' },
                 stops: { type: :integer, example: 0 },
                 equipment: { type: :string, example: 'Q1' },
                 provider_name: { type: :string, example: 'booking' },
                 created_at: { type: :date, example: '2021-07-12T22:26:08.828Z' },
                 updated_at: { type: :date, example: '2021-07-12T22:26:08.828Z' }
               },
               required: %w[airline source_airport destination_airport stops equipment provider]

        run_test!
      end

      response '422', 'invalid request' do
        let(:flight) { { airline: '2B' } }
        run_test!
      end
    end
  end
end
