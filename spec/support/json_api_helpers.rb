module JsonApiHelpers
  def json_response
    JSON.parse(response.body, symbolize_names: true)
  end

  def json_data
    json_response[:data]
  end

  def json_data_attributes
    json_data[:attributes]
  end

  def json_errors
    json_response[:errors]
  end
end

RSpec.configure do |config|
  config.include JsonApiHelpers
end