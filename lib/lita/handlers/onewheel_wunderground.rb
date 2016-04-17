module Lita
  module Handlers
    class OnewheelWunderground < Handler
      route /^recordhigh$/, :record_high, command: true

      def record_high(response)
        response.reply "So high"
      end


      Lita.register_handler(self)
    end
  end
end
