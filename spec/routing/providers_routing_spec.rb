# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProvidersController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/providers').to route_to('providers#index', format: :json)
    end

    it 'routes to #show' do
      expect(get: '/providers/1').to route_to('providers#show', id: '1', format: :json)
    end

    it 'routes to #create' do
      expect(post: '/providers').to route_to('providers#create', format: :json)
    end

    it 'routes to #update via PUT' do
      expect(put: '/providers/1').to route_to('providers#update', id: '1', format: :json)
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/providers/1').to route_to('providers#update', id: '1', format: :json)
    end

    it 'routes to #destroy' do
      expect(delete: '/providers/1').to route_to('providers#destroy', id: '1', format: :json)
    end
  end
end
