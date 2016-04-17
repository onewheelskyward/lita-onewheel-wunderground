require 'rest-client'

module Lita
  module Handlers
    class OnewheelWunderground < Handler
      config :api_key

      route /^recordhigh$/, :record_high, command: true

      def record_high(response)
        data = get_record_high
        response.reply data.inspect
      end

      def get_record_high
        uri = "http://api.wunderground.com/api/#{config.api_key}/almanac/q/OR/Portland.json"
        puts "getting #{uri}"
        RestClient.get uri
      end

      Lita.register_handler(self)
    end
  end
end

