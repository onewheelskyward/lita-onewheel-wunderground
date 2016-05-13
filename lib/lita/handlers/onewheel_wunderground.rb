require 'rest-client'

module Lita
  module Handlers
    class OnewheelWunderground < Handler
      config :api_key

      route /^recordhigh$/, :record_high, command: true
      route /^recordlow$/, :record_low, command: true

      def record_high(response)
        data = get_data

        response.reply data['almanac']['temp_high']['record']['F'] + "F in " + data['almanac']['temp_high']['recordyear']
      end

      def get_data
        uri = "http://api.wunderground.com/api/#{config.api_key}/almanac/q/OR/Portland.json"
        puts "getting #{uri}"
        data = RestClient.get uri
        JSON.parse data
      end

      def record_low(response)
        data = get_data

        response.reply data['almanac']['temp_low']['record']['F'] + "F in " + data['almanac']['temp_low']['recordyear']
      end

      Lita.register_handler(self)
    end
  end
end

