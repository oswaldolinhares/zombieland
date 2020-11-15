# frozen_string_literal: true

require 'rails_helper'

class JsonApi < ApplicationController
end

RSpec.describe JsonApi, type: :controller do
  controller do
    def index
      render json: {}, status: :ok
    end
  end

  context 'when Accept and Content-Type are wrong' do
    before do
      request.headers['Accept'] = 'application/json'
      request.headers['Content-Type'] = 'application/json'

      get :index
    end

    it 'returns Unsupported Media Type status' do
      expect(response).to have_http_status(:not_acceptable)
    end
  end

  context 'when Accept is right and Content-Type is wrong' do
    before do
      request.headers['Accept'] = 'application/vnd.api+json'
      request.headers['Content-Type'] = 'application/json'

      get :index
    end

    it 'returns Unsupported Media Type status' do
      expect(response).to have_http_status(:unsupported_media_type)
    end
  end

  context 'when Accept is wrong and Content-Type is right' do
    before do
      request.headers['Accept'] = 'application/json'
      request.headers['Content-Type'] = 'application/vnd.api+json'

      get :index
    end

    it 'returns Unsupported Media Type status' do
      expect(response).to have_http_status(:not_acceptable)
    end
  end

  context 'when Accept and Content-Type are right' do
    before do
      request.headers['Accept'] = 'application/vnd.api+json'
      request.headers['Content-Type'] = 'application/vnd.api+json'

      get :index
    end

    it 'returns Unsupported Media Type status' do
      expect(response).to have_http_status(:ok)
    end
  end
end
