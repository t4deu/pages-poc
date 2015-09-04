module Api
  module V1
    class ApiController < ::ApplicationController
      protect_from_forgery with: :null_session

      before_filter :authenticate
      after_filter :cors_set_access_control_headers

      respond_to :json

      def preflight
        if request.method == "OPTIONS"
          headers["Access-Control-Allow-Origin"] = "*"
          headers["Access-Control-Allow-Methods"] = "POST, GET, PUT, DELETE, OPTIONS"
          headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-Prototype-Version, Token, X-Api-Access-Token"
          headers["Access-Control-Max-Age"] = "1728000"

          render :text => "", :content_type => "text/plain"
        end
      end

      private

      def cors_set_access_control_headers
        headers["Access-Control-Allow-Origin"] = "*"
        headers["Access-Control-Allow-Methods"] = "POST, GET, PUT, DELETE, OPTIONS"
        headers["Access-Control-Allow-Headers"] = "Origin, Content-Type, Accept, Authorization, Token, X-Api-Access-Token"
        headers["Access-Control-Max-Age"] = "1728000"
      end

      def authenticate
        authenticate_or_request_with_http_token do |token, options|
          # NOTE this in for development and POC only, fixed tokens are unsecure
          token == "secret" # Rails.application.config.secret_key_base
        end
      end
    end
  end
end
