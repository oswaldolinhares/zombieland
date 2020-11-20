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
    let(:survivor) do
      {
        'survivor' =>
        {
          'name' => '',
          'age' => '25.0',
          'gender' => '',
          'latitude' => '-100',
          'longitude' => '-200',
          'inventory' =>
          {
            'water' => '-1',
            'food' => '-2',
            'medication' => '-3',
            'ammunition' => '-1.0'
          }
        }
      }
    end

    let(:error_response) do
      { "name": ["can't be blank"],
        "age": ['must be an integer'],
        "gender": ["can't be blank"],
        "latitude": ['must be greater than or equal to -90'],
        "longitude": ['must be greater than or equal to -180'],
        "items": [
          {
            "water": 'Quantity must be greater than or equal to 0',
            "food": 'Quantity must be greater than or equal to 0',
            "medication": 'Quantity must be greater than or equal to 0',
            "ammunition": 'Quantity must be an integer'
          }
        ] }
    end

    before { post :create, params: survivor }

    it { expect(response).to have_http_status(:unprocessable_entity) }

    it 'is expected to data attribute to include: id, type, and attributes' do
      expect(json_errors).to eq(error_response)
    end
  end
end
