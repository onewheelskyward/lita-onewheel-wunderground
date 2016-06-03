require 'rest-client'

module Lita
  module Handlers
    class OnewheelWunderground < Handler
      config :api_key

      route /^recordhigh$/, :record_high, command: true
      route /^recordlow$/, :record_low, command: true

      route /^reocrdhigh$/, :record_high, command: true
      route /^reocrdlow$/, :record_low, command: true

      def record_high(response)
        data = get_data

        record_high = data['almanac']['temp_high']['record']['F']
        record_year = data['almanac']['temp_high']['recordyear']
        normal_high = data['almanac']['temp_high']['normal']['F']
        response.reply "Normally #{normal_high}F, record high #{record_high}F in #{record_year}"
      end

      def get_data
        uri = "http://api.wunderground.com/api/#{config.api_key}/almanac/q/OR/Portland.json"
        puts "getting #{uri}"
        data = RestClient.get uri
        JSON.parse data
      end

      def record_low(response)
        data = get_data

        record_low = data['almanac']['temp_low']['record']['F']
        normal_low = data['almanac']['temp_low']['normal']['F']
        record_year = data['almanac']['temp_low']['recordyear']
        response.reply "Normally #{normal_low}F, record low #{record_low}F in #{record_year}"
      end

      Lita.register_handler(self)
    end
  end
end

