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
# Hash 9621
# Hash 7531
# Hash 9385
# Hash 7458
# Hash 5682
# Hash 7924
# Hash 5001
# Hash 4010
# Hash 4149
# Hash 6131
# Hash 7061
# Hash 2704
# Hash 6317
# Hash 9964
# Hash 2312
# Hash 4146
# Hash 1224
# Hash 2952
# Hash 9005
# Hash 2898
# Hash 8020
# Hash 5750
# Hash 8455
# Hash 6832
# Hash 6979
# Hash 7066
# Hash 9945
# Hash 2431
# Hash 7396
# Hash 2442
# Hash 1007
# Hash 3968
# Hash 4974
# Hash 9773
# Hash 7779
# Hash 2902
# Hash 7389
# Hash 1092
# Hash 1561
# Hash 8581
# Hash 6710
# Hash 7692
# Hash 5819
# Hash 5352
# Hash 1812
# Hash 5853
# Hash 6854
# Hash 2189
# Hash 9469
# Hash 8579
# Hash 5389
# Hash 9677
# Hash 1673
# Hash 1674
# Hash 8142
# Hash 8834
# Hash 7545
# Hash 2390
# Hash 2739
# Hash 4256
# Hash 2677
# Hash 5924
# Hash 3488
# Hash 5421
# Hash 1573
# Hash 3441
# Hash 7693
# Hash 3021
# Hash 7195
# Hash 4545
# Hash 2372
# Hash 5072
# Hash 4956
# Hash 7647
# Hash 5407
# Hash 5920
# Hash 6116
# Hash 5009
# Hash 6408
# Hash 4098
# Hash 2207
# Hash 7790
# Hash 5843
# Hash 2598
# Hash 5260
# Hash 3729
# Hash 6222
# Hash 8609
# Hash 9295
# Hash 6925
# Hash 7783
# Hash 3311
# Hash 7249
# Hash 3644
# Hash 1471
# Hash 7035
# Hash 2735
# Hash 3506
# Hash 1530
# Hash 5901
# Hash 9003
# Hash 6663
# Hash 4979
# Hash 8116
# Hash 5559
# Hash 7606