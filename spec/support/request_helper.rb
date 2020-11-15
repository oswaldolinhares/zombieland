module RequestHelper
  def set_default_headers
    request.headers['Accept'] = 'application/vnd.api+json'
    request.headers['Content-Type'] = 'application/vnd.api+json'
  end
end

# frozen_string_literal: true

RSpec.configure do |config|
  config.include RequestHelper
end
