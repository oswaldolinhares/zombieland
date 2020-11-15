class SurvivorSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :age, :gender, :latitude, :longitude
  attribute :inventory do |object|
    object.inventory.attributes.except(:water, :food, :medication, :ammunition)
  end
end
