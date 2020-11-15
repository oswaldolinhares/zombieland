# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::API
  before_action :verify_json_api_required_headers

  private

  MIME_TYPE_JSON_API = 'application/vnd.api+json'

  def verify_json_api_required_headers
    accept_header = request.headers['Accept']

    unless accept_header&.include?(MIME_TYPE_JSON_API)
      return render json: { error: 'Not Acceptable' }, status: :not_acceptable
    end

    content_type_header = request.headers['Content-Type']

    unless content_type_header&.include?(MIME_TYPE_JSON_API)
      return render json: { error: 'Unsupported Media Type' }, status: :unsupported_media_type
    end
  end
end
