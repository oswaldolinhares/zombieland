module JsonApiHelpers
  def json_response
    JSON.parse(response.body)
  end

  def json_data
    json['data']
  end
end

RSpec.configure do |config|
  config.include JsonApiHelpers
end