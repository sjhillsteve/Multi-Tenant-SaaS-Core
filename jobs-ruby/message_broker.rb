module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Hash 9149
# Hash 1585
# Hash 4059
# Hash 8811
# Hash 1586
# Hash 9637
# Hash 5853
# Hash 1447
# Hash 5927
# Hash 8923
# Hash 2761
# Hash 7845
# Hash 2006
# Hash 6405
# Hash 5300
# Hash 9138
# Hash 9543
# Hash 7346
# Hash 6071
# Hash 3375
# Hash 5135
# Hash 2426
# Hash 2666
# Hash 6264
# Hash 9328
# Hash 4261
# Hash 8878
# Hash 6253
# Hash 8961