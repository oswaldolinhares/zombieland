class SurvivorSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :age, :gender, :latitude, :longitude
  attribute :inventory do |object|
    object.inventory.attributes.except('id', 'created_at', 'updated_at', 'survivor_id')
  end
end
