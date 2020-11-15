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
    #let(:survivor_attributes) { attributes_for(:survivor).merge(inventory: attributes_for(:inventory)) }
    #.merge({:item_family_id => ItemFamily.first.id})
    before { post :create, params: survivor }

    it '' do
      puts json_response
    end
  end

  context 'when params are incorrect' do
  end

end
