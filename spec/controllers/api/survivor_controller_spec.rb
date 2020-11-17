# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::SurvivorsController, type: :controller do
  before { set_default_headers }

  describe 'POST api.domain/survivors'
  context 'when params are correct' do
    let(:survivor) do
      {
        'survivor' =>
        {
          'name' => 'Diego',
          'age' => '25',
          'gender' => 'male',
          'latitude' => '-10',
          'longitude' => '10',
          'inventory' =>
          {
            'water' => '2',
            'food' => '3',
            'medication' => '4',
            'ammunition' => '3'
          }
        }
      }
    end

    before { post :create, params: survivor }

    it { expect(response).to have_http_status(:created) }

    it 'is expected to data attribute to include: id, type, and attributes' do
      expect(json_data).to include(:id, :type, :attributes)
    end

    it 'is expected to attributes to include survivor data' do
      expect(json_data_attributes).to include(:name, :age, :gender, :latitude, :longitude, :inventory)
    end

    it 'is expected to attributes to include survivor inventory data' do
      expect(json_data_attributes[:inventory]).to include(:water, :food, :medication, :ammunition)
    end
  end

  context 'when params are incorrect' do
  end

end
