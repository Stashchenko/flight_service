# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FlightsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/flights').to route_to('flights#index', format: :json)
    end

    it 'routes to #show' do
      expect(get: '/flights/1').to route_to('flights#show', id: '1', format: :json)
    end

    it 'routes to #create' do
      expect(post: '/flights').to route_to('flights#create', format: :json)
    end

    it 'routes to #update via PUT' do
      expect(put: '/flights/1').to route_to('flights#update', id: '1', format: :json)
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/flights/1').to route_to('flights#update', id: '1', format: :json)
    end

    it 'routes to #destroy' do
      expect(delete: '/flights/1').to route_to('flights#destroy', id: '1', format: :json)
    end
  end
end
